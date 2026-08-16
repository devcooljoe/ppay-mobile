import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

Future<bool> showDeleteConfirmSheet(
  BuildContext context, {
  required String title,
  required String message,
  String confirmLabel = 'Remove',
}) async {
  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _DeleteConfirmSheet(
      title: title,
      message: message,
      confirmLabel: confirmLabel,
    ),
  );
  return result == true;
}

class _DeleteConfirmSheet extends StatelessWidget {
  final String title;
  final String message;
  final String confirmLabel;

  const _DeleteConfirmSheet({
    required this.title,
    required this.message,
    required this.confirmLabel,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.40,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TouchOpacity(
            onTap: () => Navigator.pop(context, false),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icon/cancel.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  16.verticalSpace,
                  Text(
                    message,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                  40.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: TouchOpacity(
                          onTap: () => Navigator.pop(context, false),
                          child: Container(
                            height: 54.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(74.r),
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: TouchOpacity(
                          onTap: () => Navigator.pop(context, true),
                          child: Container(
                            height: 54.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(74.r),
                              color: PPaymobileColors.buttonColorandText,
                            ),
                            child: Center(
                              child: Text(
                                confirmLabel,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.mainScreenBackground,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
