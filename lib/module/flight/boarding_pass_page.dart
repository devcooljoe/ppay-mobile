import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/flight/boardinng_pass_details_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class BoardingPassPage extends HookConsumerWidget {
  const BoardingPassPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final isOpaque = useState(false);

    useEffect(() {
      void listener() {
        if (scrollController.offset >= 30) {
          isOpaque.value = true;
        } else {
          isOpaque.value = false;
        }
      }
      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);
    return Scaffold(
      backgroundColor: PPaymobileColors.buttonColorandText,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        animateColor: true,
        backgroundColor: isOpaque.value
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
                                child: BoardinngPassDetailsPage(),
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
