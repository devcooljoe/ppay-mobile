import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/kyc/kyc_face_verification_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/document_bottom_sheet.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class KycVerificationPage extends HookConsumerWidget {
  const KycVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
              Text(
                'Enter Passport number',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
              TouchOpacity(
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PPaymobileColors.textfiedBorder,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(42.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: PPaymobileColors.mainScreenBackground,
                      ),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              TouchOpacity(
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PPaymobileColors.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(42.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KycFaceVerificationPage(),
                        ),

                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: PPaymobileColors.mainScreenBackground,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
              ),
      ),
    );  }
