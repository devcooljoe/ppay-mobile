import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/bullet_text.dart';

@RoutePage()
class PrivacyPage extends HookConsumerWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Privacy Policy'),
      body: Padding(
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
    );
  }
}
