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
class SellGiftcardPage extends HookConsumerWidget {
  final TransactionEntity transaction;
  const SellGiftcardPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = transaction.details ?? {};
    final cardType = details['type'] as String? ?? transaction.title;
    final region = details['region'] as String? ?? details['country'] as String? ?? '—';
    final amountInUsd = details['amountInUsd']?.toString() ?? '—';
    final nairaEquivalent = '₦${AmountFormatter.formatBalance(transaction.amount)}';
    final fee = '₦${AmountFormatter.formatBalance(transaction.fee)}';
    final total = () {
      final a = double.tryParse(transaction.amount) ?? 0;
      final f = double.tryParse(transaction.fee) ?? 0;
      return '₦${AmountFormatter.formatBalance((a + f).toStringAsFixed(2))}';
    }();

    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: PPAppBar(
        title: 'Transaction Details',
        onBackPressed: () => Navigator.pop(context),
      ),
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
                    CircleAvatar(
                      radius: 42.r,
                      backgroundColor: const Color(0xFF00A86B),
                      child: Text(
                        cardType.isNotEmpty ? cardType[0].toUpperCase() : 'G',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    11.verticalSpace,
                    Text(
                      '$cardType Gift Card',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    11.verticalSpace,
                    _StatusBadge(status: transaction.status),
                    11.verticalSpace,
                    Text(
                      amountInUsd != '—' ? '\$$amountInUsd' : nairaEquivalent,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      'Sold $cardType Gift Card',
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
                padding: EdgeInsets.only(
                  left: 16.w,
                  top: 23.w,
                  right: 16.w,
                  bottom: 12.h,
                ),
                color: PPaymobileColors.mainScreenBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _DetailRow(label: 'Date', value: _formatDate(transaction.date)),
                    _DetailRow(label: 'Time', value: _formatTime(transaction.date)),
                    _DetailRow(label: 'Region', value: region),
                    _DetailRow(
                      label: 'Transaction ID',
                      value: transaction.transactionId,
                      copyable: true,
                    ),
                    _DetailRow(label: 'Naira Equivalent', value: nairaEquivalent),
                    if (amountInUsd != '—')
                      _DetailRow(label: 'Amount', value: '\$$amountInUsd'),
                    _DetailRow(label: 'Fee', value: fee),
                    Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                    18.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          total,
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
        bg = PPaymobileColors.warningColor;
        text = PPaymobileColors.warningTextColor;
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
      height: 23.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: bg,
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
      padding: EdgeInsets.only(bottom: 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 14.sp,
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
                    fontSize: 14.sp,
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
                    child: SvgPicture.asset('assets/icon/paste.svg', fit: BoxFit.contain),
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
