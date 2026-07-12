import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';

@RoutePage()
class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticatedUserProvider).value;

    final initials = useMemoized(() {
      if (user == null) return '';
      final parts = user.fullName.trim().split(' ');
      if (parts.length >= 2) {
        return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      }
      return user.fullName.isNotEmpty ? user.fullName[0].toUpperCase() : '';
    }, [user?.fullName]);

    final tierLabel = useMemoized(() {
      if (user == null) return 'Tier 1';
      return 'Tier ${user.tier}';
    }, [user?.tier]);

    final isVerified = user?.isKycVerified ?? false;

    String _formatDob(String? dob) {
      if (dob == null || dob.isEmpty) return 'Not set';
      try {
        final date = DateTime.parse(dob);
        return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
      } catch (_) {
        return dob;
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: PPAppBar(
        title: 'Profile',
        onBackPressed: () => Navigator.pop(context),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: () => context.router.push(EditProfileRoute()),
              child: Text(
                'Edit',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.doneTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  45.verticalSpace,
                  Container(
                    height: 68.w,
                    width: 68.w,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        user?.picture != null
                            ? CircleAvatar(
                                radius: 31.5.r,
                                backgroundImage: NetworkImage(user!.picture!),
                              )
                            : CircleAvatar(
                                radius: 31.5.r,
                                backgroundColor: PPaymobileColors.backgroundColor,
                                child: Center(
                                  child: Text(
                                    initials,
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
                            backgroundColor: PPaymobileColors.deepBackgroundColor,
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
                  4.verticalSpace,
                  Text(
                    user?.fullName ?? '',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  25.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Account Level:',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 19.w,
                            width: 19.w,
                            child: Image.asset(
                              'assets/images/award.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          12.horizontalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                tierLabel,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.doneTextColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                                height: 24.h,
                                child: SvgPicture.asset(
                                  'assets/icon/arrow_forward.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  19.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Account Verification:',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        height: 24.h,
                        width: 80.w,
                        padding: EdgeInsets.symmetric(horizontal: 7.w),
                        color: isVerified
                            ? PPaymobileColors.doneColor
                            : PPaymobileColors.deepBackgroundColor,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 12.w,
                              width: 12.w,
                              child: SvgPicture.asset(
                                isVerified
                                    ? 'assets/icon/check.svg'
                                    : 'assets/icon/cancel.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            6.horizontalSpace,
                            Text(
                              isVerified ? 'Verified' : 'Pending',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: isVerified
                                    ? PPaymobileColors.highlightTextColor
                                    : PPaymobileColors.svgIconColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20.w,
                top: 24.w,
                right: 20.w,
                bottom: 24.h,
              ),
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _ProfileRow(label: 'Full Name:', value: user?.fullName ?? '—'),
                  24.verticalSpace,
                  _ProfileRow(label: 'Email Address:', value: user?.emailAddress ?? '—'),
                  24.verticalSpace,
                  _ProfileRow(label: 'Date of Birth:', value: _formatDob(user?.dob)),
                  24.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phone No:',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.svgIconColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            user?.phoneNumber ?? '—',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          6.horizontalSpace,
                          SizedBox(
                            height: 20.w,
                            width: 20.w,
                            child: SvgPicture.asset(
                              'assets/icon/paste.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
