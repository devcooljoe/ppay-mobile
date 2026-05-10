import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_switch.dart';
import 'package:ppay_mobile/shared/widgets/settings_menu_item.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = useState(false);
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
                  SettingsMenuItem(
                    imagePath: 'assets/images/profile_set.png',
                    title: 'Profile',
                    onTap: () => context.router.push(ProfileRoute()),
                  ),
                  12.verticalSpace,
                  SettingsMenuItem(
                    imagePath: 'assets/images/kyc_set.png',
                    title: 'KYC Verification',
                    onTap: () => context.router.push(ReviewDocumentRoute()),
                    trailing: Container(
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
                  ),
                  12.verticalSpace,
                  SettingsMenuItem(
                    imagePath: 'assets/images/saved_bank_set.png',
                    title: 'Saved Bank Account',
                    onTap: () => context.router.push(BankAccountRoute()),
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
                  SettingsMenuItem(
                    imagePath: 'assets/images/change_pass_set.png',
                    title: 'Change Password',
                    onTap: () => context.router.push(ChangePasswordRoute()),
                  ),
                  12.verticalSpace,
                  SettingsMenuItem(
                    imagePath: 'assets/images/change_pin_set.png',
                    title: 'Change Transaction Pin',
                    onTap: () => context.router.push(PinResetRoute()),
                  ),
                  12.verticalSpace,
                  SettingsMenuItem(
                    imagePath: 'assets/images/enable_biom_set.png',
                    title: 'Enable Biometric',
                    trailing: SizedBox(
                      height: 20.h,
                      width: 37.w,
                      child: CustomSwitch(
                        value: isEnabled.value,
                        onChanged: (val) => isEnabled.value = val,
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  SettingsMenuItem(
                    imagePath: 'assets/images/notif_set.png',
                    title: 'Notification Settings',
                    onTap: () => context.router.push(NotificationRoute()),
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
                  SettingsMenuItem(
                    imagePath: 'assets/images/transc_lim_set.png',
                    title: 'Transactions Limit',
                    onTap: () => context.router.push(TransactionLimitRoute()),
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
                  SettingsMenuItem(
                    imagePath: 'assets/images/refer_set.png',
                    title: 'Refer & Earn',
                    onTap: () => context.router.push(ReferRoute()),
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
                  SettingsMenuItem(
                    imagePath: 'assets/images/terms_set.png',
                    title: 'Terms & Condition',
                    onTap: () => context.router.push(TermsAndConditionRoute()),
                  ),
                  12.verticalSpace,
                  SettingsMenuItem(
                    imagePath: 'assets/images/privacy_set.png',
                    title: 'Privacy Policy',
                    onTap: () => context.router.push(PrivacyRoute()),
                  ),
                  12.verticalSpace,
                  SettingsMenuItem(
                    imagePath: 'assets/images/help_set.png',
                    title: 'Help & Support',
                    onTap: () => context.router.push(HelpAndSupportRoute()),
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
                  SettingsMenuItem(
                    imagePath: 'assets/images/logout_set.png',
                    title: 'Logout',
                    titleColor: PPaymobileColors.transactRed,
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
