import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
      height: 23.h,
      width: 23.w,
      child: SvgPicture.asset(
        'assets/icon/fingerprint_black.svg',
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
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
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
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      mainAxisSpacing: 24.h,
      crossAxisSpacing: 48.w,
      children: [
        _key('1', onTap: () => widget.onKeyTap('1')),
        _key('2', onTap: () => widget.onKeyTap('2')),
        _key('3', onTap: () => widget.onKeyTap('3')),
        _key('4', onTap: () => widget.onKeyTap('4')),
        _key('5', onTap: () => widget.onKeyTap('5')),
        _key('6', onTap: () => widget.onKeyTap('6')),
        _key('7', onTap: () => widget.onKeyTap('7')),
        _key('8', onTap: () => widget.onKeyTap('8')),
        _key('9', onTap: () => widget.onKeyTap('9')),
        _faceIdKey(onTap: () {}),
        _key('0', onTap: () => widget.onKeyTap('0')),
        _deleteKey(onTap: widget.onDelete),
      ],
    );
  }
}
