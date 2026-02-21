import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/notification_screen.dart';
import 'package:ppay_mobile/screens/views/review_document_screen.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/bank_accounts.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/help_and_support.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/privacy_screen.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/profile_screen.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/refer_screen.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/settings_options_sub_screen/change_password.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/settings_options_sub_screen/pin_reset.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/terms_and_conditions.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/transaction_limit.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_switch.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 127.h,
              width: double.infinity,
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 68.w,
                    width: 68.w,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 31.5.r,
                          backgroundColor: PPaymobileColors.backgroundColor,
                          child: Center(
                            child: Text(
                              'AS',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.mainScreenBackground,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5.w,
                          bottom: 5.h,
                          child: CircleAvatar(
                            backgroundColor:
                                PPaymobileColors.deepBackgroundColor,
                            radius: 8.r,
                            child: Center(
                              child: SizedBox(
                                height: 12.w,
                                width: 12.w,
                                child: SvgPicture.asset(
                                  'assets/icon/edit.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Adebami Samuel',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    'adebamisamuel45@gmail.com',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  8.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 19.w,
                        width: 19.w,
                        child: Center(
                          child: Image.asset(
                            'assets/images/award.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      5.horizontalSpace,
                      Container(
                        height: 24.h,
                        width: 130.w,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45).r,
                          color: PPaymobileColors.doneColor,
                        ),
                        child: Text(
                          'Account Tier 3',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.doneTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 16.h,
              width: double.infinity,
              color: PPaymobileColors.deepBackgroundColor,
            ),
            Container(
              height: 267.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manage Account',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  18.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/profile_set.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Profile',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 12.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forward.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReviewDocumentScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/kyc_set.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  'KYC Verification',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                11.horizontalSpace,
                                Container(
                                  height: 29.h,
                                  width: 59.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/pending.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 29.h,
                            width: 59.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/verified.png'),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          5.horizontalSpace,
                          SizedBox(
                            height: 24.h,
                            width: 12.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forward.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BankAccounts()),
                      );
                    },
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/saved_bank_set.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Saved Bank Account',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 12.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forward.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 16.h,
              width: double.infinity,
              color: PPaymobileColors.deepBackgroundColor,
            ),
            Container(
              height: 335.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Security & Notification Setting',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  18.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePassword(),
                        ),
                      );
                    },
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/change_pass_set.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Change Password',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 12.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forward.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PinReset()),
                      );
                    },
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/change_pin_set.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Change Transaction Pin',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 12.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forward.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  Container(
                    height: 56.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 38.w,
                                width: 38.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19.r),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/enable_biom_set.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              Text(
                                'Enable Biometric',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                          width: 37.w,
                          child: CustomSwitch(
                            value: isEnabled,
                            onChanged: (val) {
                              setState(() {
                                isEnabled = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                          width: 12.w,
                          child: SvgPicture.asset(
                            'assets/icon/arrow_forward.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/notif_set.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Notification Settings',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 12.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forward.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 16.h,
              width: double.infinity,
              color: PPaymobileColors.deepBackgroundColor,
            ),
            Container(
              height: 131.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Limit',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  18.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionLimit(),
                        ),
                      );
                    },
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/transc_lim_set.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Transactions Limit',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 12.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forward.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 16.h,
              width: double.infinity,
              color: PPaymobileColors.deepBackgroundColor,
            ),
            Container(
              height: 131.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Referral',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  18.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReferScreen()),
                      );
                    },
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/refer_set.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Refer & Earn',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 12.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forward.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 16.h,
              width: double.infinity,
              color: PPaymobileColors.deepBackgroundColor,
            ),
            Container(
              height: 267.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms & Support',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  18.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsAndConditions(),
                        ),
                      );
                    },
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/terms_set.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Terms & Condition',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 12.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forward.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/privacy_set.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 12.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forward.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpSupportScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 56.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 38.w,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/help_set.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Help & Support',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 12.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forward.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 16.h,
              width: double.infinity,
              color: PPaymobileColors.deepBackgroundColor,
            ),
            Container(
              height: 131.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign out',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  18.verticalSpace,
                  Container(
                    height: 56.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 38.w,
                                width: 38.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19.r),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/logout_set.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              Text(
                                'Logout',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.transactRed,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                          width: 12.w,
                          child: SvgPicture.asset(
                            'assets/icon/arrow_forward.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
