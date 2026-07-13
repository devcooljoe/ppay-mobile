import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/settings/presentation/providers/notification_prefs_provider.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsAsync = ref.watch(notificationPrefsStateProvider);

    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: PPAppBar(title: 'Notification Settings'),
      body: SafeArea(
        child: prefsAsync.when(
          loading: () => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                SkeletonLoader(width: double.infinity, height: 56.h),
                16.verticalSpace,
                SkeletonLoader(width: double.infinity, height: 56.h),
                16.verticalSpace,
                SkeletonLoader(width: double.infinity, height: 56.h),
              ],
            ),
          ),
          error: (_, __) => const SizedBox.shrink(),
          data: (prefs) => ListView(
            children: [
              Container(
                height: 16.h,
                width: double.infinity,
                color: PPaymobileColors.mainScreenBackground,
              ),
              11.verticalSpace,
              Container(
                width: double.infinity,
                color: PPaymobileColors.mainScreenBackground,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _NotificationTile(
                      svgImage: 'assets/icon/phone.svg',
                      title: 'Push Notification',
                      subtitle: 'Receive alerts directly on your device',
                      value: prefs.pushEnabled,
                      onChanged: (v) =>
                          ref.read(notificationPrefsStateProvider.notifier).togglePush(v),
                    ),
                    Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                    _NotificationTile(
                      svgImage: 'assets/icon/message.svg',
                      title: 'Email Notification',
                      subtitle: 'Receive updates via email',
                      value: prefs.emailEnabled,
                      onChanged: (v) =>
                          ref.read(notificationPrefsStateProvider.notifier).toggleEmail(v),
                    ),
                    Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                    _NotificationTile(
                      svgImage: 'assets/icon/sms.svg',
                      title: 'SMS Notification',
                      subtitle: 'Receive alerts via text message',
                      value: prefs.smsEnabled,
                      onChanged: (v) =>
                          ref.read(notificationPrefsStateProvider.notifier).toggleSms(v),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final String svgImage;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NotificationTile({
    required this.svgImage,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      leading: SizedBox(
        height: 24.w,
        width: 24.w,
        child: SvgPicture.asset(svgImage, fit: BoxFit.contain),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: PPaymobileColors.svgIconColor,
        ),
      ),
      trailing: Switch(
        value: value,
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        activeThumbColor: PPaymobileColors.buttonColor,
        activeTrackColor: PPaymobileColors.doneColor,
        inactiveThumbColor: PPaymobileColors.svgIconColor,
        inactiveTrackColor: PPaymobileColors.deepBackgroundColor,
        onChanged: onChanged,
      ),
    );
  }
}
