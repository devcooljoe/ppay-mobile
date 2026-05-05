import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/module/dashboard/features_page.dart';
import 'package:ppay_mobile/module/dashboard/home_page.dart';
import 'package:ppay_mobile/module/settings/settings_page.dart';
import 'package:ppay_mobile/module/transaction/transaction_history_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class ExplorePage extends HookConsumerWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final pageController = usePageController();

    void onTapped(int index) {
      selectedIndex.value = index;
      pageController.jumpToPage(index);
    }
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: PPaymobileColors.mainScreenBackground,
        elevation: 1,
        currentIndex: selectedIndex.value > 3 ? 0 : selectedIndex.value,
        onTap: onTapped,
        selectedItemColor: PPaymobileColors.buttonColor,
        unselectedItemColor: PPaymobileColors.svgIconColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: navSvgIcon(
              activeIcon: 'assets/icon/home.svg',
              inactiveIcon: 'assets/icon/home2.svg',
              index: 0,
              currentIndex: selectedIndex.value,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: navSvgIcon(
              activeIcon: 'assets/icon/history.svg',
              inactiveIcon: 'assets/icon/history.svg',
              index: 1,
              currentIndex: selectedIndex.value,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: navSvgIcon(
              activeIcon: 'assets/images/features_2.png',
              inactiveIcon: 'assets/images/features.png',
              index: 2,
              currentIndex: selectedIndex.value,
            ),
            label: 'Features',
          ),
          BottomNavigationBarItem(
            icon: navSvgIcon(
              activeIcon: 'assets/icon/settings_2.svg',
              inactiveIcon: 'assets/icon/settings.svg',
              index: 3,
              currentIndex: selectedIndex.value,
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
    required int currentIndex,
  }) {
    final bool isActive = currentIndex == index;

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
