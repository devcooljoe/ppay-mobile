import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/models/notification_model.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';

@RoutePage()
class NotificationPage extends HookConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Notification',
        onBackPressed: () => Navigator.pop(context),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SizedBox(
                height: 24.w,
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
      body: Padding(
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
                    height: 24.w,
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
                  fillColor: Color(0xffF4F4F4),
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
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            group.notifDate,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
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
                        separatorBuilder: (_, _) => 31.verticalSpace,
                        itemBuilder: (context, index) {
                          final option = group.notifDaychild[index];
                          return SizedBox(
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 54.w,
                                      width: 54.w,
                                      decoration: BoxDecoration(
                                        color: option.containerColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          option.notifIcon,
                                          height: 24.w,
                                          width: 24.w,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    12.horizontalSpace,
                                    SizedBox(
                                      width: 295.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
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
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
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
                                              color: PPaymobileColors
                                                  .anotherGreyColor,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                28.horizontalSpace,
                                Container(
                                  height: 11.w,
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
    );
  }
}
