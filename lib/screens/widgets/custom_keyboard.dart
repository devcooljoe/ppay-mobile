import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class CustomKeyboard extends StatelessWidget {
  final Function(String) onKeyTap;
  final VoidCallback onDelete;

  const CustomKeyboard({
    super.key,
    required this.onKeyTap,
    required this.onDelete,
  });

  Widget _key(String value, {VoidCallback? onTap}) {
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

  Widget _deleteKey({VoidCallback? onTap}) {
    return TouchOpacity(
      onTap: onTap,
      child: SizedBox(
        width: 33.w,
        height: 33.h,
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
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      mainAxisSpacing: 24.h,
      crossAxisSpacing: 48.w,
      children: [
        _key('1', onTap: () => onKeyTap('1')),
        _key('2', onTap: () => onKeyTap('2')),
        _key('3', onTap: () => onKeyTap('3')),
        _key('4', onTap: () => onKeyTap('4')),
        _key('5', onTap: () => onKeyTap('5')),
        _key('6', onTap: () => onKeyTap('6')),
        _key('7', onTap: () => onKeyTap('7')),
        _key('8', onTap: () => onKeyTap('8')),
        _key('9', onTap: () => onKeyTap('9')),
        _key('.', onTap: () => onKeyTap('.')),
        _key('0', onTap: () => onKeyTap('0')),
        _deleteKey(onTap: onDelete),
      ],
    );
  }
}
