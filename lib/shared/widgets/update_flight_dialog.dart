import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ppay_mobile/module/flight/update_flight_search_card.dart';

class UpdateFlightDialog extends HookWidget {
  const UpdateFlightDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.r)),
      child: SizedBox(
        height: 503.h,
        width: double.infinity,
        child: UpdateFlightSearchCard(),
      ),
    );
  }
}
