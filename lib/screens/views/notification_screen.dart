import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/model/notification_model.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Notification',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset(
                  'assets/icon/settings_black.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              46.verticalSpace,
              SizedBox(
                height: 54.h,
                width: double.infinity,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 14.w,
                    ),
                    prefixIcon: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/icon/bank_search.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                    fillColor: PPaymobileColors.deepBackgroundColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8).r,
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              36.verticalSpace,
              ListView.separated(
                itemCount: notifGroup.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => 16.verticalSpace,
                itemBuilder: (context, groupIndex) {
                  final group = notifGroup[groupIndex];
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 17.h,
                    ),
                    color: PPaymobileColors.mainScreenBackground,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              group.notifDay,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.svgIconColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              group.notifDate,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.svgIconColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        41.verticalSpace,
                        ListView.separated(
                          itemCount: group.notifDaychild.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, __) => 31.verticalSpace,
                          itemBuilder: (context, index) {
                            final option = group.notifDaychild[index];

                            return SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 54.h,
                                    width: 54.w,
                                    decoration: BoxDecoration(
                                      color: option.containerColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        option.notifIcon,
                                        height: 24.h,
                                        width: 24.w,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  12.horizontalSpace,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          option.notifTitle,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        2.verticalSpace,
                                        Text(
                                          option.notifSubtitle,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        4.verticalSpace,
                                        Text(
                                          option.notifTime,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            color:
                                                PPaymobileColors.svgIconColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 11.h,
                                    width: 11.w,
                                    decoration: BoxDecoration(
                                      color: option.notifLabel,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              20.verticalSpace,
              SizedBox(
                height: 195.h,
                width: 225.w,
                child: Image.asset(
                  'assets/images/no_notif.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
