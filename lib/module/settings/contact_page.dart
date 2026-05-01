import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/expandable.dart';
import 'package:ppay_mobile/shared/widgets/live_chat_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/ticket_bottomsheet.dart';

@RoutePage()
class ContactTabPage extends HookConsumerWidget {
  const ContactTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  Widget contactTile(String image, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        border: Border.all(color: PPaymobileColors.textfiedBorder),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 20.w,
                width: 20.w,
                child: SvgPicture.asset(image, fit: BoxFit.contain),
              ),
              10.horizontalSpace,
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
            width: 12.w,
            child: SvgPicture.asset(
              'assets/icon/arrow_forward.svg',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),

  }

  Widget contactAction(String text, String button) {
    return Row(
      children: [
        SizedBox(
          height: 16.w,
          width: 16.w,
          child: SvgPicture.asset(
            'assets/icon/indicator.svg',
            fit: BoxFit.contain,
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: PPaymobileColors.svgIconColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          height: 28.h,
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6).r,
            border: Border.all(
              color: PPaymobileColors.textfiedBorder,
              width: 1.w,
            ),
          ),
          child: Center(
            child: Text(
              button,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],

  }  }
}
