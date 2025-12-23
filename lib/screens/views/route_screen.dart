import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/screens/views/features_screen.dart';
import 'package:ppay_mobile/screens/views/history_screen.dart';
import 'package:ppay_mobile/screens/views/home_screen.dart';
import 'package:ppay_mobile/screens/views/kyc_verification_screen.dart';
import 'package:ppay_mobile/screens/views/settings_screen.dart';
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
        unselectedItemColor: PPaymobileColors.textfiedBorder,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: navSvgIcon('assets/icon/home.svg', 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: navSvgIcon('assets/icon/history.svg', 1),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: navSvgIcon('assets/icon/features.svg', 2),
            label: 'Features',
          ),
          BottomNavigationBarItem(
            icon: navSvgIcon('assets/icon/settings.svg', 3),
            label: 'Settings',
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeScreen(),
          HistoryScreen(),
          FeaturesScreen(),
          SettingsScreen(),
        ],
      ),
    );
  }

  Widget navSvgIcon(String asset, int index) {
    return SvgPicture.asset(
      asset,
      colorFilter: ColorFilter.mode(
        selectedIndex == index
            ? PPaymobileColors.buttonColor
            : PPaymobileColors.textfiedBorder,
        BlendMode.srcIn,
      ),
    );
  }
}
