import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class PinCustomKeyboard extends StatefulWidget {
  final Function(String) onKeyTap;
  final VoidCallback onDelete;

  const PinCustomKeyboard({
    super.key,
    required this.onKeyTap,
    required this.onDelete,
  });

  @override
  State<PinCustomKeyboard> createState() => _PinCustomKeyboardState();
}

Widget _faceIdKey({VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: 46.h,
      width: 44.w,
      child: SvgPicture.asset(
        'assets/images/fingerprint1.png',
        fit: BoxFit.contain,
      ),
    ),
  );
}

class _PinCustomKeyboardState extends State<PinCustomKeyboard> {
  Widget _key(String value, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _deleteKey({VoidCallback? onTap}) {
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

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 15.h, bottom: 37.h, left: 10.w, right: 8.w),
      mainAxisSpacing: 24.h,
      crossAxisSpacing: 52.w,
      children: [
        Container(
          height: 62.h,
          width: 88.w,
          color: PPaymobileColors.mainScreenBackground,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: _key('1', onTap: () => widget.onKeyTap('1')),
        ),
        Container(
          height: 62.h,
          width: 88.w,
          color: PPaymobileColors.mainScreenBackground,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: _key('2', onTap: () => widget.onKeyTap('2')),
        ),
        Container(
          height: 62.h,
          width: 88.w,
          color: PPaymobileColors.mainScreenBackground,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: _key('3', onTap: () => widget.onKeyTap('3')),
        ),
        Container(
          height: 62.h,
          width: 88.w,
          color: PPaymobileColors.mainScreenBackground,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: _key('4', onTap: () => widget.onKeyTap('4')),
        ),
        Container(
          height: 62.h,
          width: 88.w,
          color: PPaymobileColors.mainScreenBackground,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: _key('5', onTap: () => widget.onKeyTap('5')),
        ),
        Container(
          height: 62.h,
          width: 88.w,
          color: PPaymobileColors.mainScreenBackground,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: _key('6', onTap: () => widget.onKeyTap('6')),
        ),
        Container(
          height: 62.h,
          width: 88.w,
          color: PPaymobileColors.mainScreenBackground,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: _key('7', onTap: () => widget.onKeyTap('7')),
        ),
        Container(
          height: 62.h,
          width: 88.w,
          color: PPaymobileColors.mainScreenBackground,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: _key('8', onTap: () => widget.onKeyTap('8')),
        ),
        Container(
          height: 62.h,
          width: 88.w,
          color: PPaymobileColors.mainScreenBackground,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: _key('9', onTap: () => widget.onKeyTap('9')),
        ),
        _faceIdKey(onTap: () {}),
        Container(
          height: 62.h,
          width: 88.w,
          color: PPaymobileColors.mainScreenBackground,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: _key('0', onTap: () => widget.onKeyTap('0')),
        ),
        _deleteKey(onTap: widget.onDelete),
      ],
    );
  }
}
