import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/support_ticket/domain/entities/support_ticket_entity.dart';
import 'package:ppay_mobile/module/support_ticket/presentation/providers/support_ticket_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class TicketChatPage extends HookConsumerWidget {
  final String ticketId;
  final String subject;

  const TicketChatPage({
    super.key,
    required this.ticketId,
    required this.subject,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(ticketChatProvider(ticketId));
    final ticketState = ref.watch(ticketListProvider);
    final messageCtrl = useTextEditingController();
    final scrollCtrl = useScrollController();

    final SupportTicketEntity? ticket =
        ticketState.tickets.where((t) => t.id == ticketId).firstOrNull;

    useEffect(() {
      Future.microtask(
        () => ref.read(ticketChatProvider(ticketId).notifier).loadMessages(),
      );
      return null;
    }, [ticketId]);

    // Auto-scroll to bottom on new messages.
    useEffect(() {
      if (chatState.messages.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollCtrl.hasClients) {
            scrollCtrl.animateTo(
              scrollCtrl.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      }
      return null;
    }, [chatState.messages.length]);

    final isClosed = ticket?.status == 'closed';

    Future<void> onSend() async {
      final text = messageCtrl.text.trim();
      if (text.isEmpty) return;
      messageCtrl.clear();
      await ref.read(ticketChatProvider(ticketId).notifier).sendMessage(text);
      if (!context.mounted) return;
      final state = ref.read(ticketChatProvider(ticketId));
      if (state.error != null) {
        MessageHandler.showErrorSnackBar(context, state.error!);
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: ticket?.subject ?? subject,
        onBackPressed: () => Navigator.pop(context),
        actions: [
          if (ticket != null)
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Center(child: _StatusPill(status: ticket.status)),
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: chatState.isLoading
                  ? _LoadingSkeleton()
                  : chatState.error != null
                      ? _ErrorView(
                          message: chatState.error!,
                          onRetry: () => ref
                              .read(ticketChatProvider(ticketId).notifier)
                              .loadMessages(),
                        )
                      : chatState.messages.isEmpty
                          ? Center(
                              child: Text(
                                'No messages yet.\nOur team will respond shortly.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.svgIconColor,
                                  fontSize: 13.sp,
                                  height: 1.6,
                                ),
                              ),
                            )
                          : ListView.builder(
                              controller: scrollCtrl,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 16.h,
                              ),
                              itemCount: chatState.messages.length,
                              itemBuilder: (context, index) {
                                final msg = chatState.messages[index];
                                final showDate = index == 0 ||
                                    !_sameDay(
                                      chatState.messages[index - 1].createdAt,
                                      msg.createdAt,
                                    );
                                return Column(
                                  children: [
                                    if (showDate) _DateDivider(msg.createdAt),
                                    _MessageBubble(message: msg),
                                  ],
                                );
                              },
                            ),
            ),
            if (isClosed)
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                color: PPaymobileColors.deepBackgroundColor,
                child: Text(
                  'This ticket has been closed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 13.sp,
                  ),
                ),
              )
            else
              _Composer(
                controller: messageCtrl,
                isSending: chatState.isSending,
                onSend: onSend,
              ),
          ],
        ),
      ),
    );
  }

  bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}

class _StatusPill extends StatelessWidget {
  final String status;
  const _StatusPill({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String label;
    switch (status) {
      case 'resolved':
        color = PPaymobileColors.buttonColor;
        label = 'Resolved';
        break;
      case 'closed':
        color = PPaymobileColors.svgIconColor;
        label = 'Closed';
        break;
      case 'in_progress':
        color = const Color(0xFFE67E22);
        label = 'In Progress';
        break;
      default:
        color = const Color(0xFF2980B9);
        label = 'Open';
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _DateDivider extends StatelessWidget {
  final DateTime date;
  const _DateDivider(this.date);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String label;
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      label = 'Today';
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      label = 'Yesterday';
    } else {
      label = DateFormat('dd MMM yyyy').format(date);
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Divider(color: PPaymobileColors.deepBackgroundColor),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.svgIconColor,
                fontSize: 11.sp,
              ),
            ),
          ),
          Expanded(
            child: Divider(color: PPaymobileColors.deepBackgroundColor),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final SupportMessageEntity message;
  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == 'user';
    final time = DateFormat('hh:mm a').format(message.createdAt.toLocal());

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isUser) ...[
              Text(
                'PPay Team',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              4.verticalSpace,
            ],
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 268.w),
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: isUser
                      ? PPaymobileColors.buttonColor
                      : PPaymobileColors.deepBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16).r,
                    topRight: Radius.circular(16).r,
                    bottomLeft: isUser ? Radius.circular(16).r : Radius.zero,
                    bottomRight: isUser ? Radius.zero : Radius.circular(16).r,
                  ),
                ),
                child: Text(
                  message.body,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 13.sp,
                    color: isUser ? Colors.white : Colors.black,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            4.verticalSpace,
            Text(
              time,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 10.sp,
                color: PPaymobileColors.svgIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Composer extends StatelessWidget {
  final TextEditingController controller;
  final bool isSending;
  final VoidCallback onSend;

  const _Composer({
    required this.controller,
    required this.isSending,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: PPaymobileColors.mainScreenBackground,
        border: Border(
          top: BorderSide(color: PPaymobileColors.deepBackgroundColor),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: PPaymobileColors.deepBackgroundColor,
                borderRadius: BorderRadius.circular(24.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: TextField(
                controller: controller,
                maxLines: null,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => onSend(),
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                ),
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          10.horizontalSpace,
          TouchOpacity(
            onTap: isSending ? null : onSend,
            child: Container(
              height: 44.w,
              width: 44.w,
              decoration: BoxDecoration(
                color: PPaymobileColors.buttonColorandText,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isSending
                    ? SizedBox(
                        width: 18.w,
                        height: 18.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 20.w,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SkeletonLoader(
              width: 220.w,
              height: 48.h,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          16.verticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: SkeletonLoader(
              width: 180.w,
              height: 40.h,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          16.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: SkeletonLoader(
              width: 240.w,
              height: 56.h,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: PPaymobileColors.svgIconColor,
              fontSize: 13.sp,
            ),
          ),
          12.verticalSpace,
          TextButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
