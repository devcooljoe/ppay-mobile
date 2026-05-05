import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class BillsPage extends HookConsumerWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Bills Payments',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
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
              32.verticalSpace,
              Text(
                'Select Bills',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Conveniently pay for any of your bills. Enjoy fast and secured transactions',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              32.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TouchOpacity(
                    onTap: () {
                      context.router.push(ElectricityRoute());
                    },
                    child: SizedBox(
                      height: 111.h,
                      width: 188.w,
                      child: Image.asset(
                        'assets/images/elect.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  TouchOpacity(
                    onTap: () {
                      context.router.push(TvCableRoute());
                    },
                    child: SizedBox(
                      height: 111.h,
                      width: 188.w,
                      child: Image.asset(
                        'assets/images/tvsub.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              19.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TouchOpacity(
                    onTap: () {
                      context.router.push(AirtimeRoute());
                    },
                    child: SizedBox(
                      height: 111.h,
                      width: 188.w,
                      child: Image.asset(
                        'assets/images/airtime.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  TouchOpacity(
                    onTap: () {
                      context.router.push(DataRoute());
                    },
                    child: SizedBox(
                      height: 111.h,
                      width: 188.w,
                      child: Image.asset(
                        'assets/images/data.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              19.verticalSpace,
              Align(
                alignment: Alignment.topLeft,
                child: TouchOpacity(
                  onTap: () {
                    context.router.push(BetRoute());
                  },
                  child: SizedBox(
                    height: 111.h,
                    width: 188.w,
                    child: Image.asset(
                      'assets/images/bet.png',
                      fit: BoxFit.contain,
                    ),
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
