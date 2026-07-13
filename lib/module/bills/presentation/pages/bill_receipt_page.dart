import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_type.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

String _customerLabel(BillType billType) {
  switch (billType) {
    case BillType.airtime:
    case BillType.data:
      return 'Recipient Number';
    case BillType.electricity:
      return 'Meter Number';
    case BillType.tv:
      return 'Smart Card Number';
    case BillType.betting:
      return 'User ID';
  }
}

@RoutePage()
class BillReceiptPage extends HookConsumerWidget {
  final BillConfirmArgs args;
  final String reference;
  final double fee;
  final DateTime purchasedAt;

  const BillReceiptPage({
    super.key,
    required this.args,
    required this.reference,
    required this.fee,
    required this.purchasedAt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final copied = useState(false);
    final formattedAmount =
        AmountFormatter.formatBalance(args.amount.toString());
    final formattedFee = AmountFormatter.formatBalance(fee.toString());
    final total = args.amount + fee;
    final formattedTotal = AmountFormatter.formatBalance(total.toString());
    final dateStr =
        DateFormat('d MMM, yyyy hh:mma').format(purchasedAt).toUpperCase();

    void copyRef() {
      Clipboard.setData(ClipboardData(text: reference));
      copied.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        if (context.mounted) copied.value = false;
      });
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: const PPAppBar(title: 'Receipt'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    32.verticalSpace,
                    // Header card with biller icon
                    SizedBox(
                      height: 200.h,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 41.h,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 163.h,
                              padding: EdgeInsets.only(
                                top: 43.h,
                                bottom: 25.h,
                                left: 5.w,
                                right: 5.w,
                              ),
                              decoration: BoxDecoration(
                                color: PPaymobileColors.mainScreenBackground,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    args.billType.label,
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '₦$formattedAmount',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 23.h,
                                    width: 108.w,
                                    child: Image.asset(
                                      'assets/images/success.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5.h,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                height: 67.w,
                                width: 67.w,
                                clipBehavior: Clip.hardEdge,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: AppImage(
                                  imageUrl: args.biller.billerIconUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.verticalSpace,
                    // Details card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: 16.w,
                        top: 23.h,
                        bottom: 20.h,
                        right: 16.w,
                      ),
                      color: PPaymobileColors.mainScreenBackground,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ReceiptRow(label: 'Date', value: dateStr),
                          24.verticalSpace,
                          _ReceiptRow(
                            label: _customerLabel(args.billType),
                            value: args.customerIdentifier,
                          ),
                          if (args.customerName.isNotEmpty) ...[
                            24.verticalSpace,
                            _ReceiptRow(
                              label: 'Customer Name',
                              value: args.customerName,
                            ),
                          ],
                          if (args.billType == BillType.data ||
                              args.billType == BillType.tv) ...[
                            24.verticalSpace,
                            _ReceiptRow(
                              label: 'Package',
                              value: args.billItem.name,
                            ),
                          ],
                          24.verticalSpace,
                          _ReceiptRow(
                            label: 'Provider',
                            value: args.biller.name,
                          ),
                          24.verticalSpace,
                          // Reference with copy
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reference',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.svgIconColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '#${reference.length > 12 ? reference.substring(0, 12) : reference}',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  7.horizontalSpace,
                                  GestureDetector(
                                    onTap: copyRef,
                                    child: SizedBox(
                                      height: 21.w,
                                      width: 21.w,
                                      child: SvgPicture.asset(
                                        copied.value
                                            ? 'assets/icon/tick_circle.svg'
                                            : 'assets/icon/paste_black1.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          24.verticalSpace,
                          _ReceiptRow(
                            label: 'Amount',
                            value: '₦$formattedAmount',
                          ),
                          18.verticalSpace,
                          _ReceiptRow(
                            label: 'Charges',
                            value: '₦$formattedFee',
                          ),
                          22.verticalSpace,
                          Divider(
                            color: PPaymobileColors.textfiedBorder,
                            thickness: 1.h,
                          ),
                          20.verticalSpace,
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
                                '₦$formattedTotal',
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
                    50.verticalSpace,
                  ],
                ),
              ),
              PPButton(
                text: 'Share Receipt',
                onPressed: () {},
                icon: SvgPicture.asset('assets/icon/share_white.svg'),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _ReceiptRow extends StatelessWidget {
  final String label;
  final String value;

  const _ReceiptRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
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
