import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/support_ticket/presentation/providers/support_ticket_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_switch.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

void showSupportTicketSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const _TicketListOrCreate(),
  );
}

class _TicketListOrCreate extends HookConsumerWidget {
  const _TicketListOrCreate();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showCreate = useState(false);

    useEffect(() {
      Future.microtask(() => ref.read(ticketListProvider.notifier).load());
      return null;
    }, []);

    if (showCreate.value) {
      return _CreateTicketSheet(onBack: () => showCreate.value = false);
    }

    return _TicketListSheet(onCreate: () => showCreate.value = true);
  }
}

// ── Ticket list ──────────────────────────────────────────────────────────────

class _TicketListSheet extends HookConsumerWidget {
  final VoidCallback onCreate;
  const _TicketListSheet({required this.onCreate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ticketListProvider);

    return FractionallySizedBox(
      heightFactor: 0.84,
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
              child: SizedBox(
                height: 18.h,
                width: 18.h,
                child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown),
              ),
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
                      Text(
                        'Support Tickets',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TouchOpacity(
                        onTap: onCreate,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.buttonColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            '+ New Ticket',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  if (state.isLoading)
                    const Expanded(child: Center(child: CircularProgressIndicator()))
                  else if (state.tickets.isEmpty)
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icon/support.svg', width: 48.w, height: 48.w),
                            16.verticalSpace,
                            Text(
                              'No tickets yet',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                color: PPaymobileColors.svgIconColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.tickets.length,
                        separatorBuilder: (_, __) => Divider(
                          color: PPaymobileColors.textfiedBorder,
                          height: 1.h,
                        ),
                        itemBuilder: (context, index) {
                          final ticket = state.tickets[index];
                          return TouchOpacity(
                            onTap: () {
                              showTicketChatSheet(context, ticket.id, ticket.subject, ticket.status);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                ticket.subject,
                                                style: TextStyle(
                                                  fontFamily: 'InstrumentSans',
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            if (ticket.isUrgent)
                                              Container(
                                                margin: EdgeInsets.only(left: 6.w),
                                                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade50,
                                                  borderRadius: BorderRadius.circular(4.r),
                                                ),
                                                child: Text(
                                                  'Urgent',
                                                  style: TextStyle(
                                                    fontFamily: 'InstrumentSans',
                                                    fontSize: 10.sp,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        4.verticalSpace,
                                        Text(
                                          ticket.category.toUpperCase(),
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontSize: 11.sp,
                                            color: PPaymobileColors.svgIconColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  12.horizontalSpace,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      _StatusBadge(status: ticket.status),
                                      if (ticket.unreadUserCount > 0) ...[
                                        4.verticalSpace,
                                        Container(
                                          width: 20.w,
                                          height: 20.w,
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${ticket.unreadUserCount}',
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Create ticket ────────────────────────────────────────────────────────────

class _CreateTicketSheet extends HookConsumerWidget {
  final VoidCallback onBack;
  const _CreateTicketSheet({required this.onBack});

  static const _categories = [
    'wallet',
    'transaction',
    'account',
    'giftcard',
    'crypto',
    'other',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectCtrl = useTextEditingController();
    final messageCtrl = useTextEditingController();
    final selectedCategory = useState<String>('other');
    final isUrgent = useState(false);
    final state = ref.watch(createTicketProvider);

    ref.listen(createTicketProvider, (_, next) {
      if (next.success) {
        ref.read(createTicketProvider.notifier).reset();
        ref.read(ticketListProvider.notifier).load();
        MessageHandler.showSuccessSnackBar(context, 'Ticket submitted successfully');
        onBack();
      }
      if (next.error != null) {
        MessageHandler.showErrorSnackBar(context, next.error!);
      }
    });

    return FractionallySizedBox(
      heightFactor: 0.92,
      child: Column(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: SizedBox(
                height: 18.h,
                width: 18.h,
                child: SvgPicture.asset('assets/icon/arrow_back.svg', fit: BoxFit.scaleDown),
              ),
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Support Ticket',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 24.w,
                          width: 24.w,
                          child: SvgPicture.asset('assets/icon/support.svg', fit: BoxFit.contain),
                        ),
                      ],
                    ),
                    36.verticalSpace,
                    _Label('Category'),
                    4.verticalSpace,
                    Container(
                      height: 52.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6).r,
                        border: Border.all(color: PPaymobileColors.textfiedBorder),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedCategory.value,
                          isExpanded: true,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          items: _categories
                              .map((c) => DropdownMenuItem(
                                    value: c,
                                    child: Text(
                                      c[0].toUpperCase() + c.substring(1),
                                      style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (v) => selectedCategory.value = v ?? 'other',
                        ),
                      ),
                    ),
                    32.verticalSpace,
                    _Label('Subject'),
                    4.verticalSpace,
                    SizedBox(
                      height: 52.h,
                      child: TextFormField(
                        controller: subjectCtrl,
                        decoration: _inputDecoration('e.g Payment not going through'),
                      ),
                    ),
                    32.verticalSpace,
                    _Label('Describe Issue'),
                    4.verticalSpace,
                    SizedBox(
                      height: 156.h,
                      child: TextFormField(
                        controller: messageCtrl,
                        maxLines: 4,
                        decoration: _inputDecoration('Enter Issue'),
                      ),
                    ),
                    12.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'Mark as urgent',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        27.horizontalSpace,
                        SizedBox(
                          width: 37.w,
                          height: 20.h,
                          child: CustomSwitch(
                            value: isUrgent.value,
                            onChanged: (val) => isUrgent.value = val,
                          ),
                        ),
                      ],
                    ),
                    32.verticalSpace,
                    TouchOpacity(
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PPaymobileColors.buttonColorandText,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(42.r),
                            ),
                            elevation: 0,
                          ),
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  if (subjectCtrl.text.trim().isEmpty || messageCtrl.text.trim().isEmpty) {
                                    MessageHandler.showErrorSnackBar(context, 'Please fill all fields');
                                    return;
                                  }
                                  ref.read(createTicketProvider.notifier).submit(
                                        subject: subjectCtrl.text.trim(),
                                        category: selectedCategory.value,
                                        message: messageCtrl.text.trim(),
                                        isUrgent: isUrgent.value,
                                      );
                                },
                          child: state.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                                )
                              : Text(
                                  'Submit Ticket',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    24.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      hintText: hint,
      hintStyle: TextStyle(
        fontFamily: 'InstrumentSans',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: PPaymobileColors.svgIconColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'InstrumentSans',
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    switch (status) {
      case 'open':
        bg = Colors.blue.shade50;
        fg = Colors.blue;
        break;
      case 'in_progress':
        bg = Colors.orange.shade50;
        fg = Colors.orange;
        break;
      case 'resolved':
        bg = Colors.green.shade50;
        fg = Colors.green;
        break;
      default:
        bg = Colors.grey.shade100;
        fg = Colors.grey;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(4.r)),
      child: Text(
        status.replaceAll('_', ' ').toUpperCase(),
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          fontSize: 10.sp,
          color: fg,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ── Ticket chat sheet ────────────────────────────────────────────────────────

void showTicketChatSheet(
  BuildContext context,
  String ticketId,
  String subject,
  String status,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _TicketChatSheet(ticketId: ticketId, subject: subject, status: status),
  );
}

class _TicketChatSheet extends HookConsumerWidget {
  final String ticketId;
  final String subject;
  final String status;
  const _TicketChatSheet({required this.ticketId, required this.subject, required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ticketChatProvider(ticketId));
    final ctrl = useTextEditingController();
    final scrollCtrl = useScrollController();

    useEffect(() {
      Future.microtask(() => ref.read(ticketChatProvider(ticketId).notifier).loadMessages());
      return null;
    }, []);

    useEffect(() {
      if (state.messages.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollCtrl.hasClients) {
            scrollCtrl.animateTo(
              scrollCtrl.position.maxScrollExtent,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          }
        });
      }
      return null;
    }, [state.messages.length]);

    return FractionallySizedBox(
      heightFactor: 0.88,
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
              child: SizedBox(
                height: 18.h,
                width: 18.h,
                child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown),
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  12.verticalSpace,
                  Expanded(
                    child: state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : state.messages.isEmpty
                            ? Center(
                                child: Text(
                                  'No messages yet',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontSize: 14.sp,
                                    color: PPaymobileColors.svgIconColor,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                controller: scrollCtrl,
                                itemCount: state.messages.length,
                                itemBuilder: (_, i) {
                                  final msg = state.messages[i];
                                  final isUser = msg.sender == 'user';
                                  return Align(
                                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10.h),
                                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                                      constraints: BoxConstraints(maxWidth: 0.72.sw),
                                      decoration: BoxDecoration(
                                        color: isUser
                                            ? PPaymobileColors.buttonColor
                                            : PPaymobileColors.textfiedBorder.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(12.r),
                                      ),
                                      child: Text(
                                        msg.body,
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          fontSize: 14.sp,
                                          color: isUser ? Colors.white : Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                  ),
                  if (status == 'closed')
                    Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.lock_outline_rounded, size: 16.sp, color: Colors.grey),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              'This ticket is closed. No further messages can be sent.',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 13.sp,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 12.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: ctrl,
                            decoration: InputDecoration(
                              hintText: 'Type a message...',
                              hintStyle: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                color: PPaymobileColors.svgIconColor,
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.r),
                                borderSide: BorderSide(color: PPaymobileColors.textfiedBorder),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.r),
                                borderSide: BorderSide(color: PPaymobileColors.textfiedBorder),
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        TouchOpacity(
                          onTap: state.isSending
                              ? null
                              : () {
                                  final text = ctrl.text.trim();
                                  if (text.isEmpty) return;
                                  ctrl.clear();
                                  ref.read(ticketChatProvider(ticketId).notifier).sendMessage(text);
                                },
                          child: Container(
                            width: 44.w,
                            height: 44.w,
                            decoration: BoxDecoration(
                              color: PPaymobileColors.buttonColor,
                              shape: BoxShape.circle,
                            ),
                            child: state.isSending
                                ? const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                                  )
                                : const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
