import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/model/history_model.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
        title: Text(
          'Transaction History',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              42.verticalSpace,
              Row(
                children: [
                  Container(
                    height: 54.h,
                    width: 314.w,
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
                  Container(
                    height: 54.h,
                    width: 86.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 11.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6).r,
                        bottomRight: Radius.circular(6).r,
                      ),
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
                            height: 14.h,
                            width: 14.w,
                            child: SvgPicture.asset(
                              'assets/icon/filter.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          6.horizontalSpace,
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.textfiedBorder,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //28.verticalSpace,
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: transactionGroups.length,
                  itemBuilder: (context, groupIndex) {
                    final group = transactionGroups[groupIndex];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        38.verticalSpace,
                        Text(
                          group.dayLabel,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        32.verticalSpace,
                        //transactions
                        ListView.separated(
                          itemCount: group.transactions.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, __) => 28.verticalSpace,
                          itemBuilder: (context, index) {
                            final transaction = group.transactions[index];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                height: 50.h,
                                width: 50.w,
                                padding: EdgeInsets.all(10).r,
                                decoration: BoxDecoration(
                                  color: transaction.containerColor,
                                  borderRadius: BorderRadius.circular(25).r,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    transaction.imageAsset,
                                    height: 26.h,
                                    width: 22.w,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              title: Text(
                                transaction.title,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                transaction.subtitle,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.svgIconColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: Text(
                                transaction.amount,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: transaction.amountColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => transaction.screen,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
