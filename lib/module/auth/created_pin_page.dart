import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class CreatedPinPage extends StatefulWidget {
  const CreatedPinPage({super.key});

  @override
  State<CreatedPinPage> createState() => _CreatedPinPageState();
}

class _CreatedPinPageState extends State<CreatedPinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              54.verticalSpace,
              SizedBox(
                height: 140.w,
                width: 140.w,
                child: Image.asset(
                  'assets/images/big_check.png',
                  fit: BoxFit.contain,
                ),
              ),
              60.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Transaction Pin Created',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    'Your transaction pin has been successfully created. Please keep your pin safe',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  76.verticalSpace,
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
                          context.router.push(SetUpFingerprintRoute());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Go To Dashboard',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            7.horizontalSpace,
                            SizedBox(
                              height: 24.w,
                              width: 24.w,
                              child: SvgPicture.asset(
                                'assets/icon/arrow_forwardw.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
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
    );
  }
}
