import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_transaction_entity.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';

@RoutePage()
class TransactionDetailsPage extends HookConsumerWidget {
  final DollarCardTransactionEntity transaction;

  const TransactionDetailsPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDebit = transaction.entry == 'DEBIT';

    String formatDateTime(String createdAt, {bool timeOnly = false}) {
      try {
        final dt = DateTime.parse(createdAt).toLocal();
        if (timeOnly) {
          final h = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
          final m = dt.minute.toString().padLeft(2, '0');
          final period = dt.hour >= 12 ? 'PM' : 'AM';
          return '$h:$m$period';
        }
        const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        return '${dt.day} ${months[dt.month - 1]}, ${dt.year}';
      } catch (_) {
        return createdAt;
      }
    }

    Widget detailRow(String label, Widget value) {
      return Padding(
        padding: EdgeInsets.only(bottom: 22.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
            value,
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: PPAppBar(title: 'Transaction Details'),
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
                      height: 55.w, width: 55.w,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: PPaymobileColors.deepBackgroundColor),
                      child: Center(
                        child: Text(
                          transaction.merchant.name.isNotEmpty ? transaction.merchant.name[0].toUpperCase() : transaction.description[0].toUpperCase(),
                          style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 24.sp, fontWeight: FontWeight.w600, color: PPaymobileColors.backgroundColor),
                        ),
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      '${isDebit ? '-' : '+'}\$${transaction.amount.toStringAsFixed(2)}',
                      style: TextStyle(fontFamily: 'InstrumentSans', color: isDebit ? PPaymobileColors.transactRed : PPaymobileColors.doneTextColor, fontSize: 32.sp, fontWeight: FontWeight.w500),
                    ),
                    3.verticalSpace,
                    Text(
                      transaction.merchant.name.isNotEmpty ? transaction.merchant.name : transaction.description,
                      style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    12.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: transaction.status == 'SUCCESS' ? PPaymobileColors.doneTextColor.withValues(alpha: 0.1) : Colors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12).r,
                      ),
                      child: Text(
                        transaction.status,
                        style: TextStyle(fontFamily: 'InstrumentSans', color: transaction.status == 'SUCCESS' ? PPaymobileColors.doneTextColor : Colors.red, fontSize: 12.sp, fontWeight: FontWeight.w500),
                      ),
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
                    detailRow('Date:', Text(formatDateTime(transaction.createdAt), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500))),
                    detailRow('Time:', Text(formatDateTime(transaction.createdAt, timeOnly: true), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500))),
                    detailRow(
                      'Transaction ID:',
                      Row(
                        children: [
                          Text(transaction.id.length > 12 ? '${transaction.id.substring(0, 12)}...' : transaction.id, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                          7.horizontalSpace,
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: transaction.id));
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Transaction ID copied'), duration: Duration(seconds: 1)));
                            },
                            child: SizedBox(height: 21.w, width: 21.w, child: SvgPicture.asset('assets/icon/paste_black1.svg', fit: BoxFit.contain)),
                          ),
                        ],
                      ),
                    ),
                    detailRow('Amount:', Text('\$${transaction.amount.toStringAsFixed(2)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500))),
                    detailRow('Type:', Text(transaction.entry, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500))),
                    if (transaction.description.isNotEmpty)
                      detailRow('Description:', Flexible(child: Text(transaction.description, textAlign: TextAlign.end, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)))),
                    if (transaction.merchant.name.isNotEmpty) ...[
                      Divider(color: PPaymobileColors.textfiedBorder, thickness: 1.h),
                      24.verticalSpace,
                      Text('Merchant', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                      16.verticalSpace,
                      detailRow('Name:', Text(transaction.merchant.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500))),
                      if (transaction.merchant.city.isNotEmpty)
                        detailRow('City:', Text(transaction.merchant.city, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500))),
                      if (transaction.merchant.country.isNotEmpty)
                        detailRow('Country:', Text(transaction.merchant.country, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500))),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
