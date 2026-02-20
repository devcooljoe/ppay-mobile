import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/transaction_details_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/filter_transactions_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class CardTransactionScreen extends StatefulWidget {
  const CardTransactionScreen({super.key});

  @override
  State<CardTransactionScreen> createState() => _CardTransactionScreenState();
}

class _CardTransactionScreenState extends State<CardTransactionScreen> {
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
          'Card Transaction',
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              40.verticalSpace,
              Row(
                children: [
                  Container(
                    height: 46.h,
                    width: 302.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4).r,
                        bottomLeft: Radius.circular(4).r,
                      ),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: SvgPicture.asset(
                            'assets/icon/bank_search.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintText: 'Search Transaction',
                        hintStyle: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.textfiedBorder,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: PPaymobileColors.deepBackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 14.h,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4).r,
                            bottomLeft: Radius.circular(4).r,
                          ),
                        ),
                      ),
                    ),
                  ),
                  14.horizontalSpace,
                  TouchOpacity(
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const FilterTransactionsBottomsheet(),
                      );
                    },
                    child: Container(
                      height: 44.h,
                      width: 84.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 11.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                          width: 1.w,
                          color: PPaymobileColors.filterBorderColor,
                        ),
                        color: PPaymobileColors.mainScreenBackground,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 16.h,
                              width: 16.h,
                              child: SvgPicture.asset(
                                'assets/icon/filter_2.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            6.horizontalSpace,
                            Text(
                              'Filter',
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
                  ),
                ],
              ),
              42.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  20.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionDetailsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 68.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50.h,
                                width: 50.w,
                                child: Image.asset(
                                  'assets/images/netflix1.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              7.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Netfix Subscription',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  6.verticalSpace,
                                  Text(
                                    'July 23, 02:00PM',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: PPaymobileColors.svgIconColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '- \$23.00',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.transactRed,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  22.verticalSpace,
                  Text(
                    'Yesterday',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  20.verticalSpace,
                  Container(
                    height: 68.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: Image.asset(
                                'assets/images/logo1.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            7.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Top Up from wallet',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                6.verticalSpace,
                                Text(
                                  'July 23, 02:00PM',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    color: PPaymobileColors.svgIconColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '+ \$50.00',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.doneTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  22.verticalSpace,
                  Container(
                    height: 68.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: Image.asset(
                                'assets/images/apple1.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            7.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Apple Subscription',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                6.verticalSpace,
                                Text(
                                  'July 23, 02:00PM',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    color: PPaymobileColors.svgIconColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '- \$2.00',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.transactRed,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  22.verticalSpace,
                  Container(
                    height: 68.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: Image.asset(
                                'assets/images/amazon.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            7.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amazon Subscription',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                6.verticalSpace,
                                Text(
                                  'July 23, 02:00PM',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    color: PPaymobileColors.svgIconColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '- \$9.08',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.transactRed,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
