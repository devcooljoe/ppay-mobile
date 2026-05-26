import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_date_picker.dart';
import 'package:ppay_mobile/shared/widgets/gender_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateController = useTextEditingController();
    final genderController = useTextEditingController();
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Profile',
        onBackPressed: () => Navigator.pop(context),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Text(
              'Reset',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.doneTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).w,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  51.verticalSpace,
                  CircleAvatar(
                    radius: 51.5.r,
                    backgroundColor: PPaymobileColors.backgroundColor,
                    child: Center(
                      child: Text(
                        'AS',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.mainScreenBackground,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  Container(
                    height: 40.h,
                    width: 134.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 19.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6).r,
                      border: Border.all(
                        width: 1.w,
                        color: PPaymobileColors.textfiedBorder,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 14.h,
                          width: 15.w,
                          child: SvgPicture.asset(
                            'assets/icon/camera.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        6.horizontalSpace,
                        Text(
                          'Add Image',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  61.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PPLabel(text: 'Full Name'),
                      4.verticalSpace,
                      Container(
                        height: 52.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6).r,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 14.h,
                            ),
                            hintText: 'Adebami Samuel',
                            hintStyle: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                color: PPaymobileColors.textfiedBorder,
                                width: 1.w,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                color: PPaymobileColors.textfiedBorder,
                                width: 1.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      PPLabel(text: 'Date of Birth'),
                      4.verticalSpace,
                      TextFormField(
                        controller: dateController,
                        readOnly: true,
                        onTap: () async {
                          /// 👉 THIS is where the dialog is called
                          final selectedDate = await showDialog<DateTime>(
                            context: context,
                            builder: (_) => const CustomDatePickerDialog(),
                          );
                          if (selectedDate != null) {
                            dateController.text =
                                "${selectedDate.day.toString().padLeft(2, '0')}/"
                                "${selectedDate.month.toString().padLeft(2, '0')}/"
                                "${selectedDate.year}";
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 14.h,
                          ),
                          hintText: '09/11/2009',
                          hintStyle: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          suffixIcon: SizedBox(
                            height: 24.w,
                            width: 24.w,
                            child: SvgPicture.asset(
                              'assets/icon/calendar.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.r),
                            borderSide: BorderSide(
                              color: PPaymobileColors.textfiedBorder,
                              width: 1.w,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.r),
                            borderSide: BorderSide(
                              color: PPaymobileColors.textfiedBorder,
                              width: 1.w,
                            ),
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      PPLabel(text: 'Enter Gender'),
                      4.verticalSpace,
                      TouchOpacity(
                        onTap: () async {
                          final result = await showModalBottomSheet<String>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const GenderBottomsheet(),
                          );

                          if (result != null) {
                            genderController.text = result;
                          }
                        },
                        child: Container(
                          height: 52.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6).r,
                          ),
                          child: TextFormField(
                            controller: genderController,
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 14.h,
                              ),
                              hintText: 'Select',
                              hintStyle: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: PPaymobileColors.textfiedBorder,
                              ),
                              suffixIcon: TouchOpacity(
                                onTap: () async {
                                  final result =
                                      await showModalBottomSheet<String>(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (_) =>
                                            const GenderBottomsheet(),
                                      );

                                  if (result != null) {
                                    genderController.text = result;
                                  }
                                },
                                child: SizedBox(
                                  height: 14.h,
                                  width: 8.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/arrow_down.svg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                borderSide: BorderSide(
                                  color: PPaymobileColors.textfiedBorder,
                                  width: 1.w,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                borderSide: BorderSide(
                                  color: PPaymobileColors.textfiedBorder,
                                  width: 1.w,
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
              77.verticalSpace,
              PPButton(
                text: 'Save Changes',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
