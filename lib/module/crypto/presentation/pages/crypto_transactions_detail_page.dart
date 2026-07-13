import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class CryptoTransactionsDetailPage extends HookConsumerWidget {
  final TransactionEntity transaction;
  const CryptoTransactionsDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = (transaction.details?['currency'] as String? ?? '').toUpperCase();
    final cryptoAmount = transaction.details?['amountInCrypto']?.toString() ?? '';
    final rate = transaction.details?['ratePerDollar']?.toString();

    final isSale = transaction.type == TransactionType.cryptoSale;
    final isDeposit = transaction.type == TransactionType.cryptoDeposit;

    final typeLabel = isSale ? 'Sold' : isDeposit ? 'Received' : 'Bought';
    final badgeColor = isSale ? const Color(0xFFFF3336) : PPaymobileColors.buttonColor;
    final arrowIcon = isSale
        ? 'assets/icon/arrow_up_white.svg'
        : 'assets/icon/arrow_down_white.svg';

    final cryptoDisplay = cryptoAmount.isNotEmpty && currency.isNotEmpty
        ? '${isSale ? '-' : '+'}$cryptoAmount $currency'
        : transaction.title;

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Receipt'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            51.verticalSpace,
            Text(
              typeLabel,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            12.verticalSpace,
            SizedBox(
              height: 83.w,
              width: 83.w,
              child: Stack(
                children: [
                  Container(
                    height: 83.w,
                    width: 83.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFF7931A),
                    ),
                    child: Center(
                      child: Text(
                        currency.isNotEmpty ? currency.substring(0, 1) : 'C',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 57.h,
                    left: 57.w,
                    child: Container(
                      height: 26.h,
                      width: 26.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13).r,
                        color: badgeColor,
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 18.w,
                          width: 18.w,
                          child: SvgPicture.asset(arrowIcon, fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            7.verticalSpace,
            Text(
              cryptoDisplay,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            53.verticalSpace,
            _DetailRow(label: 'Date', value: _formatDate(transaction.date)),
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                _StatusBadge(status: transaction.status),
              ],
            ),
            24.verticalSpace,
            if (rate != null) ...[
              _DetailRow(
                label: 'Price',
                value: '1 $currency - ₦${AmountFormatter.formatBalance(rate)}',
              ),
              24.verticalSpace,
            ],
            _DetailRow(
              label: 'Amount',
              value: '₦${AmountFormatter.formatBalance(transaction.amount)}',
            ),
            24.verticalSpace,
            _DetailRow(
              label: 'Fee',
              value: '₦${AmountFormatter.formatBalance(transaction.fee)}',
            ),
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaction ID: ',
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
                      constraints: BoxConstraints(maxWidth: 140.w),
                      child: Text(
                        transaction.transactionId,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    7.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: transaction.transactionId));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Transaction ID copied'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 21.w,
                        width: 21.w,
                        child: SvgPicture.asset('assets/icon/paste_black1.svg', fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            50.verticalSpace,
            PPButton(
              text: 'Share Receipt',
              onPressed: () {},
              icon: SizedBox(
                height: 24.w,
                width: 24.w,
                child: SvgPicture.asset('assets/icon/share_white.svg'),
              ),
            ),
            19.verticalSpace,
            PPButton(
              text: 'Download',
              onPressed: () {},
              icon: SizedBox(
                height: 24.w,
                width: 24.w,
                child: SvgPicture.asset('assets/icon/download.svg', fit: BoxFit.contain),
              ),
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour < 12 ? 'AM' : 'PM';
    return '${date.day} ${months[date.month]}, ${date.year} $hour:$minute$period';
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

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
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200.w),
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
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final TransactionStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color text;
    String label;
    switch (status) {
      case TransactionStatus.successful:
        bg = PPaymobileColors.doneColor;
        text = PPaymobileColors.doneTextColor;
        label = 'Successful';
        break;
      case TransactionStatus.failed:
        bg = const Color(0xFFFFE5E5);
        text = PPaymobileColors.redTextfield;
        label = 'Failed';
        break;
      case TransactionStatus.pending:
        bg = PPaymobileColors.warningColor;
        text = PPaymobileColors.warningTextColor;
        label = 'Pending';
        break;
    }
    return Container(
      height: 28.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
        color: bg,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: text,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
