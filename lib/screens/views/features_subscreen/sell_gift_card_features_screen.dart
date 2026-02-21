import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/confirm_gift_card_sell_screen.dart';
import 'package:ppay_mobile/screens/widgets/card_category_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/card_type_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class SellGiftCardFeaturesScreen extends StatefulWidget {
  const SellGiftCardFeaturesScreen({super.key});

  @override
  State<SellGiftCardFeaturesScreen> createState() =>
      _SellGiftCardFeaturesScreenState();
}

class _SellGiftCardFeaturesScreenState
    extends State<SellGiftCardFeaturesScreen> {
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
              'Sell Gift Card',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.mainScreenBackground,
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
                    'assets/icon/arrow_back_white.svg',
                    fit: BoxFit.scaleDown,
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
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 5.h,
                                      left: 23.w,
                                      child: Container(
                                        height: 23.h,
                                        width: 56.w,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(19.r),
                                            bottomRight: Radius.circular(19.r),
                                          ),
                                          color: Color(
                                            0xFF429E6E,
                                          ).withValues(alpha: 0.30),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'NGN',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: PPaymobileColors
                                                  .mainScreenBackground,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0.h,
                                      left: 0,
                                      child: Container(
                                        height: 32.h,
                                        width: 32.h,
                                        padding: EdgeInsets.all(5).r,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ).r,
                                          color: Color(
                                            0xff9EB9AB,
                                          ).withValues(alpha: 0.54),
                                        ),
                                        child: Center(
                                          child: Container(
                                            height: 22.h,
                                            width: 22.h,
                                            padding: EdgeInsets.all(2).r,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(11).r,
                                              gradient: LinearGradient(
                                                colors: [
                                                  PPaymobileColors
                                                      .mainScreenBackground,
                                                  Color(0xffD2D2D2),
                                                ],
                                                begin:
                                                    AlignmentGeometry.topLeft,
                                                end: AlignmentGeometry
                                                    .bottomRight,
                                              ),
                                            ),
                                            child: Center(
                                              child: SizedBox(
                                                height: 23.w,
                                                width: 23.w,
                                                child: Image.asset(
                                                  'assets/images/flag.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                            height: 19.w,
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
                              height: 23.w,
                              width: 23.w,
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
                    'Card Category',
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
                            return CardCategoryBottomsheet();
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
                              'Amazon UK',
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
                    'Amount',
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

                      decoration: InputDecoration(
                        hint: RichText(
                          text: TextSpan(
                            text: '\$ ',
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
                                  color: PPaymobileColors.textfiedBorder,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
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
                    'You Get',
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
                                text: '0.00',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        filled: true,
                        fillColor: PPaymobileColors.deepBackgroundColor,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 14.h,
                        ),
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  RichText(
                    text: TextSpan(
                      text: 'Rate: ',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: '₦1,650',
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
                  32.verticalSpace,
                  Text(
                    'Amount',
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
                      decoration: InputDecoration(
                        hint: Text(
                          'Optional',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.textfiedBorder,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
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
                  Text(
                    'Upload Image',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  TouchOpacity(
                    child: Container(
                      height: 109.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 19.h,
                      ),
                      decoration: BoxDecoration(
                        color: PPaymobileColors.deepBackgroundColor,
                        borderRadius: BorderRadius.circular(4).r,
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 71.h,
                          width: 283.w,
                          child: Image.asset(
                            'assets/images/add_image.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  26.verticalSpace,
                  //this row only shows after the image has been picked
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 68.1.h,
                            width: 81.5.w,
                            child: Image.asset(
                              'assets/images/image_box.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          17.horizontalSpace,
                          SizedBox(
                            height: 68.1.h,
                            width: 81.5.w,
                            child: Image.asset(
                              'assets/images/image_box.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.w,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/delete_1.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  32.verticalSpace,
                  Text(
                    'Note:',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8.h,
                        width: 8.h,
                        child: SvgPicture.asset(
                          'assets/icon/indicator_2.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      6.horizontalSpace,
                      Text(
                        'Check your gift card expiry date',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.svgIconColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8.h,
                        width: 8.h,
                        child: SvgPicture.asset(
                          'assets/icon/indicator_2.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      6.horizontalSpace,
                      Text(
                        'Take a clear image of gift card',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.svgIconColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8.h,
                        width: 8.h,
                        child: SvgPicture.asset(
                          'assets/icon/indicator_2.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      6.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Only upload original card images. Do not crop out sections',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8.h,
                        width: 8.h,
                        child: SvgPicture.asset(
                          'assets/icon/indicator_2.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      6.horizontalSpace,
                      Text(
                        'Ensure you capture the card code',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.svgIconColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  78.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.w,
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
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmGiftCardSellScreen(),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Proceed',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  16.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
