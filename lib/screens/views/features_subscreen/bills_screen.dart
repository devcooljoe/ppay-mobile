import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/airtime_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/bet_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/data_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/electricity_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/tv_cable_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({super.key});

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  @override
  Widget build(BuildContext context) {
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
              height: 24.h,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ElectricityScreen(),
                        ),
                      );
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TvCableScreen(),
                        ),
                      );
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AirtimeScreen(),
                        ),
                      );
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DataScreen()),
                      );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BetScreen()),
                    );
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
