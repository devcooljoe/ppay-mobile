import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class PinCustomKeyboard extends HookWidget {
  final Function(String) onKeyTap;
  final VoidCallback onDelete;

  const PinCustomKeyboard({
    super.key,
    required this.onKeyTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    Widget key(String value, {VoidCallback? onTap}) {
      return TouchOpacity(
        onTap: onTap,
        child: Container(
          width: 82.w,
          height: 68.h,
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
          alignment: Alignment.center,
          child: Text(
            value,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    Widget deleteKey({VoidCallback? onTap}) {
      return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 22.h,
          width: 28.w,
          child: SvgPicture.asset(
            'assets/icon/delete.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
      );
    }

    Widget faceIdKey({VoidCallback? onTap}) {
      return GestureDetector(
        onTap: onTap,
        child: Center(
          child: SizedBox(
            height: 46.h,
            width: 44.w,
            child: Image.asset(
              'assets/images/fingerprint_1.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    }
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      mainAxisSpacing: 24.h,
      crossAxisSpacing: 48.w,
      children: [
        key('1', onTap: () => onKeyTap('1')),
        key('2', onTap: () => onKeyTap('2')),
        key('3', onTap: () => onKeyTap('3')),
        key('4', onTap: () => onKeyTap('4')),
        key('5', onTap: () => onKeyTap('5')),
        key('6', onTap: () => onKeyTap('6')),
        key('7', onTap: () => onKeyTap('7')),
        key('8', onTap: () => onKeyTap('8')),
        key('9', onTap: () => onKeyTap('9')),
        faceIdKey(
          onTap: () {
            context.router.push(FingerprintRoute());
          },
        ),
        key('0', onTap: () => onKeyTap('0')),
        deleteKey(onTap: onDelete),
      ],
    );
  }
}
