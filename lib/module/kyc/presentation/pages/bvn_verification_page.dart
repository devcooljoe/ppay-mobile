import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide MessageHandler;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/kyc/presentation/providers/kyc_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/bvn_reason_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_date_picker.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class BvnVerificationPage extends HookConsumerWidget {
  const BvnVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final dateController = useTextEditingController();
    final bvnController = useTextEditingController();
    final selectedDate = useState<DateTime?>(null);

    ref.listen(verifyBvnProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        next.whenData((_) {
          context.router.replace(const KycVerificationRoute());
        });
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
      }
    });

    void handleProceed() {
      if (!(formKey.currentState?.validate() ?? false)) return;

      // Format dob as YYYY-MM-DD for the API
      final d = selectedDate.value!;
      final dob =
          '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

      ref.read(verifyBvnProvider.notifier).call(
            bvn: bvnController.text.trim(),
            dob: dob,
          );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'BVN Verification',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                44.verticalSpace,
                Text(
                  'Confirm BVN',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                11.verticalSpace,
                Text(
                  'Confirming your BVN helps us verify your identity and keep your account secured',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                40.verticalSpace,
                const PPLabel(text: 'Date of Birth'),
                4.verticalSpace,
                TextFormField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () async {
                    final picked = await showDialog<DateTime>(
                      context: context,
                      builder: (_) => const CustomDatePickerDialog(),
                    );
                    if (picked != null) {
                      selectedDate.value = picked;
                      dateController.text =
                          '${picked.day.toString().padLeft(2, '0')}/'
                          '${picked.month.toString().padLeft(2, '0')}/'
                          '${picked.year}';
                    }
                  },
                  validator: (_) =>
                      selectedDate.value == null ? 'Please select your date of birth' : null,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    hintText: 'DD/MM/YYYY',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(14.r),
                      child: SvgPicture.asset(
                        'assets/icon/calendar.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.redTextfield, width: 1.w),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.redTextfield, width: 1.w),
                    ),
                  ),
                ),
                24.verticalSpace,
                const PPLabel(text: 'Bank Verification Number (BVN)'),
                4.verticalSpace,
                TextFormField(
                  controller: bvnController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your BVN';
                    }
                    if (value.length != 11) {
                      return 'BVN must be exactly 11 digits';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    hintText: 'Enter your 11-digit BVN',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(14.r),
                      child: SvgPicture.asset(
                        'assets/icon/face_scan.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.lightGrey, width: 1.w),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.redTextfield, width: 1.w),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide:
                          BorderSide(color: PPaymobileColors.redTextfield, width: 1.w),
                    ),
                  ),
                ),
                20.verticalSpace,
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icon/info.svg',
                      width: 14.w,
                      height: 14.h,
                    ),
                    9.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Your BVN is an 11-digit number on your bank card or accessible via *565*0#',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.buttonColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                60.verticalSpace,
                PPButton(
                  text: 'Proceed',
                  onPressed: handleProceed,
                ),
                15.verticalSpace,
                TouchOpacity(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const BvnReasonBottomsheet(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24.w,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/info.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      7.horizontalSpace,
                      Text(
                        'Why is BVN Needed?',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.doneTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: PPaymobileColors.doneTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
