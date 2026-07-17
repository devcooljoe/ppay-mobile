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

    String formatDob(String? dob) {
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
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => context.router.push(EditProfileRoute()),
                    child: Stack(
                      children: [
                        user?.picture != null
                            ? CircleAvatar(
                                radius: 40.r,
                                backgroundImage: NetworkImage(user!.picture!),
                              )
                            : CircleAvatar(
                                radius: 40.r,
                                backgroundColor: PPaymobileColors.backgroundColor,
                                child: Text(
                                  initials,
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.mainScreenBackground,
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            backgroundColor: PPaymobileColors.deepBackgroundColor,
                            radius: 10.r,
                            child: SvgPicture.asset(
                              'assets/icon/edit.svg',
                              width: 12.w,
                              height: 12.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    user?.fullName ?? '',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    user?.emailAddress ?? '',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.verticalSpace,
                  _ProfileRow(label: 'Full Name', value: user?.fullName ?? '—'),
                  _ProfileDivider(),
                  _ProfileRow(label: 'Email Address', value: user?.emailAddress ?? '—'),
                  _ProfileDivider(),
                  _ProfileRow(label: 'Phone Number', value: user?.phoneNumber ?? '—'),
                  _ProfileDivider(),
                  _ProfileRow(label: 'Date of Birth', value: formatDob(user?.dob)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: PPaymobileColors.deepBackgroundColor,
    );
  }
}

class _ProfileRow extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: PPaymobileColors.svgIconColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
