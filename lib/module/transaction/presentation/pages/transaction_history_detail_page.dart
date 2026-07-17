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

@RoutePage()
class TransactionHistoryDetailPage extends HookConsumerWidget {
  final TransactionEntity transaction;
  const TransactionHistoryDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCredit = transaction.type.isCredit;
    final amountColor = _amountColor(transaction.status, isCredit);
    final amountPrefix = isCredit ? '+' : '-';

    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: PPAppBar(title: 'Transaction Details'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              16.verticalSpace,
              // Header card
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                color: PPaymobileColors.mainScreenBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 55.w,
                      width: 55.w,
                      decoration: BoxDecoration(
                        color: _iconBg(transaction.type),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          _iconPath(transaction.type),
                          width: 24.w,
                          height: 24.w,
                          fit: BoxFit.contain,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    12.verticalSpace,
                    Text(
                      '$amountPrefix₦${AmountFormatter.formatBalance(transaction.amount)}',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: amountColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      transaction.title,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.svgIconColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    12.verticalSpace,
                    _StatusBadge(status: transaction.status),
                  ],
                ),
              ),
              16.verticalSpace,
              // Details card
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.h),
                color: PPaymobileColors.mainScreenBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _DetailRow(label: 'Date', value: _formatDate(transaction.date)),
                    _DetailRow(label: 'Time', value: _formatTime(transaction.date)),
                    _DetailRow(
                      label: 'Transaction ID',
                      value: transaction.transactionId,
                      copyable: true,
                    ),
                    if (transaction.reference != null)
                      _DetailRow(
                        label: 'Reference',
                        value: transaction.reference!,
                        copyable: true,
                      ),
                    _DetailRow(
                      label: 'Amount',
                      value: '₦${AmountFormatter.formatBalance(transaction.amount)}',
                    ),
                    _DetailRow(
                      label: 'Fee',
                      value: '₦${AmountFormatter.formatBalance(transaction.fee)}',
                    ),

                    ..._typeSpecificRows(transaction),
                    Divider(height: 32.h, color: PPaymobileColors.deepBackgroundColor),
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
                          '₦${AmountFormatter.formatBalance(_total(transaction))}',
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
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _typeSpecificRows(TransactionEntity tx) {
    final details = tx.details;
    if (details == null) return [];

    switch (tx.type) {
      case TransactionType.walletFunding:
      case TransactionType.cardFunding:
        return [
          if (details['fromAccountName'] != null)
            _DetailRow(label: 'From', value: details['fromAccountName'] as String),
          if (details['fromAccountNumber'] != null)
            _DetailRow(label: 'Account No', value: details['fromAccountNumber'] as String),
          if (details['fromBankName'] != null)
            _DetailRow(label: 'Bank', value: details['fromBankName'] as String),
        ];
      case TransactionType.walletWithdrawal:
      case TransactionType.cardWithdrawal:
        return [
          if (details['toAccountName'] != null)
            _DetailRow(label: 'To', value: details['toAccountName'] as String),
          if (details['toAccountNumber'] != null)
            _DetailRow(label: 'Account No', value: details['toAccountNumber'] as String),
          if (details['toBankName'] != null)
            _DetailRow(label: 'Bank', value: details['toBankName'] as String),
        ];
      case TransactionType.billPayment:
        return [
          if (details['billerName'] != null)
            _DetailRow(label: 'Biller', value: details['billerName'] as String),
          if (details['billerCategory'] != null)
            _DetailRow(label: 'Category', value: details['billerCategory'] as String),
          if (details['phoneNumber'] != null)
            _DetailRow(label: 'Phone', value: details['phoneNumber'] as String),
          if (details['meterNumber'] != null)
            _DetailRow(label: 'Meter No', value: details['meterNumber'] as String),
          if (details['plan'] != null)
            _DetailRow(label: 'Plan', value: details['plan'] as String),
        ];
      case TransactionType.cryptoPurchase:
      case TransactionType.cryptoSale:
      case TransactionType.cryptoDeposit:
        return [
          if (details['currency'] != null)
            _DetailRow(label: 'Currency', value: (details['currency'] as String).toUpperCase()),
          if (details['amountInCrypto'] != null)
            _DetailRow(label: 'Crypto Amount', value: details['amountInCrypto'].toString()),
          if (details['ratePerDollar'] != null)
            _DetailRow(label: 'Rate/Dollar', value: details['ratePerDollar'].toString()),
        ];
      case TransactionType.giftcardPurchase:
      case TransactionType.giftcardSale:
        return [
          if (details['type'] != null)
            _DetailRow(label: 'Card Type', value: details['type'] as String),
          if (details['region'] != null)
            _DetailRow(label: 'Region', value: details['region'] as String),
          if (details['country'] != null)
            _DetailRow(label: 'Country', value: details['country'] as String),
          if (details['amountInUsd'] != null)
            _DetailRow(label: 'Amount (USD)', value: '\$${details['amountInUsd']}'),
        ];
      case TransactionType.shopping:
        return [
          if (details['orderNumber'] != null)
            _DetailRow(label: 'Order No', value: details['orderNumber'] as String),
          if (details['status'] != null)
            _DetailRow(label: 'Order Status', value: details['status'] as String),
        ];
      case TransactionType.flightBooking:
        return [
          if (details['bookingReference'] != null)
            _DetailRow(
              label: 'Booking Ref',
              value: details['bookingReference'] as String,
              copyable: true,
            ),
          if (details['tripType'] != null)
            _DetailRow(label: 'Trip Type', value: details['tripType'] as String),
          if (details['status'] != null)
            _DetailRow(label: 'Booking Status', value: details['status'] as String),
        ];
    }
  }

  String _total(TransactionEntity tx) {
    final amount = double.tryParse(tx.amount) ?? 0;
    final fee = double.tryParse(tx.fee) ?? 0;
    return (amount + fee).toStringAsFixed(2);
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

  Color _amountColor(TransactionStatus status, bool isCredit) {
    if (status == TransactionStatus.failed) return PPaymobileColors.redTextfield;
    if (status == TransactionStatus.pending) return PPaymobileColors.svgIconColor;
    return isCredit ? PPaymobileColors.buttonColor : PPaymobileColors.redTextfield;
  }

  Color _iconBg(TransactionType type) {
    switch (type) {
      case TransactionType.walletFunding:
      case TransactionType.cardFunding:
        return PPaymobileColors.backgroundColor;
      case TransactionType.walletWithdrawal:
      case TransactionType.cardWithdrawal:
        return PPaymobileColors.transactRed;
      case TransactionType.billPayment:
        return const Color(0xFF6B4EFF);
      case TransactionType.cryptoPurchase:
      case TransactionType.cryptoSale:
      case TransactionType.cryptoDeposit:
        return const Color(0xFFF7931A);
      case TransactionType.giftcardPurchase:
      case TransactionType.giftcardSale:
        return const Color(0xFF00A86B);
      case TransactionType.shopping:
        return const Color(0xFF0066CC);
      case TransactionType.flightBooking:
        return const Color(0xFF1A1A2E);
    }
  }

  String _iconPath(TransactionType type) {
    switch (type) {
      case TransactionType.walletFunding:
      case TransactionType.cardFunding:
      case TransactionType.walletWithdrawal:
      case TransactionType.cardWithdrawal:
        return 'assets/icon/money.svg';
      case TransactionType.billPayment:
      case TransactionType.shopping:
      case TransactionType.flightBooking:
        return 'assets/icon/bill.svg';
      case TransactionType.cryptoPurchase:
      case TransactionType.cryptoSale:
      case TransactionType.cryptoDeposit:
        return 'assets/icon/crypto.svg';
      case TransactionType.giftcardPurchase:
      case TransactionType.giftcardSale:
        return 'assets/icon/gift.svg';
    }
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
        text = PPaymobileColors.highlightTextColor;
        label = 'Successful';
        break;
      case TransactionStatus.failed:
        bg = const Color(0xFFFFE5E5);
        text = PPaymobileColors.redTextfield;
        label = 'Failed';
        break;
      case TransactionStatus.pending:
        bg = const Color(0xFFFFF3CD);
        text = const Color(0xFF856404);
        label = 'Pending';
        break;
    }
    return UnconstrainedBox(
      child: Container(
        height: 24.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(34).r,
        ),
        child: Center(
          child: Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: text,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool copyable;
  const _DetailRow({required this.label, required this.value, this.copyable = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 22.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
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
                6.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: value));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$label copied'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: SvgPicture.asset(
                      'assets/icon/paste_black1.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
