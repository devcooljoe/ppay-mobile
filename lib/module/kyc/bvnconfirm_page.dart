import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class BvnconfirmPage extends HookConsumerWidget {
  const BvnconfirmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateController = useTextEditingController();

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime.now(),
      );
      if (picked != null) {
        dateController.text =
            '${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}';
      }
    }
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              29.verticalSpace,
              Row(
                children: [
                  TouchOpacity(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      height: 16.h,
                      width: 12.w,
                      'assets/icon/arrow_back.svg',
                    ),
                  ),
                  90.horizontalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    'Bank Verification',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 18..sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              44.verticalSpace,
              Text(
                'Confirm BVN',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black87,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              11.verticalSpace,
              Text(
                textAlign: TextAlign.start,
                'Confirming your BVN helps us verify your identity and keep your account secured',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black87,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              40.verticalSpace,
              Text(
                'Birth Date',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black87,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 15.h,
                  ),
                  hintText: '07-11-2025',
                  hintStyle: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  // prefixText: '07-11-2025',
                  // prefixStyle: TextStyle(
                  //   fontFamily: 'InstrumentSans',
                  //   fontSize: 16.sp,
                  //   fontWeight: FontWeight.w500,
                  //   color: Colors.black87,
                  // ),
                  suffix: TouchOpacity(
                    onTap: () {
                      selectDate(context);
                    },

                    child: SvgPicture.asset('assets/icon/calendar.svg'),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.textfiedBorder,
                      width: 1.w,
                    ),
                  ),
                ),
                readOnly: true,
              ),
              24.verticalSpace,
              Text(
                'Bank Verification Number (11 digit)',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black87,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 15.h,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0).r,
                    child: SvgPicture.asset('assets/icon/scan.svg'),
                  ),
                  hintText: 'Enter BVN',
                  hintStyle: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: PPaymobileColors.svgIconColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.textfiedBorder,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
