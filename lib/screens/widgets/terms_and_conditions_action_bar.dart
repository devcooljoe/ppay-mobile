import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class TermsAndConditionsActionBar extends StatefulWidget {
  const TermsAndConditionsActionBar({super.key});

  @override
  State<TermsAndConditionsActionBar> createState() =>
      _TermsAndConditionsActionBarState();
}

class _TermsAndConditionsActionBarState
    extends State<TermsAndConditionsActionBar> {
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      width: double.infinity,
      color: PPaymobileColors.mainScreenBackground,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
      child: Row(
        children: [
          // Disagree
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => agreed = false);
              },
              child: Container(
                height: 54.h,
                width: 188.w,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: PPaymobileColors.textfiedBorder),
                ),
                child: Text(
                  'Disagree',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          24.horizontalSpace,
          // Agree / Agreed
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => agreed = true);
              },
              child: Container(
                height: 54.h,
                width: 188.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: PPaymobileColors.backgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      agreed ? 'Agreed' : 'Agree to Terms',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: PPaymobileColors.mainScreenBackground,
                      ),
                    ),
                    if (agreed) ...[
                      10.horizontalSpace,
                      SizedBox(
                        height: 16.h,
                        width: 16.w,
                        child: SvgPicture.asset(
                          'assets/icon/tick.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
