import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/module/dashboard/features_page.dart';
import 'package:ppay_mobile/module/dashboard/home_page.dart';
import 'package:ppay_mobile/module/settings/settings_page.dart';
import 'package:ppay_mobile/module/transaction/transaction_history_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: PPaymobileColors.mainScreenBackground,
        elevation: 1,
        currentIndex: selectedIndex > 3 ? 0 : selectedIndex,
        onTap: onTapped,
        selectedItemColor: PPaymobileColors.buttonColor,
        unselectedItemColor: PPaymobileColors.svgIconColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: navSvgIcon(
              activeIcon: 'assets/icon/home.svg',
              inactiveIcon: 'assets/icon/home2.svg',
              index: 0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: navSvgIcon(
              activeIcon: 'assets/icon/history.svg',
              inactiveIcon: 'assets/icon/history.svg',
              index: 1,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: navSvgIcon(
              activeIcon: 'assets/images/features_2.png',
              inactiveIcon: 'assets/images/features.png',
              index: 2,
            ),
            label: 'Features',
          ),
          BottomNavigationBarItem(
            icon: navSvgIcon(
              activeIcon: 'assets/icon/settings_2.svg',
              inactiveIcon: 'assets/icon/settings.svg',
              index: 3,
            ),
            label: 'Settings',
          ),
        ],
      ),

      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomePage(),
          TransactionHistoryPage(),
          FeaturesPage(),
          SettingsPage(),
        ],
      ),
    );
  }

  Widget navSvgIcon({
    required String activeIcon,
    required String inactiveIcon,
    required int index,
  }) {
    final bool isActive = selectedIndex == index;

    return index == 2
        ? Image.asset(
            isActive ? activeIcon : inactiveIcon,
            width: 24.w,
            height: 24.w,
          )
        : SvgPicture.asset(
            isActive ? activeIcon : inactiveIcon,
            width: 24.w,
            height: 24.w,
            colorFilter: ColorFilter.mode(
              isActive ? PPaymobileColors.buttonColor : Color(0xff9C9C9C),
              BlendMode.srcIn,
            ),
          );
  }
}
