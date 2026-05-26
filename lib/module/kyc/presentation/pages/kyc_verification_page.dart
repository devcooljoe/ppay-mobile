import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/document_bottom_sheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';

@RoutePage()
class KycVerificationPage extends HookConsumerWidget {
  const KycVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: '',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: ListView(
            children: [
              21.verticalSpace,
              Text(
                'Submit Document',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              7.verticalSpace,
              Text(
                'Please submit any of your government issued document',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              64.verticalSpace,
              PPLabel(text: 'Document'),
              4.verticalSpace,
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return DocumentBottomSheet();
                    },
                  );
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    readOnly: true,
                    showCursor: false,
                    controller: TextEditingController(
                      text: 'Driver\'s License',
                    ),
                    decoration: InputDecoration(
                      suffixIcon: SizedBox(
                        height: 13.h,
                        width: 7.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_down.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      hintText: 'Select Document',
                      hintStyle: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.textfiedBorder,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 14.h,
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
              ),
              32.verticalSpace,
              PPLabel(text: 'Enter Passport number'),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Number',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
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
              14.verticalSpace,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0).r,
                    child: SvgPicture.asset(
                      'assets/icon/info.svg',
                      width: 14.w,
                      height: 14.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  9.horizontalSpace,
                  Expanded(
                    child: Text(
                      'Enter your Driver’s License ID number as displayed on the front of your license card',
                      style: TextStyle(
                        decorationColor: PPaymobileColors.highlightTextColor,
                        fontFamily: 'Montserrat',
                        color: PPaymobileColors.buttonColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              178.verticalSpace,
              PPButton(
                text: 'Continue',
                onPressed: () {},
                backgroundColor: PPaymobileColors.textfiedBorder,
              ),
              10.verticalSpace,
              PPButton(
                text: 'Continue',
                onPressed: () => context.router.push(KycFaceVerificationRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
