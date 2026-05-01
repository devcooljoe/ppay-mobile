import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_date_picker.dart';
import 'package:ppay_mobile/shared/widgets/gender_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      Text(
                        'Enter Gender',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      TouchOpacity(
                        onTap: () async {
                          final result = await showModalBottomSheet<String>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const GenderBottomsheet(),

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

                                  if (result != null) {
                                    genderController.text = result;

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
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
              ),
      ),
    );  }
