import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/crypto/all_tokens_page.dart';
import 'package:ppay_mobile/module/crypto/your_assets_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';

@RoutePage()
class AssetsPage extends HookConsumerWidget {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PPAppBar(
          title: 'Tokens',
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
                      icon: SvgPicture.asset(
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
                    children: [AllTokensPage(), YourAssetsPage()],
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
