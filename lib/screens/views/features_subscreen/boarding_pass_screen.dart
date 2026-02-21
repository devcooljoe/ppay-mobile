import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/boardinng_pass_details_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class BoardingPassScreen extends StatefulWidget {
  const BoardingPassScreen({super.key});

  @override
  State<BoardingPassScreen> createState() => _BoardingPassScreenState();
}

class _BoardingPassScreenState extends State<BoardingPassScreen> {
  final scrollController = ScrollController();

  bool isOpaque = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset >= 30) {
        setState(() {
          isOpaque = true;
        });
      } else {
        setState(() {
          isOpaque = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.buttonColorandText,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        animateColor: true,
        backgroundColor: isOpaque
            ? PPaymobileColors.buttonColorandText
            : Colors.transparent,
        centerTitle: true,
        title: Text(
          'Boarding Pass',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.mainScreenBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back_white.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight * 0.5,
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            controller: scrollController,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50.h),
                      width: double.infinity,
                      height: ScreenUtil().screenHeight * 0.25,
                      color: PPaymobileColors.buttonColorandText,
                      child: Image.asset(
                        'assets/images/flight_bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: ScreenUtil().screenHeight * 0.65,
                      color: Colors.white,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    90.verticalSpace,
                    Center(
                      child: SizedBox(
                        height: 762.h,
                        width: 400.w,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 751.h,
                                width: 390.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 20.h,
                                ),
                                decoration: BoxDecoration(
                                  color: PPaymobileColors.mainScreenBackground,
                                  borderRadius: BorderRadius.circular(21.r),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 3.r,
                                      color: Color(0xffD9D9D9),
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                ),
                                child: BoardinngPassDetailsScreen(),
                              ),
                            ),
                            Positioned(
                              left: -15.w,
                              top: 187.h,
                              child: Container(
                                height: 32.w,
                                width: 32.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.w,
                                    color: PPaymobileColors.deepBackgroundColor,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 1.r,
                                      color: Color(0xffD9D9D9),
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: -15.w,
                              top: 187.h,
                              child: Container(
                                height: 32.w,
                                width: 32.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.w,
                                    color: PPaymobileColors.deepBackgroundColor,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 1.r,
                                      color: Color(0xffD9D9D9),
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: -15.w,
                              top: 538.h,
                              child: Container(
                                height: 32.w,
                                width: 32.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.w,
                                    color: PPaymobileColors.deepBackgroundColor,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 1.r,
                                      color: Color(0xffD9D9D9),
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: -15.w,
                              top: 538.h,
                              child: Container(
                                height: 32.w,
                                width: 32.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.w,
                                    color: PPaymobileColors.deepBackgroundColor,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 1.r,
                                      color: Color(0xffD9D9D9),
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    45.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TouchOpacity(
                            onTap: () {},
                            child: Container(
                              height: 46.h,
                              width: 190.w,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(65).r,
                                color: PPaymobileColors.buttonColorandText,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 24.h,
                                    width: 24.h,
                                    child: SvgPicture.asset(
                                      'assets/icon/dbt.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  12.horizontalSpace,
                                  Text(
                                    'Download',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color:
                                          PPaymobileColors.mainScreenBackground,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TouchOpacity(
                            onTap: () {},
                            child: Container(
                              height: 46.h,
                              width: 190.w,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(65).r,
                                color: PPaymobileColors.mainScreenBackground,
                                border: Border.all(
                                  color: PPaymobileColors.textfieldGrey,
                                  width: 1.w,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 24.h,
                                    width: 24.h,
                                    child: SvgPicture.asset(
                                      'assets/icon/share_2.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  12.horizontalSpace,
                                  Text(
                                    'Share',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    12.verticalSpace,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
