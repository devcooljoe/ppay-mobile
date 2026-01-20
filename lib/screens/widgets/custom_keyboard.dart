import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class CustomKeyboard extends StatelessWidget {
  final Function(String) onKeyTap;
  final VoidCallback onDelete;

  const CustomKeyboard({
    super.key,
    required this.onKeyTap,
    required this.onDelete,
  });

  Widget _key(String value, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 82.w,
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

  Widget _deleteKey({VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 33.h,
        width: 33.w,
        child: SvgPicture.asset(
          'assets/icon/eraser.svg',
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
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      mainAxisSpacing: 24.h,
      crossAxisSpacing: 48.w,
      children: [
        Container(
          height: 68.h,
          width: 82.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: PPaymobileColors.mainScreenBackground,
          child: _key('1', onTap: () => onKeyTap('1')),
        ),
        Container(
          height: 68.h,
          width: 82.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: PPaymobileColors.mainScreenBackground,
          child: _key('2', onTap: () => onKeyTap('2')),
        ),
        Container(
          height: 68.h,
          width: 82.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: PPaymobileColors.mainScreenBackground,
          child: _key('3', onTap: () => onKeyTap('3')),
        ),
        Container(
          height: 68.h,
          width: 82.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: PPaymobileColors.mainScreenBackground,
          child: _key('4', onTap: () => onKeyTap('4')),
        ),
        Container(
          height: 68.h,
          width: 82.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: PPaymobileColors.mainScreenBackground,
          child: _key('5', onTap: () => onKeyTap('5')),
        ),
        Container(
          height: 68.h,
          width: 82.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: PPaymobileColors.mainScreenBackground,
          child: _key('6', onTap: () => onKeyTap('6')),
        ),
        Container(
          height: 68.h,
          width: 82.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: PPaymobileColors.mainScreenBackground,
          child: _key('7', onTap: () => onKeyTap('7')),
        ),
        Container(
          height: 68.h,
          width: 82.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: PPaymobileColors.mainScreenBackground,
          child: _key('8', onTap: () => onKeyTap('8')),
        ),
        Container(
          height: 68.h,
          width: 82.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: PPaymobileColors.mainScreenBackground,
          child: _key('9', onTap: () => onKeyTap('9')),
        ),
        Container(
          height: 68.h,
          width: 82.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: PPaymobileColors.mainScreenBackground,
          child: _key('.', onTap: () => onKeyTap('.')),
        ),
        Container(
          height: 68.h,
          width: 82.w,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          color: PPaymobileColors.mainScreenBackground,
          child: _key('0', onTap: () => onKeyTap('0')),
        ),
        _deleteKey(onTap: onDelete),
      ],
    );
  }
}
