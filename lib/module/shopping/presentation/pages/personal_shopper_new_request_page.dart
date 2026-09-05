import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/support_ticket/presentation/providers/support_ticket_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class PersonalShopperNewRequestPage extends HookConsumerWidget {
  const PersonalShopperNewRequestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectCtrl = useTextEditingController();
    final messageCtrl = useTextEditingController();
    final isUrgent = useState(false);
    final createState = ref.watch(createTicketProvider);

    Future<void> onSubmit() async {
      final subject = subjectCtrl.text.trim();
      final message = messageCtrl.text.trim();

      if (subject.isEmpty) {
        MessageHandler.showErrorSnackBar(
          context,
          'Please describe what you need',
        );
        return;
      }
      if (message.length < 20) {
        MessageHandler.showErrorSnackBar(
          context,
          'Please provide more details (at least 20 characters)',
        );
        return;
      }

      await ref
          .read(createTicketProvider.notifier)
          .submit(
            subject: subject,
            category: 'personal_shopper',
            message: message,
            isUrgent: isUrgent.value,
          );

      if (!context.mounted) return;
      final state = ref.read(createTicketProvider);
      if (state.error != null) {
        MessageHandler.showErrorSnackBar(context, state.error!);
      } else if (state.success) {
        final createdTicketId = state.createdTicketId;
        ref.read(createTicketProvider.notifier).reset();
        ref.read(ticketListProvider.notifier).load();
        MessageHandler.showSuccessSnackBar(
          context,
          'Request submitted! We\'ll get back to you shortly.',
        );
        if (createdTicketId != null) {
          context.router.replace(
            PersonalShopperChatRoute(ticketId: createdTicketId),
          );
        } else {
          context.router.maybePop();
        }
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'New Request'),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            32.verticalSpace,

            // Info banner
            Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: PPaymobileColors.deepBackgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 18.w,
                    color: PPaymobileColors.buttonColorandText,
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Text(
                      'Tell us exactly what you\'re looking for: product name, brand, size, color, budget, or any other details. Our team will source it and respond in your chat.',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.svgIconColor,
                        fontSize: 12.sp,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            24.verticalSpace,

            _Label('What are you looking for?'),
            8.verticalSpace,
            TextFormField(
              controller: subjectCtrl,
              decoration: _inputDecoration('e.g. Nike Air Max size 42, black'),
              style: _inputStyle(),
            ),

            20.verticalSpace,

            _Label('Describe in detail'),
            8.verticalSpace,
            TextFormField(
              controller: messageCtrl,
              maxLines: 6,
              decoration: _inputDecoration(
                'Include brand, size, color, quantity, budget, and any other requirements...',
              ),
              style: _inputStyle(),
            ),

            20.verticalSpace,

            // Urgent toggle
            TouchOpacity(
              onTap: () => isUrgent.value = !isUrgent.value,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color:
                      isUrgent.value
                          ? const Color(0xFFFFF3CD)
                          : PPaymobileColors.deepBackgroundColor,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color:
                        isUrgent.value
                            ? const Color(0xFFFFD700)
                            : PPaymobileColors.textfiedBorder,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.bolt_rounded,
                      size: 20.w,
                      color:
                          isUrgent.value
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
                            'Urgent requests are prioritised by our team',
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
                        color:
                            isUrgent.value
                                ? const Color(0xFFE67E22)
                                : Colors.transparent,
                        border: Border.all(
                          color:
                              isUrgent.value
                                  ? const Color(0xFFE67E22)
                                  : PPaymobileColors.textfiedBorder,
                          width: 2,
                        ),
                      ),
                      child:
                          isUrgent.value
                              ? Icon(
                                Icons.check,
                                size: 14.w,
                                color: Colors.white,
                              )
                              : null,
                    ),
                  ],
                ),
              ),
            ),

            32.verticalSpace,

            PPButton(
              text: createState.isLoading ? 'Submitting...' : 'Submit Request',
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
      borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1),
      borderRadius: BorderRadius.circular(6).r,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: PPaymobileColors.buttonColorandText,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(6).r,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1),
      borderRadius: BorderRadius.circular(6).r,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
  );

  TextStyle _inputStyle() => TextStyle(
    fontFamily: 'InstrumentSans',
    color: Colors.black,
    fontSize: 14.sp,
  );
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
