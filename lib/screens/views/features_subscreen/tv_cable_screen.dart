import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/tv_cable_confirm_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class TvCableScreen extends StatefulWidget {
  const TvCableScreen({super.key});

  @override
  State<TvCableScreen> createState() => _TvCableScreenState();
}

class _TvCableScreenState extends State<TvCableScreen> {
  final FocusNode _focusNode = FocusNode(canRequestFocus: false);

  final TextEditingController _controller = TextEditingController();
  bool _showKeyboard = false;

  void _onKeyTap(String value) {
    setState(() {
      // Prevent multiple dots
      if (value == '.' && _controller.text.contains('.')) return;
      // Prevent dot at start
      if (value == '.' && _controller.text.isEmpty) return;

      _controller.text += value;
    });
  }

  // Handle delete key
  void _onDelete() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text = _controller.text.substring(
          0,
          _controller.text.length - 1,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Tv Cable',
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
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  _showKeyboard = false;
                });
              },
              child: ListView(
                children: [
                  36.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Text(
                      'Select Providers',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  22.verticalSpace,
                  SizedBox(
                    height: 106.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
                          child: Container(
                            height: 104.h,
                            width: 108.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 19.w,
                              vertical: 10.h,
                            ),
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 56.h,
                                  width: 56.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/dstv_1.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                10.verticalSpace,
                                Text(
                                  'DSTV',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 104.h,
                          width: 108.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 19.w,
                            vertical: 10.h,
                          ),
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).r,
                            color: PPaymobileColors.deepBackgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 56.h,
                                width: 56.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/dstv_1.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              10.verticalSpace,
                              Text(
                                'DSTV',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 104.h,
                          width: 108.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 19.w,
                            vertical: 10.h,
                          ),
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).r,
                            color: PPaymobileColors.deepBackgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 56.h,
                                width: 56.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/dstv_1.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              10.verticalSpace,
                              Text(
                                'DSTV',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 104.h,
                          width: 108.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 19.w,
                            vertical: 10.h,
                          ),
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).r,
                            color: PPaymobileColors.deepBackgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 56.h,
                                width: 56.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/dstv_1.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              10.verticalSpace,
                              Text(
                                'DSTV',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  56.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Text(
                      'Smart Card Number',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: SizedBox(
                      height: 54.h,
                      width: double.infinity,
                      child: TextFormField(
                        showCursor: true,
                        keyboardType: TextInputType.number,
                        onTap: () {
                          setState(() {
                            _showKeyboard = false;
                          });
                        },
                        decoration: InputDecoration(
                          hint: Text(
                            'Enter Number',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.anotherGreyColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PPaymobileColors.textfieldGrey,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(6).r,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PPaymobileColors.textfieldGrey,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(6).r,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 14.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                  32.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Text(
                      'Renewal',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: SizedBox(
                      height: 54.h,
                      width: double.infinity,
                      child: TextFormField(
                        showCursor: true,
                        readOnly: true,
                        onTap: () {
                          setState(() {
                            _showKeyboard = true;
                          });
                        },
                        decoration: InputDecoration(
                          hint: RichText(
                            text: TextSpan(
                              text: '₦ ',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Enter Amount',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.anotherGreyColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PPaymobileColors.textfieldGrey,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(6).r,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PPaymobileColors.textfieldGrey,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(6).r,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 14.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                  32.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Packages',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Balance: ₦400,000',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.buttonColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 84.h,
                          width: 127.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).r,
                            color: PPaymobileColors.deepBackgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'DSTV PADI',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              4.verticalSpace,
                              RichText(
                                text: TextSpan(
                                  text: '₦4,400/',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '1Month',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors.buttonColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 84.h,
                          width: 127.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).r,
                            color: PPaymobileColors.deepBackgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'DSTV YANGA',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              4.verticalSpace,
                              RichText(
                                text: TextSpan(
                                  text: '₦6,000/',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '1Month',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors.buttonColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 84.h,
                          width: 127.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).r,
                            color: PPaymobileColors.deepBackgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'DSTV CONFAM',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              4.verticalSpace,
                              RichText(
                                text: TextSpan(
                                  text: '₦11,000/',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '1Month',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors.buttonColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 84.h,
                          width: 127.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).r,
                            color: PPaymobileColors.deepBackgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'DSTV COMPACT',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              4.verticalSpace,
                              RichText(
                                text: TextSpan(
                                  text: '₦19.000/',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '1Month',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors.buttonColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 84.h,
                          width: 127.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).r,
                            color: PPaymobileColors.deepBackgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'DSTV COMPACT PLUS',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              4.verticalSpace,
                              RichText(
                                text: TextSpan(
                                  text: '₦30,000/',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '1Month',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors.buttonColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 84.h,
                          width: 127.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5).r,
                            color: PPaymobileColors.deepBackgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'DSTV STREAM PREMIUM',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              4.verticalSpace,
                              RichText(
                                text: TextSpan(
                                  text: '₦44,000/',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '1Month',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors.buttonColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  89.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: SizedBox(
                      width: double.infinity,
                      height: 54.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PPaymobileColors
                              .onTapButtonColor, // color becomes backgroundColor when all text have been inputed
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(55.r),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TvCableConfirmScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Subscribe',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: PPaymobileColors.mainScreenBackground,
                          ),
                        ),
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: SizedBox(
                      width: double.infinity,
                      height: 54.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PPaymobileColors.buttonColorandText,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(55.r),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TvCableConfirmScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Subscribe',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: PPaymobileColors.mainScreenBackground,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          10.verticalSpace,
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: _showKeyboard ? 424.h : 0,
            child: _showKeyboard
                ? KeyboardContainer(
                    child: CustomKeyboard(
                      onKeyTap: _onKeyTap,
                      onDelete: _onDelete,
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
