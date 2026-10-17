import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:url_launcher/url_launcher.dart';

void showDeleteAccountDialog(BuildContext context) {
  showDialog(context: context, builder: (_) => const DeleteAccountDialog());
}

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 28.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Delete Account',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            6.verticalSpace,
            Text(
              'Are you sure you want to delete your account? This action cannot be undone.',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: PPaymobileColors.svgIconColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 52.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  launchUrl(
                    Uri.parse('https://pinnaclepay.ng/delete-account'),
                    mode: LaunchMode.inAppBrowserView,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PPaymobileColors.transactRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 18.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: PPaymobileColors.deepBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: PPaymobileColors.darkGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
