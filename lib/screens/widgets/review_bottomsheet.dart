import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class ReviewBottomsheet extends StatefulWidget {
  const ReviewBottomsheet({super.key});

  @override
  State<ReviewBottomsheet> createState() => _ReviewBottomsheetState();
}

class _ReviewBottomsheetState extends State<ReviewBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.850,
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
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product description',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 24.sp,
                          color: Colors.black,
                        ),
                      ),
                      20.11.verticalSpace,
                      Text(
                        'Showing 5 of 234 reviews',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      41.23.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Sort by:',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w400,
                              fontSize: 18.1.sp,
                              color: Colors.black,
                            ),
                          ),
                          12.horizontalSpace,
                          Container(
                            height: 38.h,
                            width: 112.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4).r,
                              border: Border.all(
                                color: PPaymobileColors.filterBorderColor,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Newest',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.1.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/arrow_down.svg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      56.32.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 62.h,
                                width: 61.w,
                                child: Image.asset(
                                  'assets/images/person_comment.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              20.11.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 28.h,
                                    width: 248.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Sarah Elizabeth',
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Yesterday',
                                          style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.1.sp,
                                            color: PPaymobileColors
                                                .kyccontainerColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  8.verticalSpace,
                                  SizedBox(
                                    height: 25.h,
                                    width: 169.w,
                                    child: Image.asset(
                                      'assets/images/star_rating.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  8.verticalSpace,
                                  SizedBox(
                                    height: 52.h,
                                    width: 318.w,
                                    child: Text(
                                      'A great staple for any wardrobe. Will definitely buy more!',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  16.verticalSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 24.h,
                                            width: 24.w,
                                            child: SvgPicture.asset(
                                              'assets/icon/like.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          6.horizontalSpace,
                                          Text(
                                            '20',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.1.sp,
                                              color: PPaymobileColors
                                                  .kyccontainerColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      24.horizontalSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 24.h,
                                            width: 24.w,
                                            child: SvgPicture.asset(
                                              'assets/icon/dislike.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          6.horizontalSpace,
                                          Text(
                                            '0',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.1.sp,
                                              color: PPaymobileColors
                                                  .kyccontainerColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          20.verticalSpace,
                          Divider(
                            color: PPaymobileColors.textfiedBorder,
                            thickness: 1.h,
                          ),
                        ],
                      ),
                      44.25.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 62.h,
                                width: 61.w,
                                child: Image.asset(
                                  'assets/images/person_comment.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              20.11.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 28.h,
                                    width: 248.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Leslie Alexander',
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Yesterday',
                                          style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.1.sp,
                                            color: PPaymobileColors
                                                .kyccontainerColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  8.verticalSpace,
                                  SizedBox(
                                    height: 25.h,
                                    width: 169.w,
                                    child: Image.asset(
                                      'assets/images/star_rating.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  8.verticalSpace,
                                  SizedBox(
                                    height: 52.h,
                                    width: 318.w,
                                    child: Text(
                                      'A great staple for any wardrobe. Will definitely buy more!',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  16.verticalSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 24.h,
                                            width: 24.w,
                                            child: SvgPicture.asset(
                                              'assets/icon/like.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          6.horizontalSpace,
                                          Text(
                                            '20',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.1.sp,
                                              color: PPaymobileColors
                                                  .kyccontainerColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      24.horizontalSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 24.h,
                                            width: 24.w,
                                            child: SvgPicture.asset(
                                              'assets/icon/dislike.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          6.horizontalSpace,
                                          Text(
                                            '0',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.1.sp,
                                              color: PPaymobileColors
                                                  .kyccontainerColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          20.verticalSpace,
                          Divider(
                            color: PPaymobileColors.textfiedBorder,
                            thickness: 1.h,
                          ),
                        ],
                      ),
                      44.25.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 62.h,
                                width: 61.w,
                                child: Image.asset(
                                  'assets/images/person_comment.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              20.11.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 28.h,
                                    width: 248.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Bessie Cooper',
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Yesterday',
                                          style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.1.sp,
                                            color: PPaymobileColors
                                                .kyccontainerColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  8.verticalSpace,
                                  SizedBox(
                                    height: 25.h,
                                    width: 169.w,
                                    child: Image.asset(
                                      'assets/images/star_rating.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  8.verticalSpace,
                                  SizedBox(
                                    height: 52.h,
                                    width: 318.w,
                                    child: Text(
                                      'A great staple for any wardrobe. Will definitely buy more!',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  16.verticalSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 24.h,
                                            width: 24.w,
                                            child: SvgPicture.asset(
                                              'assets/icon/like.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          6.horizontalSpace,
                                          Text(
                                            '20',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.1.sp,
                                              color: PPaymobileColors
                                                  .kyccontainerColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      24.horizontalSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 24.h,
                                            width: 24.w,
                                            child: SvgPicture.asset(
                                              'assets/icon/dislike.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          6.horizontalSpace,
                                          Text(
                                            '0',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.1.sp,
                                              color: PPaymobileColors
                                                  .kyccontainerColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          20.verticalSpace,
                          Divider(
                            color: PPaymobileColors.textfiedBorder,
                            thickness: 1.h,
                          ),
                        ],
                      ),
                      48.27.verticalSpace,
                      Container(
                        height: 45.h,
                        width: 135.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6).r,
                          border: Border.all(
                            color: PPaymobileColors.textfiedBorder,
                            width: 1.w,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Show more',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              color: PPaymobileColors.darkGrey,
                            ),
                          ),
                        ),
                      ),
                      82.19.verticalSpace,
                      Text(
                        'Total Customer Review',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      17.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 26.h,
                            width: 159.w,
                            child: Image.asset(
                              'assets/images/star_rating.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '4.8',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: '/5',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      10.54.verticalSpace,
                      Divider(
                        color: PPaymobileColors.textfiedBorder,
                        thickness: 1.h,
                      ),
                      25.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.1.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                13.63.horizontalSpace,
                                SizedBox(
                                  height: 16.h,
                                  width: 281.w,
                                  child: Image.asset(
                                    'assets/images/rating_line_1.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                14.64.horizontalSpace,
                                Text(
                                  '29',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.1.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      14.88.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.1.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                13.63.horizontalSpace,
                                SizedBox(
                                  height: 16.h,
                                  width: 281.w,
                                  child: Image.asset(
                                    'assets/images/rating_line_5.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                14.64.horizontalSpace,
                                Text(
                                  '29',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.1.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      14.88.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.1.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                13.63.horizontalSpace,
                                SizedBox(
                                  height: 16.h,
                                  width: 281.w,
                                  child: Image.asset(
                                    'assets/images/rating_line_5.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                14.64.horizontalSpace,
                                Text(
                                  '29',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.1.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      14.88.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.1.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                13.63.horizontalSpace,
                                SizedBox(
                                  height: 16.h,
                                  width: 281.w,
                                  child: Image.asset(
                                    'assets/images/rating_line_1.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                14.64.horizontalSpace,
                                Text(
                                  '29',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.1.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      14.88.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.1.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                13.63.horizontalSpace,
                                SizedBox(
                                  height: 16.h,
                                  width: 281.w,
                                  child: Image.asset(
                                    'assets/images/rating_line_5.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                14.64.horizontalSpace,
                                Text(
                                  '29',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.1.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      65.verticalSpace,
                      Text(
                        'Rate Product',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 24.1.sp,
                          color: Colors.black,
                        ),
                      ),
                      26.15.verticalSpace,
                      Text(
                        'Leave your rating for this product',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.1.sp,
                          color: Colors.black,
                        ),
                      ),
                      15.1.verticalSpace,
                      SizedBox(
                        height: 35.4.h,
                        child: Image.asset(
                          'assets/images/star_unrate.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      56.32.verticalSpace,
                      Text(
                        'Leave Review',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 20.1.sp,
                          color: Colors.black,
                        ),
                      ),
                      20.11.verticalSpace,
                      Container(
                        height: 170.h,
                        width: double.infinity,
                        padding: EdgeInsets.all(16).r,
                        decoration: BoxDecoration(
                          color: PPaymobileColors.deepBackgroundColor,
                          borderRadius: BorderRadius.circular(6).r,
                        ),
                        child: TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Leave Comment',
                            hintStyle: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w400,
                              fontSize: 18.1.sp,
                              color: PPaymobileColors.darkGrey,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      27.15.verticalSpace,
                      SizedBox(
                        height: 42.h,
                        width: 147.w,
                        child: Image.asset(
                          'assets/images/submit.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      12.verticalSpace,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
