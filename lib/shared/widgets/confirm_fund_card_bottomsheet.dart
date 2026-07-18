import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/fund_card_pin_bottomsheet.dart';

class ConfirmFundCardBottomsheet extends HookConsumerWidget {
  final String cardId;
  final double amountUsd;
  final double nairaAmount;
  final double rate;
  final double walletBalance;

  const ConfirmFundCardBottomsheet({
    super.key,
    required this.cardId,
    required this.amountUsd,
    required this.nairaAmount,
    required this.rate,
    required this.walletBalance,
  });

  void _openPinSheet(BuildContext context) {
    Navigator.pop(context);
    Future.delayed(const Duration(milliseconds: 200), () {
      if (context.mounted) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => FundCardPinBottomsheet(
            cardId: cardId,
            amountUsd: amountUsd,
            nairaAmount: nairaAmount,
            rate: rate,
          ),
        );
      }
    });
  }

  String _formatNaira(double value) {
    final parts = value.toStringAsFixed(2).split('.');
    final intPart = parts[0].replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');
    return '₦$intPart.${parts[1]}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasEnoughBalance = walletBalance >= nairaAmount;

    Widget row(String label, String value) => Padding(
      padding: EdgeInsets.only(bottom: 22.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
        ],
      ),
    );

    return FractionallySizedBox(
      heightFactor: 0.880,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w, width: 60.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30).r, color: PPaymobileColors.mainScreenBackground),
              child: SizedBox(height: 18.h, width: 18.h, child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown)),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Confirmation', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 20.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                  Text('Please confirm details of your transaction', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                  29.verticalSpace,
                  Container(
                    height: 43.h, width: double.infinity,
                    padding: const EdgeInsets.all(10).r,
                    color: PPaymobileColors.deepBackgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.w, width: 16.w, child: SvgPicture.asset('assets/icon/info_blue.svg', fit: BoxFit.contain)),
                        8.horizontalSpace,
                        Text('Dollar card funding will be made instantly', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                      ],
                    ),
                  ),
                  39.verticalSpace,
                  Text('Transfer from:', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                  4.verticalSpace,
                  Row(
                    children: [
                      SizedBox(height: 24.w, width: 24.w, child: Image.asset('assets/images/nigeria_flag.png', fit: BoxFit.contain)),
                      8.horizontalSpace,
                      Text('Pinnaclepay Wallet Balance', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                    ],
                  ),
                  40.verticalSpace,
                  Text('Available Balance:', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                  4.verticalSpace,
                  Text(_formatNaira(walletBalance), style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                  if (!hasEnoughBalance) ...[
                    4.verticalSpace,
                    Text('Insufficient wallet balance', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 12.sp, fontWeight: FontWeight.w500, color: PPaymobileColors.redTextfield)),
                  ],
                  14.verticalSpace,
                  Divider(color: PPaymobileColors.textfiedBorder, thickness: 1.h),
                  22.verticalSpace,
                  row('Exchange rate:', '${rate.toStringAsFixed(0)}/\$'),
                  row('Amount Funding:', '\$${amountUsd.toStringAsFixed(2)}'),
                  row('Naira Amount:', _formatNaira(nairaAmount)),
                  Divider(color: PPaymobileColors.textfiedBorder, thickness: 1.h),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)),
                      Text(_formatNaira(nairaAmount), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hasEnoughBalance ? PPaymobileColors.buttonColorandText : PPaymobileColors.deepBackgroundColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24).r),
                        elevation: 0,
                      ),
                      onPressed: hasEnoughBalance ? () => _openPinSheet(context) : null,
                      child: Text(
                        'Confirm Payment',
                        style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w600, fontSize: 16.sp, color: PPaymobileColors.mainScreenBackground),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
