import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Column(
            children: [
              17.verticalSpace,
              SizedBox(
                height: 53.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 53.h,
                          width: 53.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/profilepic.png'),
                            ),
                            borderRadius: BorderRadius.circular(27.r),
                          ),
                        ),
                        12.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                3.horizontalSpace,
                                SizedBox(
                                  height: 17.h,
                                  width: 17.w,
                                  child: Image.asset(
                                    'assets/images/thumbs.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Mary Evans',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 47.h,
                      width: 47.w,
                      decoration: BoxDecoration(
                        color: PPaymobileColors.textfiedBorder,
                        borderRadius: BorderRadius.circular(23.r),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: SvgPicture.asset(
                                'assets/icon/notif.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            left: 25,
                            child: SizedBox(
                              height: 9.h,
                              width: 9.w,
                              child: SvgPicture.asset(
                                'assets/icon/newnotif.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              19.verticalSpace,
              Container(
                height: 223.h,
                padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: PPaymobileColors.backgroundColor,
                  borderRadius: BorderRadius.circular(19.r),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Image.asset(
                          'assets/images/earthbackground1.png',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        height: 29.h,
                        width: 77.w,
                        decoration: BoxDecoration(
                          color: PPaymobileColors.buttonColorandText,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 29.h,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Wallet Balance',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        PPaymobileColors.mainScreenBackground,
                                  ),
                                ),
                                8.horizontalSpace,
                                SizedBox(
                                  height: 25.h,
                                  width: 25.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/eye-slash.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            6.verticalSpace,
                            Text(
                              '₦5,000,000.00',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w600,
                                color: PPaymobileColors.mainScreenBackground,
                              ),
                            ),
                            27.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 46.h,
                                  width: 173.w,
                                  decoration: BoxDecoration(
                                    color: PPaymobileColors.buttonColorandText,
                                    borderRadius: BorderRadius.circular(26.r),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 24.w,
                                          height: 24.h,
                                          child: SvgPicture.asset(
                                            'assets/icon/fund.svg',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        4.horizontalSpace,
                                        Text(
                                          'Fund Wallet',
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: PPaymobileColors
                                                .mainScreenBackground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 46.h,
                                  width: 173.w,
                                  decoration: BoxDecoration(
                                    color: PPaymobileColors.buttonColorandText,
                                    borderRadius: BorderRadius.circular(26.r),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 24.w,
                                          height: 24.h,
                                          child: SvgPicture.asset(
                                            'assets/icon/transfer.svg',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        4.horizontalSpace,
                                        Text(
                                          'Transfer',
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: PPaymobileColors
                                                .mainScreenBackground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
