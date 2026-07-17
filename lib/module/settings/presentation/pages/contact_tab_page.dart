import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide MessageHandler;
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/live_chat_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/ticket_bottomsheet.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ContactTabPage extends HookConsumerWidget {
  const ContactTabPage({super.key});

  static const _supportEmail = 'support@pinnaclepay.ng';
  static const _supportPhone = '+2348034693028';
  static const _whatsappNumber = '2348034693028';

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      children: [
        32.verticalSpace,
        Text(
          'How can we help you?',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        6.verticalSpace,
        Text(
          'Choose a channel below to reach our support team.',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        28.verticalSpace,
        _ContactTile(
          icon: 'assets/icon/chat.svg',
          title: 'Live Chat',
          subtitle: 'Chat with a support agent in real time',
          onTap: () => showLiveChatSheet(context),
        ),
        _ContactTile(
          icon: 'assets/icon/message.svg',
          title: 'Support Ticket',
          subtitle: 'Submit a ticket and we\'ll get back to you',
          onTap: () => showSupportTicketSheet(context),
        ),
        _ContactTile(
          icon: 'assets/icon/whatsapp.svg',
          title: 'WhatsApp',
          subtitle: 'Message us on WhatsApp',
          onTap: () => _launchUrl('https://wa.me/$_whatsappNumber'),
        ),
        _ContactTile(
          icon: 'assets/icon/call.svg',
          title: 'Call Support',
          subtitle: _supportPhone,
          onTap: () => _launchUrl('tel:$_supportPhone'),
          trailing: TouchOpacity(
            onTap: () {
              Clipboard.setData(const ClipboardData(text: _supportPhone));
              MessageHandler.showSuccessSnackBar(context, 'Phone number copied');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                border: Border.all(color: PPaymobileColors.textfiedBorder),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                'Copy',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        _ContactTile(
          icon: 'assets/icon/message.svg',
          title: 'Email Us',
          subtitle: _supportEmail,
          onTap: () => _launchUrl('mailto:$_supportEmail'),
          trailing: TouchOpacity(
            onTap: () {
              Clipboard.setData(const ClipboardData(text: _supportEmail));
              MessageHandler.showSuccessSnackBar(context, 'Email address copied');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                border: Border.all(color: PPaymobileColors.textfiedBorder),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                'Copy',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        32.verticalSpace,
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: PPaymobileColors.deepBackgroundColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Support Hours',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.verticalSpace,
              _SupportHourRow(day: 'Monday – Friday', hours: '8:00 AM – 8:00 PM'),
              4.verticalSpace,
              _SupportHourRow(day: 'Saturday', hours: '9:00 AM – 5:00 PM'),
              4.verticalSpace,
              _SupportHourRow(day: 'Sunday', hours: 'Closed'),
            ],
          ),
        ),
        24.verticalSpace,
      ],
    );
  }
}

class _ContactTile extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  const _ContactTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          border: Border.all(color: PPaymobileColors.textfiedBorder),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: PPaymobileColors.deepBackgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: SvgPicture.asset(icon, width: 20.w, height: 20.w, fit: BoxFit.contain),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null) ...[
              8.horizontalSpace,
              trailing!,
            ] else ...[
              SvgPicture.asset(
                'assets/icon/arrow_forward.svg',
                width: 16.w,
                height: 16.w,
                fit: BoxFit.contain,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SupportHourRow extends StatelessWidget {
  final String day;
  final String hours;

  const _SupportHourRow({required this.day, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          hours,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
