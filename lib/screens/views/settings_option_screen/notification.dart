import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Notification Settings',
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
        child: ListView(
          children: [
            Container(
              height: 16.h,
              width: double.infinity,
              color: PPaymobileColors.mainScreenBackground,
            ),
            11.verticalSpace,
            Expanded(
              child: Container(
                width: double.infinity,
                color: PPaymobileColors.mainScreenBackground,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _notificationTile(
                      svgImage: 'assets/icon/phone.svg',
                      title: 'Push Notification',
                      value: true,
                      onChanged: (value) {},
                    ),
                    15.verticalSpace,
                    _notificationTile(
                      svgImage: 'assets/icon/message.svg',
                      title: 'Email Notification',
                      value: false,
                      onChanged: (value) {},
                    ),
                    15.verticalSpace,
                    _notificationTile(
                      svgImage: 'assets/icon/sms.svg',
                      title: 'SMS Notification',
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _notificationTile({
  required String svgImage,
  required String title,
  required bool value,
  required Function(bool) onChanged,
}) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
    leading: SizedBox(
      height: 24.h,
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
    trailing: Switch(
      value: value,
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.transparent;
        }
        return Colors.transparent;
      }),
      activeThumbColor: PPaymobileColors.buttonColor,
      activeTrackColor: PPaymobileColors.doneColor,
      inactiveThumbColor: PPaymobileColors.svgIconColor,
      inactiveTrackColor: PPaymobileColors.deepBackgroundColor,
      onChanged: onChanged,
    ),
  );
}
