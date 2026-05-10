import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/bvn_reason_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_date_picker.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class BvnVerificationPage extends HookConsumerWidget {
  const BvnVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateController = useTextEditingController();
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'BVN Verification',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              40.verticalSpace,
              PPLabel(text: 'Birth Date'),
              4.verticalSpace,
              SizedBox(
                height: 54.h,
                width: double.infinity,
                child: TextFormField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () async {
                    /// 👉 THIS is where the dialog is called
                    final selectedDate = await showDialog<DateTime>(
                      context: context,
                      builder: (_) => const CustomDatePickerDialog(),
                    );
                    if (selectedDate != null) {
                      dateController.text =
                          "${selectedDate.day.toString().padLeft(2, '0')}/"
                          "${selectedDate.month.toString().padLeft(2, '0')}/"
                          "${selectedDate.year}";
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 14.h,
                    ),
                    hintText: '09/11/2009',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: SizedBox(
                      height: 24.w,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/icon/calendar.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              24.verticalSpace,
              PPLabel(text: 'Bank Verification Number (11 digit)'),
              4.verticalSpace,
              SizedBox(
                height: 54.h,
                width: double.infinity,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 14.h,
                    ),
                    hintText: 'Enter BVN',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: SizedBox(
                      height: 24.w,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/icon/face_scan.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.redTextfield,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              4.verticalSpace,
              Text(
                'Incorrect BVN. Enter correct BVN',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.cryptoNumbersColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              160.verticalSpace,
              PPButton(
                text: 'Proceed',
                onPressed: () async {},
                backgroundColor: PPaymobileColors.anotherButtonColor,
              ),
              10.verticalSpace,
              PPButton(
                text: 'Proceed',
                onPressed: () => context.router.push(BvnFaceRecogRoute()),
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
                child: SizedBox(
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
                        'Why BVN is Needed?',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.doneTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: PPaymobileColors.doneTextColor,
                          decorationThickness: 2.h,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
