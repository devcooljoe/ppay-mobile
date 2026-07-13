import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';

@RoutePage()
class GiftCardBuyReceiptPage extends HookConsumerWidget {
  final String cardType;
  final double amountInNaira;
  final double amountInUSD;
  final String region;
  final double rate;
  final DateTime purchasedAt;

  const GiftCardBuyReceiptPage({
    super.key,
    required this.cardType,
    required this.amountInNaira,
    required this.amountInUSD,
    required this.region,
    required this.rate,
    required this.purchasedAt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: PPAppBar(title: 'Receipt'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              16.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                color: PPaymobileColors.mainScreenBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 84.w,
                      width: 84.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: PPaymobileColors.deepBackgroundColor,
                      ),
                      child: Center(
                        child: Text(
                          cardType.isNotEmpty ? cardType[0].toUpperCase() : 'G',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.backgroundColor,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    11.verticalSpace,
                    Text(
                      '$cardType Gift Card',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.svgIconColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    11.verticalSpace,
                    SizedBox(
                      height: 24.h,
                      width: 99.w,
                      child: Image.asset('assets/images/success.png', fit: BoxFit.contain),
                    ),
                    11.verticalSpace,
                    Text(
                      '₦${AmountFormatter.formatBalance(amountInNaira.toStringAsFixed(2))}',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      'Purchased $cardType Gift Card',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.svgIconColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                color: PPaymobileColors.mainScreenBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ReceiptRow(label: 'Date', value: _formatDate(purchasedAt)),
                    18.verticalSpace,
                    _ReceiptRow(label: 'Region', value: region),
                    18.verticalSpace,
                    _ReceiptRow(
                      label: 'Dollar Amount',
                      value: '\$${amountInUSD.toStringAsFixed(2)}',
                    ),
                    18.verticalSpace,
                    _ReceiptRow(
                      label: 'Naira Equivalent',
                      value: '₦${AmountFormatter.formatBalance(amountInNaira.toStringAsFixed(2))}',
                    ),
                    18.verticalSpace,
                    _ReceiptRow(
                      label: 'Rate',
                      value: '₦${AmountFormatter.formatBalance(rate.toStringAsFixed(2))}/\$',
                    ),
                    20.verticalSpace,
                    Divider(color: PPaymobileColors.textfiedBorder, thickness: 1.h),
                    18.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '₦${AmountFormatter.formatBalance(amountInNaira.toStringAsFixed(2))}',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${date.day} ${months[date.month]}, ${date.year}';
  }
}

class _ReceiptRow extends StatelessWidget {
  final String label;
  final String value;
  final bool copyable;

  const _ReceiptRow({required this.label, required this.value, this.copyable = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label: ',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 180.w),
              child: Text(
                value,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (copyable) ...[
              6.horizontalSpace,
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: value));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$label copied'), duration: const Duration(seconds: 2)),
                  );
                },
                child: SizedBox(
                  height: 20.w,
                  width: 20.w,
                  child: SvgPicture.asset('assets/icon/paste_black1.svg', fit: BoxFit.contain),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
