import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/airtime_confirm_screen.dart';
import 'package:ppay_mobile/screens/widgets/airtime_beneficiary_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard_container.dart';

class AirtimeScreen extends StatefulWidget {
  const AirtimeScreen({super.key});

  @override
  State<AirtimeScreen> createState() => _AirtimeScreenState();
}

class _AirtimeScreenState extends State<AirtimeScreen> {
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
          'Airtime',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Network',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return AirtimeBeneficiaryBottomsheet();
                                },
                              );
                            },
                            child: Text(
                              'Beneficiaries',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.buttonColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: PPaymobileColors.buttonColor,
                              ),
                            ),
                          ),
                        ],
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
                                          'assets/images/mtn.png',
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
                                        'assets/images/airtel.png',
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
                                        'assets/images/9mobile.png',
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
                                        'assets/images/glo.png',
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
                        'Phone Number',
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
                          onTap: () {
                            setState(() {
                              _showKeyboard = true;
                            });
                          },
                          decoration: InputDecoration(
                            hint: RichText(
                              text: TextSpan(
                                text: '+234 ',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Enter Number',
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
                        'Enter Amount',
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
                            height: 47.5.h,
                            width: 91.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                '₦100',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 47.5.h,
                            width: 91.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                '₦200',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 47.5.h,
                            width: 91.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                '₦500',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 47.5.h,
                            width: 91.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                '₦1000',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
                            height: 47.5.h,
                            width: 91.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                '₦100',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 47.5.h,
                            width: 91.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                '₦200',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 47.5.h,
                            width: 91.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                '₦500',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 47.5.h,
                            width: 91.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                '₦1000',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    89.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AirtimeConfirmScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: SizedBox(
                          width: double.infinity,
                          height: 54.h,
                          child: Image.asset(
                            'assets/images/bya.png',
                            fit: BoxFit.contain,
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
      ),
    );
  }
}
