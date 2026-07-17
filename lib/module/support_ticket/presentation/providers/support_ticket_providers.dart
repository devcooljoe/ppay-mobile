import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/support_ticket/domain/entities/support_ticket_entity.dart';
import 'package:ppay_mobile/module/support_ticket/domain/repositories/support_ticket_repository.dart';

// ── State classes ────────────────────────────────────────────────────────────

class TicketListState {
  final bool isLoading;
  final List<SupportTicketEntity> tickets;
  final String? error;

  const TicketListState({
    this.isLoading = false,
    this.tickets = const [],
    this.error,
  });

  TicketListState copyWith({bool? isLoading, List<SupportTicketEntity>? tickets, String? error}) {
    return TicketListState(
      isLoading: isLoading ?? this.isLoading,
      tickets: tickets ?? this.tickets,
      error: error,
    );
  }
}

class TicketChatState {
  final bool isLoading;
  final bool isSending;
  final List<SupportMessageEntity> messages;
  final String? error;

  const TicketChatState({
    this.isLoading = false,
    this.isSending = false,
    this.messages = const [],
    this.error,
  });

  TicketChatState copyWith({
    bool? isLoading,
    bool? isSending,
    List<SupportMessageEntity>? messages,
    String? error,
  }) {
    return TicketChatState(
      isLoading: isLoading ?? this.isLoading,
      isSending: isSending ?? this.isSending,
      messages: messages ?? this.messages,
      error: error,
    );
  }
}

class CreateTicketState {
  final bool isLoading;
  final bool success;
  final String? error;

  const CreateTicketState({this.isLoading = false, this.success = false, this.error});

  CreateTicketState copyWith({bool? isLoading, bool? success, String? error}) {
    return CreateTicketState(
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      error: error,
    );
  }
}

// ── Notifiers ────────────────────────────────────────────────────────────────

class TicketListNotifier extends StateNotifier<TicketListState> {
  final SupportTicketRepository _repository;

  TicketListNotifier(this._repository) : super(const TicketListState());

  Future<void> load() async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _repository.getMyTickets();
    result.fold(
      (failure) => state = state.copyWith(isLoading: false, error: failure.message),
      (tickets) => state = state.copyWith(isLoading: false, tickets: tickets),
    );
  }
}

class TicketChatNotifier extends StateNotifier<TicketChatState> {
  final SupportTicketRepository _repository;
  final String ticketId;

  TicketChatNotifier(this._repository, this.ticketId) : super(const TicketChatState());

  Future<void> loadMessages() async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _repository.getTicketMessages(ticketId);
    result.fold(
      (failure) => state = state.copyWith(isLoading: false, error: failure.message),
      (messages) => state = state.copyWith(isLoading: false, messages: messages),
    );
  }

  Future<void> sendMessage(String body) async {
    if (body.trim().isEmpty) return;
    state = state.copyWith(isSending: true);
    final result = await _repository.sendMessage(ticketId, body.trim());
    result.fold(
      (failure) => state = state.copyWith(isSending: false, error: failure.message),
      (message) => state = state.copyWith(
        isSending: false,
        messages: [...state.messages, message],
      ),
    );
  }
}

class CreateTicketNotifier extends StateNotifier<CreateTicketState> {
  final SupportTicketRepository _repository;

  CreateTicketNotifier(this._repository) : super(const CreateTicketState());

  Future<void> submit({
    required String subject,
    required String category,
    required String message,
    required bool isUrgent,
  }) async {
    state = state.copyWith(isLoading: true, error: null, success: false);
    final result = await _repository.createTicket(
      subject: subject,
      category: category,
      message: message,
      isUrgent: isUrgent,
    );
    result.fold(
      (failure) => state = state.copyWith(isLoading: false, error: failure.message),
      (_) => state = state.copyWith(isLoading: false, success: true),
    );
  }

  void reset() => state = const CreateTicketState();
}

// ── Providers ────────────────────────────────────────────────────────────────

final _supportTicketRepoProvider = Provider<SupportTicketRepository>(
  (_) => getIt<SupportTicketRepository>(),
);

final ticketListProvider = StateNotifierProvider<TicketListNotifier, TicketListState>(
  (ref) => TicketListNotifier(ref.read(_supportTicketRepoProvider)),
);

final ticketChatProvider = StateNotifierProvider.family<TicketChatNotifier, TicketChatState, String>(
  (ref, ticketId) => TicketChatNotifier(ref.read(_supportTicketRepoProvider), ticketId),
);

final createTicketProvider = StateNotifierProvider<CreateTicketNotifier, CreateTicketState>(
  (ref) => CreateTicketNotifier(ref.read(_supportTicketRepoProvider)),
);
