import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/update_flight_search_card.dart';

class UpdateFlightDialog extends StatefulWidget {
  const UpdateFlightDialog({super.key});

  @override
  State<UpdateFlightDialog> createState() => _UpdateFlightDialogState();
}

class _UpdateFlightDialogState extends State<UpdateFlightDialog> {
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
