import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class TermsAndConditionsActionBar extends HookConsumerWidget {
  const TermsAndConditionsActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agreed = useState(false);
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
              onTap: () => agreed.value = false,
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
              onTap: () => agreed.value = true,
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
                      agreed.value ? 'Agreed' : 'Agree to Terms',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: PPaymobileColors.mainScreenBackground,
                      ),
                    ),
                    if (agreed.value) ...[
                      10.horizontalSpace,
                      SizedBox(
                        height: 16.w,
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
