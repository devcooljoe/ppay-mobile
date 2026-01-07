import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/terms_and_conditions_action_bar.dart';
import 'package:ppay_mobile/utils/bullet_text.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
          'Terms & Conditions',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    46.verticalSpace,
                    Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      'Last Updated: 04 July, 2025',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      'Please read them carefully before proceeding.',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    56.verticalSpace,
                    Text(
                      '1. Acceptance of Terms',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.doneTextColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      'By accessing or using [App Name], you confirm that you are at least 18 years old and agree to comply with these Terms. If you do not agree, please do not use the app.',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
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
                      'Pinnaclepay provides financial services including but not limited to:',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    4.verticalSpace,
                    BulletText(text: 'Digital wallet services'),
                    4.verticalSpace,
                    BulletText(text: 'Money transfers'),
                    4.verticalSpace,
                    BulletText(text: 'Virtual cards'),
                    4.verticalSpace,
                    BulletText(text: 'Currency exchange'),
                    4.verticalSpace,
                    BulletText(text: 'Bill payments'),
                    4.verticalSpace,
                    BulletText(text: 'Gift card transactions'),
                    4.verticalSpace,
                    BulletText(text: 'Any future updates or added features'),
                    4.verticalSpace,
                    Text(
                      'We may modify or update our services at any time.',
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
              48.verticalSpace,
              TermsAndConditionsActionBar(),
            ],
          ),
        ),
      ),
    );
  }
}
