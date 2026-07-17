import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ppay_mobile/module/support_ticket/presentation/providers/support_ticket_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

void showLiveChatSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const LiveChatSheet(),
  );
}

void showLiveChatSheetForTicket(BuildContext context, String ticketId, String subject) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => LiveChatSheet(ticketId: ticketId, subject: subject),
  );
}

class LiveChatSheet extends HookConsumerWidget {
  final String? ticketId;
  final String? subject;

  const LiveChatSheet({super.key, this.ticketId, this.subject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ticketId;

    if (id == null) {
      return _NoTicketPlaceholder();
    }

    return _ChatView(ticketId: id, subject: subject ?? 'Support Chat');
  }
}

class _NoTicketPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icon/chat_black.svg', width: 48.w, height: 48.w),
                    16.verticalSpace,
                    Text(
                      'Open a support ticket to start chatting',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        color: PPaymobileColors.svgIconColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatView extends HookConsumerWidget {
  final String ticketId;
  final String subject;

  const _ChatView({required this.ticketId, required this.subject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ticketChatProvider(ticketId));
    final messageCtrl = useTextEditingController();
    final scrollCtrl = useScrollController();

    useEffect(() {
      Future.microtask(() => ref.read(ticketChatProvider(ticketId).notifier).loadMessages());
      return null;
    }, [ticketId]);

    // Auto-scroll to bottom when new messages arrive
    useEffect(() {
      if (state.messages.isNotEmpty) {
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
    }, [state.messages.length]);

    return FractionallySizedBox(
      heightFactor: 0.92,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          subject,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 24.w,
                        width: 24.w,
                        child: SvgPicture.asset('assets/icon/chat_black.svg', fit: BoxFit.contain),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  if (state.isLoading)
                    const Expanded(child: Center(child: CircularProgressIndicator()))
                  else
                    Expanded(
                      child: state.messages.isEmpty
                          ? Center(
                              child: Text(
                                'No messages yet. Start the conversation!',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 13.sp,
                                  color: PPaymobileColors.svgIconColor,
                                ),
                              ),
                            )
                          : ListView.builder(
                              controller: scrollCtrl,
                              itemCount: state.messages.length,
                              itemBuilder: (context, index) {
                                final msg = state.messages[index];
                                final isUser = msg.sender == 'user';
                                return _MessageBubble(
                                  text: msg.body,
                                  isUser: isUser,
                                  time: DateFormat('hh:mm a').format(msg.createdAt.toLocal()),
                                );
                              },
                            ),
                    ),
                  16.verticalSpace,
                  _Composer(
                    controller: messageCtrl,
                    isSending: state.isSending,
                    onSend: () {
                      final text = messageCtrl.text.trim();
                      if (text.isEmpty) return;
                      ref.read(ticketChatProvider(ticketId).notifier).sendMessage(text);
                      messageCtrl.clear();
                    },
                  ),
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final String time;

  const _MessageBubble({required this.text, required this.isUser, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isUser)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 28.w,
                    width: 28.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14).r,
                      color: PPaymobileColors.buttonColor,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icon/support_white.svg',
                        width: 16.w,
                        height: 16.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  6.horizontalSpace,
                  Text(
                    'Support',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            if (!isUser) 4.verticalSpace,
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 268.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: isUser ? PPaymobileColors.buttonColor : PPaymobileColors.deepBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16).r,
                    topRight: Radius.circular(16).r,
                    bottomLeft: isUser ? Radius.circular(16).r : Radius.zero,
                    bottomRight: isUser ? Radius.zero : Radius.circular(16).r,
                  ),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 13.sp,
                    color: isUser ? Colors.white : Colors.black,
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

  const _Composer({required this.controller, required this.isSending, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: PPaymobileColors.textfiedBorder),
        color: PPaymobileColors.deepBackgroundColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Send message',
                hintStyle: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 14.sp,
                  color: PPaymobileColors.svgIconColor,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
              style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, color: Colors.black),
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => onSend(),
            ),
          ),
          8.horizontalSpace,
          GestureDetector(
            onTap: isSending ? null : onSend,
            child: isSending
                ? SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  )
                : SizedBox(
                    height: 26.w,
                    width: 26.w,
                    child: SvgPicture.asset('assets/icon/sent.svg', fit: BoxFit.scaleDown),
                  ),
          ),
        ],
      ),
    );
  }
}
