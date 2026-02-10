import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/screens/views/features_screen.dart';
import 'package:ppay_mobile/screens/views/home_screen.dart';
import 'package:ppay_mobile/screens/views/settings_screen.dart';
import 'package:ppay_mobile/screens/views/transaction_history_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
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
              activeIcon: 'assets/icon/features2.svg',
              inactiveIcon: 'assets/icon/features_1.svg',
              index: 2,
            ),
            label: 'Features',
          ),
          BottomNavigationBarItem(
            icon: navSvgIcon(
              activeIcon: 'assets/icon/settings2.svg',
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
          HomeScreen(),
          TransactionHistoryScreen(),
          FeaturesScreen(),
          SettingsScreen(),
        ],
      ),
    );
  }

  SvgPicture navSvgIcon({
    required String activeIcon,
    required String inactiveIcon,
    required int index,
  }) {
    final bool isActive = selectedIndex == index;

    return SvgPicture.asset(
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
