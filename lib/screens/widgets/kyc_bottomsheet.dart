import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/model/kyc_verification_model.dart';
import 'package:ppay_mobile/screens/views/kyc_verification_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class KycBottomsheet extends StatefulWidget {
  const KycBottomsheet({super.key});

  @override
  State<KycBottomsheet> createState() => _KycBottomsheetState();
}

List<KycVerificationModel> kycVerificationReq = [
  KycVerificationModel(
    leadingImage: 'assets/icon/key_1.svg',
    titleText: 'Bank Verification Number',
    subtitleText: 'Verify your BVN and face ID to confirm your identity',
    trailingIcon: 'assets/icon/check.svg',
  ),
  KycVerificationModel(
    leadingImage: 'assets/icon/userid.svg',
    titleText: 'KYC Verification',
    subtitleText:
        'To confirm your personal information with your issued country ID',
    trailingIcon: 'assets/icon/arrow_forward.svg',
  ),
];

class _KycBottomsheetState extends State<KycBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.85,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: TouchOpacity(
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
                  child: SvgPicture.asset(
                    'assets/icon/cancel.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 40.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 153.h,
                    width: 192.w,
                    child: Image.asset(
                      'assets/images/kycillustration.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    'Complete Identity Verification',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Please complete your verification to access all features',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                  12.verticalSpace,
                  Container(
                    height: 267.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 22.h,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: kycVerificationReq.length,
                      separatorBuilder: (context, index) =>
                          Column(children: [17.verticalSpace]),
                      itemBuilder: (context, index) {
                        final opacity = index == 0 ? 0.5 : 1.0;
                        return IntrinsicHeight(
                          child: Column(
                            children: [
                              TouchOpacity(
                                onTap: () {},
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Opacity(
                                        opacity: opacity,
                                        child: SizedBox(
                                          height: 24.h,
                                          width: 24.h,
                                          child: SvgPicture.asset(
                                            kycVerificationReq[index]
                                                .leadingImage,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Opacity(
                                    opacity: opacity,
                                    child: Text(
                                      kycVerificationReq[index].titleText,
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  subtitle: Opacity(
                                    opacity: opacity,
                                    child: Text(
                                      kycVerificationReq[index].subtitleText,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontSize: 13.sp,
                                        color: Color(0xff5B5B5B),
                                      ),
                                    ),
                                  ),
                                  trailing: SizedBox(
                                    height: 28.w,
                                    width: 28.w,
                                    child: SvgPicture.asset(
                                      kycVerificationReq[index].trailingIcon,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 1.h,
                                color: PPaymobileColors.textfiedBorder,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  41.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 17.w,
                          width: 17.w,
                          child: SizedBox(
                            height: 14.h,
                            width: 11.w,
                            child: SvgPicture.asset(
                              'assets/icon/filledlock.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Your data will be encrypted and stored securely',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: PPaymobileColors.svgIconColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.verticalSpace,
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
                              builder: (context) {
                                return KycVerificationScreen();
                              },
                            ),
                          );
                        },

                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
