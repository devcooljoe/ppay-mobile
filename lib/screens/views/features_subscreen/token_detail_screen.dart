import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/model/all_token_screen_model.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';
import 'package:ppay_mobile/screens/widgets/trade_bottomsheet.dart';

class TokenDetailScreen extends StatefulWidget {
  final TokenDetailModel token;

  const TokenDetailScreen({super.key, required this.token});

  @override
  State<TokenDetailScreen> createState() => _TokenDetailScreenState();
}

class _TokenDetailScreenState extends State<TokenDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          widget.token.tokenName,
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
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 42.h,
                      width: 42.w,
                      child: Image.asset(
                        widget.token.tokenImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                    9.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.token.totalAmount,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 13.h,
                                width: 13.w,
                                child: SvgPicture.asset(
                                  widget.token.increaseSvgIcon,
                                  height: 14.h,
                                  width: 14.w,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              6.horizontalSpace,
                              Text(
                                widget.token.increaseAmount,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.buttonColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              4.horizontalSpace,
                              Text(
                                '(${widget.token.increasePercent})',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.buttonColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                24.verticalSpace,
                SizedBox(
                  height: 268.h,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/crypto_line_group.png',
                    fit: BoxFit.contain,
                  ),
                ),
                40.verticalSpace,
                Container(
                  height: 69.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(10).r,
                  color: PPaymobileColors.deepBackgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 42.h,
                            width: 42.w,
                            child: Image.asset(
                              widget.token.tokenImage,
                              fit: BoxFit.contain,
                            ),
                          ),
                          12.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.token.tokenName,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.kyccontainerColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Primary Balance',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.token.availableBalance,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.kyccontainerColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            widget.token.availableCrypto,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                48.verticalSpace,
                Text(
                  'All Transactions',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                20.verticalSpace,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.token.transactionGroups.length,
                  separatorBuilder: (_, __) => 24.verticalSpace,
                  itemBuilder: (context, groupIndex) {
                    final group = widget.token.transactionGroups[groupIndex];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          group.day,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        12.verticalSpace,
                        ListView.separated(
                          itemCount: group.transactions.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, __) => 12.verticalSpace,
                          itemBuilder: (context, txIndex) {
                            final tx = group.transactions[txIndex];

                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Row(
                                children: [
                                  Container(
                                    height: 45.h,
                                    width: 45.w,
                                    decoration: BoxDecoration(
                                      color: tx.leadingIconBg,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        height: 24.h,
                                        width: 24.w,
                                        child: SvgPicture.asset(
                                          tx.leadingIcon,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  12.horizontalSpace,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tx.tokenName,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        4.verticalSpace,
                                        Text(
                                          tx.tokenAmount,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        tx.transactionPrice,
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      4.verticalSpace,
                                      Text(
                                        tx.status,
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          fontSize: 12.sp,
                                          color: tx.statusColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.0.w,
              right: 20.w,
              top: 5.h,
              bottom: 20.h,
            ).r,
            child: SizedBox(
              width: double.infinity,
              height: 54.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: PPaymobileColors.buttonColorandText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(42),
                  ),
                ),
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const TradeBottomsheet(),
                  );
                },
                child: Text(
                  'Trade',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: PPaymobileColors.mainScreenBackground,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
