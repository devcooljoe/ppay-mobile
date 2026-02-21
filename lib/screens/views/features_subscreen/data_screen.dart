import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/data_confirm_screen.dart';
import 'package:ppay_mobile/screens/widgets/airtime_beneficiary_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        appBar: AppBar(
          backgroundColor: PPaymobileColors.mainScreenBackground,
          toolbarHeight: 56,
          leadingWidth: 56.w,
          centerTitle: true,
          title: Text(
            'Data',
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
                          TouchOpacity(
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
                                    'MTN',
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
                                  'Airtel',
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
                                  '9mobile',
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
                                  'Glo',
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
                          keyboardType: TextInputType.number,
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
                            'Choose Plan',
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
                      padding: EdgeInsets.only(left: 20.0.w),
                      child: PreferredSize(
                        preferredSize: Size.fromHeight(30),
                        child: TabBar(
                          isScrollable: true,
                          dividerColor: PPaymobileColors.deepBackgroundColor,
                          tabAlignment: TabAlignment.start,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: PPaymobileColors.buttonColor,
                          indicatorWeight: 3,
                          labelPadding: EdgeInsets.symmetric(horizontal: 12),
                          labelStyle: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: PPaymobileColors.buttonColor,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            Tab(text: 'Popular Plans'),
                            Tab(text: 'Daily'),
                            Tab(text: 'Weekly'),
                            Tab(text: 'Monthly'),
                          ],
                        ),
                      ),
                    ),
                    44.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 65.h,
                            width: 125.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '7 days',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                8.verticalSpace,
                                Text(
                                  '1GB @ ₦1000',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 65.h,
                            width: 125.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2 days',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                8.verticalSpace,
                                Text(
                                  '2GB @ ₦400',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 65.h,
                            width: 125.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '7 days',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                8.verticalSpace,
                                Text(
                                  '5GB @ ₦1500',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
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
                            height: 65.h,
                            width: 125.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '1 day',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                8.verticalSpace,
                                Text(
                                  '1GB @ ₦300',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 65.h,
                            width: 125.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '3 days',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                8.verticalSpace,
                                Text(
                                  '4GB @ ₦3000',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 65.h,
                            width: 125.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '7 days',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                8.verticalSpace,
                                Text(
                                  '20GB @ ₦15000',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
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
                                builder: (context) => DataConfirmScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Buy Data',
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
                            backgroundColor:
                                PPaymobileColors.buttonColorandText,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(55.r),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DataConfirmScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Buy Data',
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
      ),
    );
  }
}
