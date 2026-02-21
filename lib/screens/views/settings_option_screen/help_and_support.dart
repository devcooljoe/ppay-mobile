import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/contact.dart';
import 'package:ppay_mobile/screens/views/settings_option_screen/settings_options_sub_screen/faq.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: TabBarView(children: [FaqTab(), ContactTab()]),
      ),
    );
  }
}
