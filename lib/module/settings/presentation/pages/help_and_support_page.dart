import 'package:flutter/material.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/settings/presentation/pages/contact_tab_page.dart';
import 'package:ppay_mobile/module/settings/presentation/pages/faq_tab_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class HelpAndSupportPage extends HookConsumerWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PPaymobileColors.mainScreenBackground,
          toolbarHeight: 56,
          leadingWidth: 56.w,
          centerTitle: true,
          title: Text(
            'Help & Support',
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
                height: 24.w,
                width: 24.w,
                child: SvgPicture.asset(
                  'assets/icon/arrow_back.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            dividerColor: PPaymobileColors.deepBackgroundColor,
            indicatorColor: PPaymobileColors.buttonColor,
            labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
            labelStyle: TextStyle(
              fontFamily: 'InstrumentSans',
              color: PPaymobileColors.buttonColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'InstrumentSans',
              color: PPaymobileColors.buttonColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.black,
            indicatorWeight: 4.0.w,
            indicatorPadding: EdgeInsets.only(right: 20, left: 20, top: 10).r,
            tabs: [Tab(text: 'FAQ'), Tab(text: 'Contact Us')],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 8.h),
              child: TouchOpacity(
                onTap: () => context.router.push(const TicketListRoute()),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: PPaymobileColors.mainScreenBackground,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: PPaymobileColors.textfiedBorder),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: PPaymobileColors.buttonColorandText.withValues(
                            alpha: 0.1,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.confirmation_number_outlined,
                          size: 20.w,
                          color: PPaymobileColors.buttonColorandText,
                        ),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Support Tickets',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            2.verticalSpace,
                            Text(
                              'View your tickets or open a new one',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.svgIconColor,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: PPaymobileColors.svgIconColor,
                        size: 22.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [FaqTabPage(), ContactTabPage()]),
            ),
          ],
        ),
      ),
    );
  }
}
