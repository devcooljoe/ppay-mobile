import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/electricity_confirm_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/screens/widgets/select_beneficiary_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/select_meter_type_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class ElectricityScreen extends StatefulWidget {
  const ElectricityScreen({super.key});

  @override
  State<ElectricityScreen> createState() => _ElectricityScreenState();
}

class _ElectricityScreenState extends State<ElectricityScreen> {
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
          'Electricity Bill',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Meter Type',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TouchOpacity(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return SelectBeneficiaryBottomsheet();
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
                    10.verticalSpace,
                    SizedBox(
                      height: 54.h,
                      width: double.infinity,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return SelectMeterTypeBottomsheet();
                            },
                          );
                        },
                        decoration: InputDecoration(
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Prepaid',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          suffixIcon: SizedBox(
                            height: 12.h,
                            width: 24.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_down.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          // hintText: 'Enter Receiver Name',
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
                    32.verticalSpace,
                    Text(
                      'Enter Meter Number',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
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
                    32.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount',
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
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 47.5.h,
                          width: 91.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.deepBackgroundColor,
                            borderRadius: BorderRadius.circular(5).r,
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
                        12.horizontalSpace,
                        Container(
                          height: 47.5.h,
                          width: 91.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.deepBackgroundColor,
                            borderRadius: BorderRadius.circular(5).r,
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
                        12.horizontalSpace,
                        Container(
                          height: 47.5.h,
                          width: 91.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.deepBackgroundColor,
                            borderRadius: BorderRadius.circular(5).r,
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
                        12.horizontalSpace,
                        Container(
                          height: 47.5.h,
                          width: 91.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.deepBackgroundColor,
                            borderRadius: BorderRadius.circular(5).r,
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
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 47.5.h,
                          width: 91.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.deepBackgroundColor,
                            borderRadius: BorderRadius.circular(5).r,
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
                        12.horizontalSpace,
                        Container(
                          height: 47.5.h,
                          width: 91.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.deepBackgroundColor,
                            borderRadius: BorderRadius.circular(5).r,
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
                        12.horizontalSpace,
                        Container(
                          height: 47.5.h,
                          width: 91.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.deepBackgroundColor,
                            borderRadius: BorderRadius.circular(5).r,
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
                        12.horizontalSpace,
                        Container(
                          height: 47.5.h,
                          width: 91.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.deepBackgroundColor,
                            borderRadius: BorderRadius.circular(5).r,
                          ),
                          child: Center(
                            child: Text(
                              '₦5000',
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
                    24.verticalSpace,
                    Text(
                      'Amount',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    6.verticalSpace,
                    SizedBox(
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
                    72.verticalSpace,
                    TouchOpacity(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ElectricityConfirmScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(56).r,
                          color: PPaymobileColors.buttonColorandText,
                        ),
                        child: Center(
                          child: Text(
                            'Make Payment',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
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
