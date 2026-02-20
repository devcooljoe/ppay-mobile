import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/refund_details_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class CancelFlightScreen extends StatefulWidget {
  const CancelFlightScreen({super.key});

  @override
  State<CancelFlightScreen> createState() => _CancelFlightScreenState();
}

class _CancelFlightScreenState extends State<CancelFlightScreen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
      backgroundColor: Colors.transparent,
      elevation: 12.w,
      child: SizedBox(
        height: 260.h,
        width: 393.w,
        child: Stack(
          children: [
            // Positioned.fill(
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            //     child: Container(color: Colors.transparent),
            //   ),
            // ),
            Positioned(
              top: 46.h,
              left: 0.w,
              right: 0.w,
              child: Container(
                height: 214.h,
                width: 393.w,
                padding: EdgeInsets.fromLTRB(14.w, 36.h, 14.w, 30.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.mainScreenBackground,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Cancel Flight',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      'Are you sure you want to cancel this flight',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    47.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TouchOpacity(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 44.h,
                            width: 175.w,
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45).r,
                              border: Border.all(
                                color: PPaymobileColors.textfieldGrey,
                                width: 1.w,
                              ),
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                            child: Center(
                              child: Text(
                                'Go Back',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TouchOpacity(
                          onTap: () async {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RefundDetailsScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 44.h,
                            width: 175.w,
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45).r,
                              color: PPaymobileColors.buttonColorandText,
                            ),
                            child: Center(
                              child: Text(
                                'Confirm',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.mainScreenBackground,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0.h,
              left: 154.w,
              right: 154.w,
              child: Container(
                height: 85.h,
                width: 85.h,
                padding: EdgeInsets.all(13).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44.r),
                  color: PPaymobileColors.mainScreenBackground,
                ),
                child: Center(
                  child: Container(
                    height: 58.h,
                    width: 58.h,
                    padding: EdgeInsets.all(12.0.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29).r,
                      color: Color(0xFFFFF9E5),
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 33.5.h,
                        width: 33.5.w,
                        child: Image.asset(
                          'assets/images/cancel_3.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
