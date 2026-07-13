import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class PPAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool showLeading;

  const PPAppBar({
    super.key,
    this.title,
    this.onBackPressed,
    this.actions,
    this.showLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      toolbarHeight: 56,
      leadingWidth: showLeading ? 56.w : 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          : null,
      leading: showLeading
          ? Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: TouchOpacity(
                onTap: onBackPressed ?? () => Navigator.pop(context),
                child: SizedBox(
                  height: 24.w,
                  width: 24.w,
                  child: SvgPicture.asset(
                    'assets/icon/arrow_back.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
