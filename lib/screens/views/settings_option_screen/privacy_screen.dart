import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/utils/bullet_text.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
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
          'Privacy Policy',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.contain,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  46.verticalSpace,
                  Text(
                    'Our Culture',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.doneTextColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    "Your privacy is important to us. This Privacy Policy explains how we collect, use, store, and protect your personal information when you use our website, mobile app, and related services.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  56.verticalSpace,
                  Text(
                    '1. Information We Collect',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.doneTextColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'We may collect the following types of information:',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  BulletText(
                    text:
                        'Personal details: name, email, phone number, date of birth.',
                  ),
                  4.verticalSpace,
                  BulletText(
                    text:
                        'Identity information: BVN, NIN, government-issued ID, verification documents.',
                  ),
                  4.verticalSpace,
                  BulletText(
                    text:
                        'Financial data: bank details, transaction history, wallet activity.',
                  ),
                  4.verticalSpace,
                  BulletText(
                    text:
                        'Device information: IP address, device type, operating system, and app usage statistics.',
                  ),
                  4.verticalSpace,
                  BulletText(
                    text:
                        'Location data: when required to provide regulatory or service-related features.',
                  ),
                  48.verticalSpace,
                  Text(
                    '2. How We Use Your Information',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.doneTextColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'We use your information to:',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  BulletText(
                    text:
                        'Personal details: name, email, phone number, date of birth.',
                  ),
                  4.verticalSpace,
                  BulletText(
                    text:
                        'Identity information: BVN, NIN, government-issued ID, verification documents.',
                  ),
                  4.verticalSpace,
                  BulletText(
                    text:
                        'Financial data: bank details, transaction history, wallet activity.',
                  ),
                  4.verticalSpace,
                  BulletText(
                    text:
                        'Device information: IP address, device type, operating system, and app usage statistics.',
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
