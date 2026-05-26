import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

Future<void> showInactivitySheet(
  BuildContext context, {
  required bool hasLocalAuth,
  required VoidCallback onLogout,
  VoidCallback? onStay,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    isDismissible: false,
    enableDrag: false,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => PopScope(
      canPop: false,
      child: _InactivitySheetContainer(
        hasLocalAuth: hasLocalAuth,
        onLogout: onLogout,
        onStay: onStay,
      ),
    ),
  );
}

class _InactivitySheetContainer extends StatelessWidget {
  final bool hasLocalAuth;
  final VoidCallback onLogout;
  final VoidCallback? onStay;

  const _InactivitySheetContainer({
    required this.hasLocalAuth,
    required this.onLogout,
    this.onStay,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(28.r),
        topRight: Radius.circular(28.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.access_time, size: 48.w, color: Colors.black),
            SizedBox(height: 16.h),
            Text(
              hasLocalAuth ? 'Are you still here?' : 'Session Expired!',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h),
            Text(
              hasLocalAuth
                  ? 'Authenticate to continue your session'
                  : 'Your session has expired due to inactivity. Please log in again to continue.',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            if (hasLocalAuth) ...[
              Row(
                children: [
                  Expanded(
                    child: PPButton(text: 'Sign Out', onPressed: onLogout),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: PPButton(
                      text: 'Yes',
                      backgroundColor: Colors.black,
                      onPressed: onStay ?? () {},
                    ),
                  ),
                ],
              ),
            ] else ...[
              SizedBox(
                width: double.infinity,
                child: PPButton(text: 'Sign Out', onPressed: onLogout),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
