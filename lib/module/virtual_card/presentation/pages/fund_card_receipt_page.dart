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
class FundCardReceiptPage extends HookConsumerWidget {
  final double amountUsd;
  final double nairaAmount;
  final double rate;
  final DateTime fundedAt;

  const FundCardReceiptPage({
    super.key,
    required this.amountUsd,
    required this.nairaAmount,
    required this.rate,
    required this.fundedAt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formattedDate = _formatDate(fundedAt);
    final formattedTime = _formatTime(fundedAt);

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
                    Text(
                      'Dollar Card Funded',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.svgIconColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    7.verticalSpace,
                    Text(
                      '\$${amountUsd.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    3.verticalSpace,
                    SizedBox(
                      height: 24.h,
                      width: 99.w,
                      child: Image.asset('assets/images/success.png', fit: BoxFit.contain),
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.h),
                color: PPaymobileColors.mainScreenBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ReceiptRow(label: 'Date', value: formattedDate),
                    22.verticalSpace,
                    _ReceiptRow(label: 'Time', value: formattedTime),
                    22.verticalSpace,
                    _ReceiptRow(label: 'Amount', value: '\$${amountUsd.toStringAsFixed(2)}'),
                    22.verticalSpace,
                    _ReceiptRow(
                      label: 'Naira Amount',
                      value: '₦${AmountFormatter.formatBalance(nairaAmount.toStringAsFixed(2))}',
                    ),
                    22.verticalSpace,
                    _ReceiptRow(
                      label: 'Exchange Rate',
                      value: '₦${AmountFormatter.formatBalance(rate.toStringAsFixed(0))}/\$',
                    ),
                    21.verticalSpace,
                    Divider(color: PPaymobileColors.textfiedBorder, thickness: 1.h),
                    24.verticalSpace,
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
                          '₦${AmountFormatter.formatBalance(nairaAmount.toStringAsFixed(2))}',
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

  String _formatTime(DateTime date) {
    final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute$period';
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
            color: PPaymobileColors.svgIconColor,
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
              7.horizontalSpace,
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: value));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$label copied'), duration: const Duration(seconds: 2)),
                  );
                },
                child: SizedBox(
                  height: 21.w,
                  width: 21.w,
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
