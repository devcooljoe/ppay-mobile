import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/live_chat_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:url_launcher/url_launcher.dart';

const _kPhone = '+2348034693028';
const _kWhatsAppNumber = '2348034693028';

@RoutePage()
class PersonalShopperPage extends HookConsumerWidget {
  const PersonalShopperPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        elevation: 0,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        title: Text(
          'Personal Shopper',
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
      ),
      floatingActionButton: _ReachAgentFab(
        onTap: () => _showReachAgentSheet(context, ref),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            20.verticalSpace,

            // Search bar
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: PPaymobileColors.deepBackgroundColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
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
                  fillColor: PPaymobileColors.deepBackgroundColor,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 13.w,
                    vertical: 14.h,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                ),
              ),
            ),

            24.verticalSpace,

            // Fashion & Style card
            _CategoryCard(
              title: 'Fashion & Style',
              subtitle:
                  'Trendy outfits, shoes, and accessories tailored to\nyour taste.',
              imagePath: 'assets/images/green-shirt.png',
              onReachUs: () => _showReachAgentSheet(context, ref),
            ),

            20.verticalSpace,

            // Smart Gadgets card
            _CategoryCard(
              title: 'Smart Gadgets',
              subtitle: 'Latest smartphones, headphones, and more.',
              imagePath: 'assets/images/iphone.png',
              onReachUs: () => _showReachAgentSheet(context, ref),
            ),

            100.verticalSpace,
          ],
        ),
      ),
    );
  }

  void _showReachAgentSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _ReachAgentSheet(ref: ref),
    );
  }
}

// ── Category card ─────────────────────────────────────────────────────────────

class _CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onReachUs;

  const _CategoryCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onReachUs,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: SizedBox(
        height: 260.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.asset(imagePath, fit: BoxFit.cover),

            // Dark gradient overlay
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xCC000000)],
                  stops: [0.35, 1.0],
                ),
              ),
            ),

            // Content
            Positioned(
              left: 20.w,
              right: 20.w,
              bottom: 20.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 13.sp,
                      height: 1.4,
                    ),
                  ),
                  16.verticalSpace,
                  TouchOpacity(
                    onTap: onReachUs,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Reach Us',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          6.horizontalSpace,
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.black,
                            size: 16.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Reach Agent FAB ───────────────────────────────────────────────────────────

class _ReachAgentFab extends StatelessWidget {
  final VoidCallback onTap;
  const _ReachAgentFab({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Label chip
        TouchOpacity(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              'Reach Agent',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        10.verticalSpace,
        // Green circle button
        TouchOpacity(
          onTap: onTap,
          child: Container(
            height: 56.w,
            width: 56.w,
            decoration: BoxDecoration(
              color: PPaymobileColors.buttonColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: PPaymobileColors.buttonColor.withValues(alpha: 0.35),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                color: Colors.white,
                size: 24.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Reach Agent bottom sheet ──────────────────────────────────────────────────

class _ReachAgentSheet extends HookWidget {
  final WidgetRef ref;
  const _ReachAgentSheet({required this.ref});

  @override
  Widget build(BuildContext context) {
    final whatsappExpanded = useState(true);
    final callExpanded = useState(true);

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Close button above sheet
        Positioned(
          top: -56.h,
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 44.w,
              width: 44.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close_rounded, color: Colors.black, size: 20.w),
            ),
          ),
        ),

        // Sheet content
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 40.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reach our agent',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              8.verticalSpace,
              Text(
                'Select a channel below to reach our shopping agent',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 14.sp,
                ),
              ),
              24.verticalSpace,

              // Live Chat row
              _ChannelTile(
                icon: Icons.chat_bubble_outline_rounded,
                label: 'Live Chat',
                trailing: Icon(
                  Icons.chevron_right_rounded,
                  color: PPaymobileColors.svgIconColor,
                  size: 20.w,
                ),
                onTap: () {
                  Navigator.pop(context);
                  showLiveChatSheet(context);
                },
              ),

              16.verticalSpace,

              // WhatsApp expandable
              _ExpandableChannelTile(
                icon: Icons.chat_bubble_outline_rounded,
                iconColor: const Color(0xFF25D366),
                label: 'Whatsapp',
                expanded: whatsappExpanded.value,
                onToggle: () =>
                    whatsappExpanded.value = !whatsappExpanded.value,
                expandedContent: _ContactRow(
                  phone: _kPhone,
                  actionLabel: 'Chat on Whatsapp',
                  onAction: () async {
                    final uri = Uri.parse(
                      'https://wa.me/$_kWhatsAppNumber?text=Hello%2C%20I%20need%20help%20with%20Personal%20Shopper',
                    );
                    if (await canLaunchUrl(uri)) launchUrl(uri);
                  },
                ),
              ),

              16.verticalSpace,

              // Call Support expandable
              _ExpandableChannelTile(
                icon: Icons.phone_outlined,
                iconColor: PPaymobileColors.buttonColor,
                label: 'Call Support',
                expanded: callExpanded.value,
                onToggle: () => callExpanded.value = !callExpanded.value,
                expandedContent: _ContactRow(
                  phone: _kPhone,
                  actionLabel: 'Copy',
                  onAction: () {
                    Clipboard.setData(const ClipboardData(text: _kPhone));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Phone number copied'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChannelTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget trailing;
  final VoidCallback onTap;

  const _ChannelTile({
    required this.icon,
    required this.label,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: PPaymobileColors.textfiedBorder),
        ),
        child: Row(
          children: [
            Container(
              height: 36.w,
              width: 36.w,
              decoration: BoxDecoration(
                color: PPaymobileColors.buttonColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: PPaymobileColors.buttonColor,
                  size: 18.w,
                ),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}

class _ExpandableChannelTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final bool expanded;
  final VoidCallback onToggle;
  final Widget expandedContent;

  const _ExpandableChannelTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.expanded,
    required this.onToggle,
    required this.expandedContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: PPaymobileColors.textfiedBorder),
      ),
      child: Column(
        children: [
          TouchOpacity(
            onTap: onToggle,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Container(
                    height: 36.w,
                    width: 36.w,
                    decoration: BoxDecoration(
                      color: iconColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(icon, color: iconColor, size: 18.w),
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Icon(
                    expanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: PPaymobileColors.svgIconColor,
                    size: 22.w,
                  ),
                ],
              ),
            ),
          ),
          if (expanded) ...[
            Divider(height: 1, color: PPaymobileColors.textfiedBorder),
            expandedContent,
          ],
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final String phone;
  final String actionLabel;
  final VoidCallback onAction;

  const _ContactRow({
    required this.phone,
    required this.actionLabel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        children: [
          Container(
            width: 10.w,
            height: 10.w,
            decoration: BoxDecoration(
              color: PPaymobileColors.buttonColor,
              shape: BoxShape.circle,
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Text(
              phone,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TouchOpacity(
            onTap: onAction,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: PPaymobileColors.textfiedBorder),
              ),
              child: Text(
                actionLabel,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Bottom nav (Features tab active) ─────────────────────────────────────────

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            label: 'Home',
            active: false,
            onTap: () => Navigator.popUntil(context, (r) => r.isFirst),
          ),
          _NavItem(
            icon: Icons.swap_horiz_rounded,
            label: 'History',
            active: false,
            onTap: () {},
          ),
          _NavItem(
            icon: Icons.grid_view_rounded,
            label: 'Features',
            active: true,
            onTap: () {},
          ),
          _NavItem(
            icon: Icons.settings_outlined,
            label: 'Settings',
            active: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = active
        ? PPaymobileColors.buttonColor
        : PPaymobileColors.svgIconColor;
    return TouchOpacity(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 22.w),
          4.verticalSpace,
          Text(
            label,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: color,
              fontSize: 11.sp,
              fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
