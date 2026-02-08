import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/card_limit_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/card_transaction_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/fund_card_screen.dart';
import 'package:ppay_mobile/screens/widgets/card_details_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_switch.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  void _onFreezeSwitchTapped(bool newValue) async {
    if (newValue) {
      final confirmed = await _showFreezeDialog();
      if (confirmed != true) return;
    }
    setState(() {
      isEnabled = newValue;
    });
  }

  bool isEnabled = false;

  Future<bool?> _showFreezeDialog() {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.r),
          ),
          child: SizedBox(
            height: 282.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Freeze Card',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context, false),
                        child: SizedBox(
                          height: 20.56.h,
                          width: 20.56.w,
                          child: SvgPicture.asset(
                            'assets/icon/cancel1.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Text(
                    'Are you sure you want to freeze card. All transactions will be put on hold.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  66.verticalSpace,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context, true),
                          child: SizedBox(
                            height: 50.h,
                            width: 172.w,
                            child: Image.asset(
                              'assets/images/yes.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context, false),
                          child: SizedBox(
                            height: 50.h,
                            width: 172.w,
                            child: Image.asset(
                              'assets/images/cancel.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showBillingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: SizedBox(
            height: 434.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Below is your billing address details',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  45.verticalSpace,
                  Text(
                    'Address Information',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  18.verticalSpace,
                  Text(
                    'Billing Address',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '1234 Market Street, San Francisco, CA 94103, United States',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  37.verticalSpace,
                  Text(
                    'Postal Code',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '111010',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  46.verticalSpace,
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      height: 48.h,
                      width: 147.w,
                      child: Image.asset(
                        'assets/images/go_back.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
          'Virtual Card',
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              40.verticalSpace,
              Container(
                height: 173.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/card_image.png'),
                    fit: BoxFit.contain,
                  ),
                  color: PPaymobileColors.backgroundColor,
                  borderRadius: BorderRadius.circular(20).r,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 34.43.h,
                                  width: 36.w,
                                  child: Image.asset(
                                    'assets/images/pinnacle.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                16.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'PINNACLEPAY',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors
                                            .mainScreenBackground,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    2.verticalSpace,
                                    Text(
                                      'User Name',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors
                                            .mainScreenBackground,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                              width: 103.w,
                              child: Image.asset(
                                'assets/images/activate.png', //for existing users, use this instead 'assets/images/active.png'
                                fit: BoxFit
                                    .contain, //for blocked cards, use this instead 'assets/images/blocked.png'
                              ),
                            ),
                          ],
                        ),
                      ),
                      22.verticalSpace,
                      SizedBox(
                        height: 61.h,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Balance',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors
                                            .mainScreenBackground,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    // 6.verticalSpace,
                                    Text(
                                      '\$500.00',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors
                                            .mainScreenBackground,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '****000',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.mainScreenBackground,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              12.verticalSpace,
              Container(
                height: 66,
                width: double.infinity,
                color: PPaymobileColors.warningColor,
                padding: EdgeInsets.symmetric(vertical: 9.0.h, horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 22.6.h,
                      width: 26.w,
                      child: SvgPicture.asset(
                        'assets/icon/alert.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Your USD card has been created, to fully activate your card, click the activate or fund card button",
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.warningTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FundCardScreen(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 40.h,
                      width: 190.w,
                      child: Image.asset(
                        'assets/images/fund_card.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ), // for blocked card scenario, this is faded and the asset for this is 'assets/images/fund_faded.png',
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardTransactionScreen(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 40.h,
                      width: 190.w,
                      child: Image.asset(
                        'assets/images/transact.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              48.verticalSpace,
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const CardDetailsBottomsheet(),
                  );
                },
                child: Container(
                  height: 61.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Card Details',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Get and copy card information here',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                        width: 12.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_forward.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              27.verticalSpace,
              Container(
                height: 61.h,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: PPaymobileColors.textfiedBorder,
                      width: 1.w,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Freeze Card',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Click to pause all card activities',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 43.w,
                      height: 25.h,
                      child: CustomSwitch(
                        value: isEnabled,
                        onChanged: _onFreezeSwitchTapped,
                      ),
                    ),
                  ],
                ),
              ),
              27.verticalSpace,
              GestureDetector(
                onTap: _showBillingDialog,
                child: Container(
                  height: 61.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Billing Address',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Get your billing address info',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                        width: 12.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_forward.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              27.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CardLimitScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 61.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Card Limit',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Review all limit on your card',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                        width: 12.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_forward.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
