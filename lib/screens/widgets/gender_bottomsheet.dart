import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class GenderBottomsheet extends StatefulWidget {
  const GenderBottomsheet({super.key});

  @override
  State<GenderBottomsheet> createState() => _GenderBottomsheetState();
}

class _GenderBottomsheetState extends State<GenderBottomsheet> {
  String selectedValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.45,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          /// Close button (same as before)
          Transform.translate(
            offset: const Offset(0, 0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30).r,
                  color: PPaymobileColors.mainScreenBackground,
                ),
                child: Center(
                  child: SizedBox(
                    height: 18.h,
                    width: 18.h,
                    child: SvgPicture.asset(
                      'assets/icon/cancel.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    'Select Gender',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  29.verticalSpace,
                  // Options
                  _optionTile('Male'),
                  45.verticalSpace,
                  _optionTile('Female'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _optionTile(String value) {
    final isSelected = selectedValue == value;

    return SizedBox(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedValue = value);
          Navigator.pop(context, value);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            // Radio indicator
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? PPaymobileColors.backgroundColor
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: PPaymobileColors.backgroundColor,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
