import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/services/token_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// ── Constants ────────────────────────────────────────────────────────────────

const _wsBaseUrl = 'wss://app.pinnaclepay.ng/ws/live-chat';

// ── Message model ────────────────────────────────────────────────────────────

class LiveChatMessage {
  final String body;
  final String sender; // 'user' | 'admin'
  final DateTime createdAt;

  const LiveChatMessage({
    required this.body,
    required this.sender,
    required this.createdAt,
  });
}

// ── State ────────────────────────────────────────────────────────────────────

enum LiveChatStatus { idle, connecting, waiting, active, ended, error }

class LiveChatState {
  final LiveChatStatus status;
  final List<LiveChatMessage> messages;
  final String? sessionId;
  final String? statusMessage;
  final String? adminName;
  final bool adminIsTyping;

  const LiveChatState({
    this.status = LiveChatStatus.idle,
    this.messages = const [],
    this.sessionId,
    this.statusMessage,
    this.adminName,
    this.adminIsTyping = false,
  });

  LiveChatState copyWith({
    LiveChatStatus? status,
    List<LiveChatMessage>? messages,
    String? sessionId,
    String? statusMessage,
    String? adminName,
    bool? adminIsTyping,
    bool clearAdminName = false,
  }) {
    return LiveChatState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      sessionId: sessionId ?? this.sessionId,
      statusMessage: statusMessage ?? this.statusMessage,
      adminName: clearAdminName ? null : (adminName ?? this.adminName),
      adminIsTyping: adminIsTyping ?? this.adminIsTyping,
    );
  }
}

// ── Notifier ─────────────────────────────────────────────────────────────────

class LiveChatNotifier extends StateNotifier<LiveChatState> {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  Timer? _typingDebounce;
  bool _lastTypingSent = false;

  LiveChatNotifier() : super(const LiveChatState());

  Future<void> connect() async {
    if (state.status == LiveChatStatus.connecting || state.status == LiveChatStatus.waiting || state.status == LiveChatStatus.active) return;

    state = const LiveChatState(status: LiveChatStatus.connecting);

    final token = getIt<TokenService>().token;
    if (token == null) {
      state = state.copyWith(status: LiveChatStatus.error, statusMessage: 'Not authenticated');
      return;
    }

    try {
      final uri = Uri.parse('$_wsBaseUrl?token=${Uri.encodeComponent(token)}&role=user');
      _channel = WebSocketChannel.connect(uri);

      _subscription = _channel!.stream.listen(
        _onMessage,
        onError: _onError,
        onDone: _onDone,
      );
    } catch (e) {
      state = state.copyWith(status: LiveChatStatus.error, statusMessage: 'Failed to connect');
    }
  }

  void _onMessage(dynamic raw) {
    final Map<String, dynamic> msg = jsonDecode(raw as String);
    final type = msg['type'] as String?;

    switch (type) {
      case 'connected':
        state = state.copyWith(
          status: LiveChatStatus.waiting,
          sessionId: msg['sessionId'] as String?,
          statusMessage: msg['message'] as String?,
        );
        break;

      case 'admin_joined':
        state = state.copyWith(
          status: LiveChatStatus.active,
          adminName: msg['adminName'] as String?,
          statusMessage: msg['message'] as String?,
        );
        break;

      case 'admin_left':
        state = state.copyWith(
          status: LiveChatStatus.waiting,
          statusMessage: msg['message'] as String?,
          clearAdminName: true,
        );
        break;

      case 'typing':
        state = state.copyWith(adminIsTyping: msg['isTyping'] == true);
        break;

      case 'message':
        final newMsg = LiveChatMessage(
          body: msg['body'] as String,
          sender: msg['sender'] as String,
          createdAt: DateTime.tryParse(msg['createdAt'] as String? ?? '') ?? DateTime.now(),
        );
        // Deduplicate: if this is our own optimistic message echoed back, skip adding again
        if (msg['sender'] == 'user') {
          // Already added optimistically in sendMessage — just update timestamp if needed
          break;
        }
        state = state.copyWith(messages: [...state.messages, newMsg], adminIsTyping: false);
        break;

      case 'ended':
        state = state.copyWith(
          status: LiveChatStatus.ended,
          statusMessage: 'Chat session ended.',
        );
        _cleanup();
        break;

      case 'error':
        state = state.copyWith(statusMessage: msg['message'] as String?);
        break;
    }
  }

  void _onError(dynamic error) {
    state = state.copyWith(status: LiveChatStatus.error, statusMessage: 'Connection error');
    _cleanup();
  }

  void _onDone() {
    if (state.status != LiveChatStatus.ended) {
      state = state.copyWith(status: LiveChatStatus.ended, statusMessage: 'Disconnected from server');
    }
    _cleanup();
  }

  void sendTyping() {
    if (state.status != LiveChatStatus.active && state.status != LiveChatStatus.waiting) return;
    if (!_lastTypingSent) {
      _lastTypingSent = true;
      _channel?.sink.add(jsonEncode({'type': 'typing', 'isTyping': true}));
    }
    _typingDebounce?.cancel();
    _typingDebounce = Timer(const Duration(seconds: 3), () {
      _lastTypingSent = false;
      _channel?.sink.add(jsonEncode({'type': 'typing', 'isTyping': false}));
    });
  }

  void sendMessage(String body) {
    if (body.trim().isEmpty) return;
    // Allow sending while waiting (before admin joins) or active
    if (state.status != LiveChatStatus.active && state.status != LiveChatStatus.waiting) return;
    final optimistic = LiveChatMessage(
      body: body.trim(),
      sender: 'user',
      createdAt: DateTime.now(),
    );
    state = state.copyWith(messages: [...state.messages, optimistic]);
    _channel?.sink.add(jsonEncode({'type': 'message', 'body': body.trim()}));
  }

  void endChat() {
    _channel?.sink.add(jsonEncode({'type': 'end'}));
    state = state.copyWith(status: LiveChatStatus.ended, statusMessage: 'You ended the chat.');
    _cleanup();
  }

  void reset() {
    _cleanup();
    state = const LiveChatState();
  }

  void _cleanup() {
    _typingDebounce?.cancel();
    _subscription?.cancel();
    _channel?.sink.close();
    _typingDebounce = null;
    _subscription = null;
    _channel = null;
  }

  @override
  void dispose() {
    _cleanup();
    super.dispose();
  }
}

// ── Provider ─────────────────────────────────────────────────────────────────

final liveChatProvider = StateNotifierProvider.autoDispose<LiveChatNotifier, LiveChatState>(
  (_) => LiveChatNotifier(),
);
