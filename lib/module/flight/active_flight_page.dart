import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/flight/boarding_pass_page.dart';
import 'package:ppay_mobile/module/flight/cancel_flight_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class ActiveFlightPage extends HookConsumerWidget {
  const ActiveFlightPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
                  },
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '3 Passengers on board',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        6.horizontalSpace,
                        SizedBox(
                          height: 12.h,
                          width: 24.w,
                          child: isExpanded
                              ? SvgPicture.asset(
                                  'assets/icon/arrow_up.svg',
                                  fit: BoxFit.contain,
                                )
                              : SvgPicture.asset(
                                  'assets/icon/arrow_down.svg',
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                30.verticalSpace,
                AnimatedSize(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceOut,
                  child: ClipRect(
                    child: isExpanded
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 24.h,
                                        width: 24.h,
                                        child: SvgPicture.asset(
                                          'assets/icon/b_person.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      7.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Passenger 1',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          4.verticalSpace,
                                          Text(
                                            'Adebami Mary',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 27.h,
                                    width: 72.w,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2).r,
                                      color: PPaymobileColors.ticketbgColor,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'View Pass',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              26.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 24.h,
                                        width: 24.h,
                                        child: SvgPicture.asset(
                                          'assets/icon/b_person.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      7.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Passenger 1',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          4.verticalSpace,
                                          Text(
                                            'Adebami Mary',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 27.h,
                                    width: 72.w,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2).r,
                                      color: PPaymobileColors.ticketbgColor,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'View Pass',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              20.verticalSpace,
                            ],
                          )
                        : SizedBox.shrink(),
                  ),
                ),
                8.verticalSpace,
                TouchOpacity(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: '',
                      barrierColor: Colors.black.withValues(alpha: 0.20),
                      transitionDuration: Duration(milliseconds: 250),
                      pageBuilder: (_, __, ___) {
                        return CancelFlightPage();
                      },

                  },
                  child: SizedBox(
                    height: 19.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Cancel Flight',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.buyTradeContainerColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        5.horizontalSpace,
                        SizedBox(
                          height: 19.w,
                          width: 19.w,
                          child: SvgPicture.asset(
                            'assets/icon/blue_arrow_right.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: PPaymobileColors.mainScreenBackground,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        4.horizontalSpace,
                        Container(
                          height: 47.w,
                          width: 47.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            'assets/images/air_peace.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        12.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Air Peace',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Nnamdi Azikiwe International Airport',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.svgIconColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24.w,
                          width: 24.w,
                          child: SvgPicture.asset(
                            'assets/icon/distance.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        2.horizontalSpace,
                        Text(
                          '150 KM',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                17.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lagos-Los',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          '15:00',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Wed, July 20',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 13.h,
                          width: 13.h,
                          child: SvgPicture.asset(
                            'assets/icon/spacer.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        5.horizontalSpace,
                        SizedBox(
                          height: 2.h,
                          width: 58.w,
                          child: SvgPicture.asset(
                            'assets/icon/dashed_1.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '1H 30MIN',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        6.verticalSpace,
                        SizedBox(
                          height: 16.h,
                          width: 16.h,
                          child: SvgPicture.asset(
                            'assets/icon/airplane_1.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        6.verticalSpace,
                        Text(
                          'Direct',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.buttonColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 2.h,
                          width: 58.w,
                          child: SvgPicture.asset(
                            'assets/icon/dashed_2.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        5.horizontalSpace,
                        SizedBox(
                          height: 13.h,
                          width: 13.h,
                          child: SvgPicture.asset(
                            'assets/icon/green_spacer.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Abuja-ABJ',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          '16:30',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Wed, July 20',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                18.verticalSpace,
                TouchOpacity(
                  onTap: () {
                    isExpanded.value = !isExpanded;
                  },
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '3 Passengers on board',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        6.horizontalSpace,
                        SizedBox(
                          height: 12.h,
                          width: 24.w,
                          child: isExpanded
                              ? SvgPicture.asset(
                                  'assets/icon/arrow_up.svg',
                                  fit: BoxFit.contain,
                                )
                              : SvgPicture.asset(
                                  'assets/icon/arrow_down.svg',
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                30.verticalSpace,
                AnimatedSize(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceOut,
                  child: ClipRect(
                    child: isExpanded
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 24.h,
                                        width: 24.h,
                                        child: SvgPicture.asset(
                                          'assets/icon/b_person.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      7.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Passenger 1',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          4.verticalSpace,
                                          Text(
                                            'Adebami Mary',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 27.h,
                                    width: 72.w,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2).r,
                                      color: PPaymobileColors.ticketbgColor,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'View Pass',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              26.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 24.h,
                                        width: 24.h,
                                        child: SvgPicture.asset(
                                          'assets/icon/b_person.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      7.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Passenger 1',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          4.verticalSpace,
                                          Text(
                                            'Adebami Mary',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  TouchOpacity(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BoardingPassPage(),
                                        ),

                                    },
                                    child: Container(
                                      height: 27.h,
                                      width: 72.w,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          2,
                                        ).r,
                                        color: PPaymobileColors.ticketbgColor,
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'View Pass',
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              20.verticalSpace,
                            ],
                          )
                        : SizedBox.shrink(),
                  ),
                ),
                8.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Cancel Flight',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.buyTradeContainerColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    5.horizontalSpace,
                    SizedBox(
                      height: 19.w,
                      width: 19.w,
                      child: SvgPicture.asset(
                        'assets/icon/blue_arrow_right.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
              ),
      ),
    );  }
