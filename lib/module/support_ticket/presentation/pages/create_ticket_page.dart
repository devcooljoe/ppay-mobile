import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/support_ticket/presentation/providers/support_ticket_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

const _categories = <_CategoryOption>[
  _CategoryOption('general', 'General'),
  _CategoryOption('billing', 'Billing'),
  _CategoryOption('technical', 'Technical'),
  _CategoryOption('personal_shopper', 'Personal Shopper'),
];

@RoutePage()
class CreateTicketPage extends HookConsumerWidget {
  const CreateTicketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectCtrl = useTextEditingController();
    final messageCtrl = useTextEditingController();
    final category = useState<String>('general');
    final isUrgent = useState(false);
    final createState = ref.watch(createTicketProvider);

    Future<void> onSubmit() async {
      final subject = subjectCtrl.text.trim();
      final message = messageCtrl.text.trim();

      if (subject.isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Please enter a subject');
        return;
      }
      if (message.length < 20) {
        MessageHandler.showErrorSnackBar(
          context,
          'Please provide more details (at least 20 characters)',
        );
        return;
      }

      await ref.read(createTicketProvider.notifier).submit(
            subject: subject,
            category: category.value,
            message: message,
            isUrgent: isUrgent.value,
          );

      if (!context.mounted) return;
      final state = ref.read(createTicketProvider);
      if (state.error != null) {
        MessageHandler.showErrorSnackBar(context, state.error!);
      } else if (state.success) {
        ref.read(createTicketProvider.notifier).reset();
        ref.read(ticketListProvider.notifier).load();
        MessageHandler.showSuccessSnackBar(
          context,
          'Ticket created successfully',
        );
        context.router.maybePop();
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'New Ticket',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            24.verticalSpace,
            _Label('Subject'),
            8.verticalSpace,
            TextFormField(
              controller: subjectCtrl,
              decoration: _inputDecoration('Brief summary of your issue'),
              style: _inputStyle(),
            ),
            20.verticalSpace,
            _Label('Category'),
            8.verticalSpace,
            _CategoryDropdown(
              value: category.value,
              onChanged: (v) => category.value = v,
            ),
            20.verticalSpace,
            _Label('Message'),
            8.verticalSpace,
            TextFormField(
              controller: messageCtrl,
              maxLines: 6,
              decoration: _inputDecoration(
                'Describe your issue in detail...',
              ),
              style: _inputStyle(),
            ),
            20.verticalSpace,
            TouchOpacity(
              onTap: () => isUrgent.value = !isUrgent.value,
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: isUrgent.value
                      ? const Color(0xFFFFF3CD)
                      : PPaymobileColors.deepBackgroundColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: isUrgent.value
                        ? const Color(0xFFFFD700)
                        : PPaymobileColors.textfiedBorder,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.bolt_rounded,
                      size: 20.w,
                      color: isUrgent.value
                          ? const Color(0xFFE67E22)
                          : PPaymobileColors.svgIconColor,
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mark as Urgent',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          2.verticalSpace,
                          Text(
                            'Urgent tickets are prioritised by our team',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.svgIconColor,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 22.w,
                      width: 22.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isUrgent.value
                            ? const Color(0xFFE67E22)
                            : Colors.transparent,
                        border: Border.all(
                          color: isUrgent.value
                              ? const Color(0xFFE67E22)
                              : PPaymobileColors.textfiedBorder,
                          width: 2,
                        ),
                      ),
                      child: isUrgent.value
                          ? Icon(Icons.check, size: 14.w, color: Colors.white)
                          : null,
                    ),
                  ],
                ),
              ),
            ),
            32.verticalSpace,
            PPButton(
              text: 'Submit Ticket',
              isLoading: createState.isLoading,
              onPressed: createState.isLoading ? null : onSubmit,
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'InstrumentSans',
          color: PPaymobileColors.textfiedBorder,
          fontSize: 14.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: PPaymobileColors.textfiedBorder, width: 1),
          borderRadius: BorderRadius.circular(6).r,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: PPaymobileColors.buttonColorandText, width: 1.5),
          borderRadius: BorderRadius.circular(6).r,
        ),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: PPaymobileColors.textfiedBorder, width: 1),
          borderRadius: BorderRadius.circular(6).r,
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      );

  TextStyle _inputStyle() => TextStyle(
        fontFamily: 'InstrumentSans',
        color: Colors.black,
        fontSize: 14.sp,
      );
}

class _CategoryOption {
  final String value;
  final String label;
  const _CategoryOption(this.value, this.label);
}

class _CategoryDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const _CategoryDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: PPaymobileColors.textfiedBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: PPaymobileColors.svgIconColor,
          ),
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 14.sp,
          ),
          items: _categories
              .map(
                (c) => DropdownMenuItem<String>(
                  value: c.value,
                  child: Text(c.label),
                ),
              )
              .toList(),
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
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
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
