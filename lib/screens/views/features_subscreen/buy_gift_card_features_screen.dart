import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/buy_gift_card_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/card_type_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/select_region_bottomsheet.dart';

class BuyGiftCardFeaturesScreen extends StatefulWidget {
  const BuyGiftCardFeaturesScreen({super.key});

  @override
  State<BuyGiftCardFeaturesScreen> createState() =>
      _BuyGiftCardFeaturesScreenState();
}

class _BuyGiftCardFeaturesScreenState extends State<BuyGiftCardFeaturesScreen> {
  void _selectValueDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.400,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Transform.translate(
                offset: const Offset(0, 0),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30).r,
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                    child: SizedBox(
                      height: 18.h,
                      width: 18.h,
                      child: SvgPicture.asset(
                        'assets/icon/cancel.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      top: 25.h,
                      right: 16.w,
                      bottom: 25.h,
                    ),
                    width: double.infinity,
                    height: 310.h,
                    decoration: BoxDecoration(
                      color: PPaymobileColors.mainScreenBackground,
                      borderRadius: BorderRadius.circular(13).r,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Value',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: Colors.black,
                          ),
                        ),
                        25.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 46.h,
                              width: 109.3.w,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PPaymobileColors.filterBorderColor,
                                  width: 1.w,
                                ),
                                color: PPaymobileColors.mainScreenBackground,
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                              child: Center(
                                child: Text(
                                  '\$30.00',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 46.h,
                              width: 109.3.w,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PPaymobileColors.filterBorderColor,
                                  width: 1.w,
                                ),
                                color: PPaymobileColors.mainScreenBackground,
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                              child: Center(
                                child: Text(
                                  '\$90.00',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 46.h,
                              width: 109.3.w,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PPaymobileColors.filterBorderColor,
                                  width: 1.w,
                                ),
                                color: PPaymobileColors.mainScreenBackground,
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                              child: Center(
                                child: Text(
                                  '\$120.00',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 46.h,
                              width: 109.3.w,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PPaymobileColors.filterBorderColor,
                                  width: 1.w,
                                ),
                                color: PPaymobileColors.mainScreenBackground,
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                              child: Center(
                                child: Text(
                                  '\$250.00',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 46.h,
                              width: 109.3.w,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PPaymobileColors.filterBorderColor,
                                  width: 1.w,
                                ),
                                color: PPaymobileColors.mainScreenBackground,
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                              child: Center(
                                child: Text(
                                  '\$500.00',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 46.h,
                              width: 109.3.w,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PPaymobileColors.filterBorderColor,
                                  width: 1.w,
                                ),
                                color: PPaymobileColors.mainScreenBackground,
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                              child: Center(
                                child: Text(
                                  '\$800.00',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 46.h,
                              width: 109.3.w,
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PPaymobileColors.filterBorderColor,
                                  width: 1.w,
                                ),
                                color: PPaymobileColors.mainScreenBackground,
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                              child: Center(
                                child: Text(
                                  '\$1000.00',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 46.h,
                              width: 109.3.w,
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PPaymobileColors.filterBorderColor,
                                  width: 1.w,
                                ),
                                color: PPaymobileColors.mainScreenBackground,
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                              child: Center(
                                child: Text(
                                  '\$2000.00',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 46.h,
                              width: 109.3.w,
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PPaymobileColors.filterBorderColor,
                                  width: 1.w,
                                ),
                                color: PPaymobileColors.mainScreenBackground,
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                              child: Center(
                                child: Text(
                                  '\$5000.00',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
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
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: PPaymobileColors.backgroundColor,
            toolbarHeight: 56,
            leadingWidth: 56.w,
            centerTitle: true,
            title: Text(
              'Buy Gift Card',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.mainScreenBackground,
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
                    'assets/icon/arrow_back_white.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            expandedHeight: 239.h,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/buy_card_head.png'),
                    fit: BoxFit.cover,
                  ),
                  color: PPaymobileColors.backgroundColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      109.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 32.h,
                                width: 79.w,
                                child: Image.asset(
                                  'assets/images/buy_naija.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              16.verticalSpace,
                              Text(
                                'Wallet Balance',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.mainScreenBackground,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              2.verticalSpace,
                              Text(
                                '₦400,000.00',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.mainScreenBackground,
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 19.h,
                            width: 19.w,
                            child: SvgPicture.asset(
                              'assets/icon/checkmark.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.verticalSpace,
                  Text(
                    'Enter Details',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    'Please enter the details below to purchase a giftcard',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  40.verticalSpace,
                  Text(
                    'Region',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  SizedBox(
                    height: 54.h,
                    width: double.infinity,
                    child: TextFormField(
                      showCursor: true,
                      readOnly: true,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return SelectRegionBottomsheet();
                          },
                        );
                      },
                      decoration: InputDecoration(
                        hint: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 23.h,
                              width: 23.w,
                              child: Image.asset(
                                'assets/images/nigeria_flag.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            16.horizontalSpace,
                            Text(
                              'Nigeria',
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
                    'Card Type',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  SizedBox(
                    height: 54.h,
                    width: double.infinity,
                    child: TextFormField(
                      showCursor: true,
                      readOnly: true,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return CardTypeBottomsheet();
                          },
                        );
                      },
                      decoration: InputDecoration(
                        hint: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 19.h,
                              width: 29.w,
                              child: Image.asset(
                                'assets/images/amazon_1.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            16.horizontalSpace,
                            Text(
                              'Amazon',
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
                    'Card Value',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 54.h,
                        width: 224.w,
                        child: TextFormField(
                          showCursor: true,
                          readOnly: true,
                          onTap: _selectValueDialog,
                          // onTap: () {
                          //   showModalBottomSheet(
                          //     context: context,
                          //     isScrollControlled: true,
                          //     backgroundColor: Colors.transparent,
                          //     builder: (context) {
                          //       return CardTypeBottomsheet();
                          //     },
                          //   );
                          // },
                          decoration: InputDecoration(
                            hint: Text(
                              '\$30.00',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
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
                      24.horizontalSpace,
                      SizedBox(
                        width: 152.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 38.h,
                              width: 38.w,
                              child: Image.asset(
                                'assets/images/remove_green.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 38.h,
                              width: 38.w,
                              child: Image.asset(
                                'assets/images/add_green.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  RichText(
                    text: TextSpan(
                      text: 'You will pay: ₦ 30,000.00 ',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: '(Insufficient Fund) ',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.redTextfield,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  78.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/checkmark_square.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      10.horizontalSpace,
                      RichText(
                        text: TextSpan(
                          text: 'You agree to our ',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: 'terms and condition',
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
                    ],
                  ),
                  20.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return BuyGiftCardBottomsheet();
                        },
                      );
                    },
                    child: SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/ptp.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/processing.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  10.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
