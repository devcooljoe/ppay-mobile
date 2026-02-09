import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/all_tokens_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/your_assets_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({super.key});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
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
            'Tokens',
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
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                SizedBox(
                  height: 54.h,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        'assets/icon/bank_search.svg',
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: 'Search crypto',
                      filled: true,
                      fillColor: PPaymobileColors.deepBackgroundColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4).r,
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                PreferredSize(
                  preferredSize: Size.fromHeight(30),
                  child: TabBar(
                    isScrollable: true,
                    dividerColor: PPaymobileColors.deepBackgroundColor,
                    tabAlignment: TabAlignment.start,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: PPaymobileColors.buttonColor,
                    indicatorWeight: 3,
                    labelPadding: EdgeInsets.symmetric(horizontal: 12),
                    labelStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.buttonColor,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: 'All Tokens'),
                      Tab(text: 'Your Asset'),
                    ],
                  ),
                ),

                12.verticalSpace,
                Expanded(
                  child: TabBarView(
                    children: [AllTokensScreen(), YourAssetsScreen()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
