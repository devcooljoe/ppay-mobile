import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class GenderBottomsheet extends StatelessWidget {
  const GenderBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PPaymobileColors.mainScreenBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Gender',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              TouchOpacity(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, size: 22.sp, color: Colors.black54),
              ),
            ],
          ),
          28.verticalSpace,
          _GenderOption(label: 'Male', value: 'male'),
          Divider(color: PPaymobileColors.filterBorderColor, height: 1.h),
          _GenderOption(label: 'Female', value: 'female'),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 24.h),
        ],
      ),
    );
  }
}

class _GenderOption extends StatelessWidget {
  final String label;
  final String value;
  const _GenderOption({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: () => Navigator.pop(context, value),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.h),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
