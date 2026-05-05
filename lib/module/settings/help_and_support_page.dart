import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/settings/contact_tab_page.dart';
import 'package:ppay_mobile/module/settings/faq_tab_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

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
            tabs: [
              Tab(text: 'FAQ'),
              Tab(text: 'Contact Us'),
            ],
          ),
        ),
        body: TabBarView(children: [FaqTabPage(), ContactTabPage()]),
      ),
    );
  }
}
