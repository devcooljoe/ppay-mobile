import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

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
                    _buildHeaderIcon(transaction),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_StatusBadge(status: transaction.status)],
                    ),
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
                    _DetailRow(
                      label: 'Date',
                      value: _formatDate(transaction.date),
                    ),
                    _DetailRow(
                      label: 'Time',
                      value: _formatTime(transaction.date),
                    ),
                    _DetailRow(
                      label: 'Transaction ID',
                      value: transaction.transactionId,
                      copyable: true,
                      compact: true,
                    ),
                    _DetailRow(
                      label: 'Amount',
                      value:
                          '₦${AmountFormatter.formatBalance(transaction.amount)}',
                    ),
                    _DetailRow(
                      label: 'Fee',
                      value:
                          '₦${AmountFormatter.formatBalance(transaction.fee)}',
                    ),
                    ..._typeSpecificRows(transaction),
                    Divider(
                      height: 32.h,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
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
              // Type-specific action buttons
              ..._typeSpecificActions(context, transaction),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(TransactionEntity tx) {
    final isCrypto =
        tx.type == TransactionType.cryptoPurchase ||
        tx.type == TransactionType.cryptoSale ||
        tx.type == TransactionType.cryptoDeposit;

    final isGiftcard =
        tx.type == TransactionType.giftcardPurchase ||
        tx.type == TransactionType.giftcardSale;

    if (isCrypto) {
      final currency = (tx.details?['currency'] as String? ?? '').toUpperCase();
      final isSale = tx.type == TransactionType.cryptoSale;
      final badgeColor = isSale
          ? const Color(0xFFFF3336)
          : PPaymobileColors.buttonColor;
      final arrowIcon = isSale
          ? 'assets/icon/arrow_up_white.svg'
          : 'assets/icon/arrow_down_white.svg';

      return SizedBox(
        height: 55.w,
        width: 55.w,
        child: Stack(
          children: [
            Container(
              height: 55.w,
              width: 55.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF7931A),
              ),
              child: Center(
                child: Text(
                  currency.isNotEmpty ? currency[0] : 'C',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 20.h,
                width: 20.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: badgeColor,
                ),
                child: Center(
                  child: SvgPicture.asset(arrowIcon, width: 12.w, height: 12.w),
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (isGiftcard) {
      final cardType = (tx.details?['type'] as String? ?? tx.title);
      return CircleAvatar(
        radius: 27.5.r,
        backgroundColor: const Color(0xFF00A86B),
        child: Text(
          cardType.isNotEmpty ? cardType[0].toUpperCase() : 'G',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }

    return Container(
      height: 55.w,
      width: 55.w,
      decoration: BoxDecoration(
        color: _iconBg(tx.type),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          _iconPath(tx.type),
          width: 24.w,
          height: 24.w,
          fit: BoxFit.contain,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }

  List<Widget> _typeSpecificRows(TransactionEntity tx) {
    final d = tx.details;
    if (d == null) return [];

    switch (tx.type) {
      case TransactionType.walletFunding:
      case TransactionType.cardFunding:
      case TransactionType.cardTermination:
        return [
          if (d['fromAccountName'] != null)
            _DetailRow(label: 'From', value: d['fromAccountName'] as String),
          if (d['fromAccountNumber'] != null)
            _DetailRow(
              label: 'Account No',
              value: d['fromAccountNumber'] as String,
            ),
          if (d['fromBankName'] != null)
            _DetailRow(label: 'Bank', value: d['fromBankName'] as String),
        ];

      case TransactionType.walletWithdrawal:
      case TransactionType.cardWithdrawal:
        return [
          if (d['toAccountName'] != null)
            _DetailRow(label: 'To', value: d['toAccountName'] as String),
          if (d['toAccountNumber'] != null)
            _DetailRow(
              label: 'Account No',
              value: d['toAccountNumber'] as String,
            ),
          if (d['toBankName'] != null)
            _DetailRow(label: 'Bank', value: d['toBankName'] as String),
        ];

      case TransactionType.billPayment:
        return [
          if (d['billerName'] != null)
            _DetailRow(label: 'Biller', value: d['billerName'] as String),
          if (d['billerCategory'] != null)
            _DetailRow(label: 'Category', value: d['billerCategory'] as String),
          if (d['provider'] != null)
            _DetailRow(label: 'Provider', value: d['provider'] as String),
          if (d['phoneNumber'] != null)
            _DetailRow(label: 'Phone', value: d['phoneNumber'] as String),
          if (d['meterNumber'] != null)
            _DetailRow(label: 'Meter No', value: d['meterNumber'] as String),
          if (d['accountNumber'] != null)
            _DetailRow(
              label: 'Account No',
              value: d['accountNumber'] as String,
            ),
          if (d['plan'] != null)
            _DetailRow(label: 'Plan', value: d['plan'] as String),
        ];

      case TransactionType.cryptoPurchase:
      case TransactionType.cryptoSale:
      case TransactionType.cryptoDeposit:
        final currency = (d['currency'] as String? ?? '').toUpperCase();
        final cryptoAmount = d['amountInCrypto']?.toString();
        final rate = d['ratePerDollar']?.toString();
        return [
          if (currency.isNotEmpty)
            _DetailRow(label: 'Currency', value: currency),
          if (cryptoAmount != null)
            _DetailRow(
              label: 'Crypto Amount',
              value: '$cryptoAmount $currency',
            ),
          if (rate != null)
            _DetailRow(
              label: 'Rate/Dollar',
              value: '₦${AmountFormatter.formatBalance(rate)}',
            ),
        ];

      case TransactionType.giftcardPurchase:
        return [
          if (d['type'] != null)
            _DetailRow(label: 'Card Type', value: d['type'] as String),
          if (d['region'] != null)
            _DetailRow(label: 'Region', value: d['region'] as String),
          if (d['currency'] != null)
            _DetailRow(
              label: 'Currency',
              value: (d['currency'] as String).toUpperCase(),
            ),
          if (d['amountInUsd'] != null)
            _DetailRow(label: 'Amount (USD)', value: '\$${d['amountInUsd']}'),
          if (d['rate'] != null)
            _DetailRow(
              label: 'Rate',
              value: '₦${AmountFormatter.formatBalance(d['rate'].toString())}',
            ),
          if (d['giftCardCode'] != null &&
              (d['giftCardCode'] as String).isNotEmpty)
            _DetailRow(
              label: 'Gift Card Code',
              value: d['giftCardCode'] as String,
              copyable: true,
            ),
          if (d['instructions'] != null &&
              (d['instructions'] as String).isNotEmpty)
            _DetailRow(
              label: 'Instructions',
              value: d['instructions'] as String,
            ),
        ];

      case TransactionType.giftcardSale:
        return [
          if (d['type'] != null)
            _DetailRow(label: 'Card Type', value: d['type'] as String),
          if (d['subcategoryName'] != null)
            _DetailRow(
              label: 'Subcategory',
              value: d['subcategoryName'] as String,
            ),
          if (d['country'] != null)
            _DetailRow(label: 'Country', value: d['country'] as String),
          if (d['ratePerDollar'] != null)
            _DetailRow(
              label: 'Rate/Dollar',
              value:
                  '₦${AmountFormatter.formatBalance(d['ratePerDollar'].toString())}',
            ),
          if (d['minAmount'] != null && d['maxAmount'] != null)
            _DetailRow(
              label: 'Amount Range',
              value: '\$${d['minAmount']} – \$${d['maxAmount']}',
            ),
          if (d['rejectionReason'] != null &&
              (d['rejectionReason'] as String).isNotEmpty)
            _DetailRow(
              label: 'Rejection Reason',
              value: d['rejectionReason'] as String,
            ),
        ];

      case TransactionType.shopping:
        final items = d['items'] as List<dynamic>?;
        final shipping = d['shippingAddress'] as Map<String, dynamic>?;
        return [
          if (d['orderNumber'] != null)
            _DetailRow(
              label: 'Order No',
              value: '#${d['orderNumber']}',
              copyable: true,
            ),
          if (d['status'] != null)
            _DetailRow(label: 'Order Status', value: d['status'] as String),
          if (items != null && items.isNotEmpty)
            _DetailRow(
              label: 'Items',
              value: '${items.length} item${items.length > 1 ? 's' : ''}',
            ),
          if (d['subtotal'] != null)
            _DetailRow(
              label: 'Subtotal',
              value:
                  '₦${AmountFormatter.formatBalance(d['subtotal'].toString())}',
            ),
          if (d['deliveryFee'] != null)
            _DetailRow(
              label: 'Delivery Fee',
              value:
                  '₦${AmountFormatter.formatBalance(d['deliveryFee'].toString())}',
            ),
          if (shipping != null && shipping['receiverName'] != null)
            _DetailRow(
              label: 'Recipient',
              value: shipping['receiverName'] as String,
            ),
          if (shipping != null && shipping['address'] != null)
            _DetailRow(label: 'Address', value: shipping['address'] as String),
        ];

      case TransactionType.flightBooking:
        final flights = d['flights'] as List<dynamic>?;
        final passengers = d['passengers'] as List<dynamic>?;
        return [
          if (d['bookingReference'] != null)
            _DetailRow(
              label: 'Booking Ref',
              value: d['bookingReference'] as String,
              copyable: true,
            ),
          if (d['tripType'] != null)
            _DetailRow(label: 'Trip Type', value: d['tripType'] as String),
          if (d['status'] != null)
            _DetailRow(label: 'Booking Status', value: d['status'] as String),
          if (d['currency'] != null)
            _DetailRow(
              label: 'Currency',
              value: (d['currency'] as String).toUpperCase(),
            ),
          if (flights != null && flights.isNotEmpty) ...[
            for (final f in flights.cast<Map<String, dynamic>>())
              if (f['origin'] != null && f['destination'] != null)
                _DetailRow(
                  label: f['direction'] ?? 'Flight',
                  value: '${f['origin']} → ${f['destination']}',
                ),
          ],
          if (passengers != null && passengers.isNotEmpty)
            _DetailRow(
              label: 'Passengers',
              value:
                  '${passengers.length} passenger${passengers.length > 1 ? 's' : ''}',
            ),
        ];
    }
  }

  List<Widget> _typeSpecificActions(
    BuildContext context,
    TransactionEntity tx,
  ) {
    switch (tx.type) {
      case TransactionType.cryptoPurchase:
      case TransactionType.cryptoSale:
      case TransactionType.cryptoDeposit:
        return [
          16.verticalSpace,
          PPButton(
            text: 'Go to Crypto',
            onPressed: () => context.router.push(const CryptoRoute()),
            icon: SizedBox(
              height: 20.w,
              width: 20.w,
              child: SvgPicture.asset(
                'assets/icon/crypto.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ];

      case TransactionType.giftcardPurchase:
      case TransactionType.giftcardSale:
        return [
          16.verticalSpace,
          PPButton(
            text: 'Go to Gift Cards',
            onPressed: () => context.router.push(const GiftcardRoute()),
            icon: SizedBox(
              height: 20.w,
              width: 20.w,
              child: SvgPicture.asset(
                'assets/icon/gift.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ];

      case TransactionType.shopping:
        final orderId = tx.details?['orderId'] as String?;
        if (orderId == null) return [];
        return [
          16.verticalSpace,
          PPButton(
            text: 'Track Order',
            onPressed: () =>
                context.router.push(TrackOrderRoute(orderId: orderId)),
            icon: SizedBox(
              height: 20.w,
              width: 20.w,
              child: SvgPicture.asset(
                'assets/icon/bill.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ];

      case TransactionType.flightBooking:
        return [
          16.verticalSpace,
          PPButton(
            text: 'View Booking',
            onPressed: () => context.router.push(const BookedFlightsRoute()),
            icon: SizedBox(
              height: 20.w,
              width: 20.w,
              child: SvgPicture.asset(
                'assets/icon/bill.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ];

      default:
        return [];
    }
  }

  String _total(TransactionEntity tx) {
    final amount = double.tryParse(tx.amount) ?? 0;
    final fee = double.tryParse(tx.fee) ?? 0;
    return (amount + fee).toStringAsFixed(2);
  }

  String _formatDate(DateTime date) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
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
    if (status == TransactionStatus.failed)
      return PPaymobileColors.redTextfield;
    if (status == TransactionStatus.pending)
      return PPaymobileColors.svgIconColor;
    return isCredit
        ? PPaymobileColors.buttonColor
        : PPaymobileColors.redTextfield;
  }

  Color _iconBg(TransactionType type) {
    switch (type) {
      case TransactionType.walletFunding:
      case TransactionType.cardFunding:
      case TransactionType.cardTermination:
        return PPaymobileColors.backgroundColor;
      case TransactionType.walletWithdrawal:
      case TransactionType.cardWithdrawal:
        return PPaymobileColors.transactRed;
      case TransactionType.billPayment:
        return const Color(0xFF6B4EFF);
      case TransactionType.shopping:
        return const Color(0xFF0066CC);
      case TransactionType.flightBooking:
        return const Color(0xFF1A1A2E);
      default:
        return PPaymobileColors.backgroundColor;
    }
  }

  String _iconPath(TransactionType type) {
    switch (type) {
      case TransactionType.walletFunding:
      case TransactionType.cardFunding:
      case TransactionType.cardTermination:
      case TransactionType.walletWithdrawal:
      case TransactionType.cardWithdrawal:
        return 'assets/icon/money.svg';
      case TransactionType.billPayment:
      case TransactionType.shopping:
      case TransactionType.flightBooking:
        return 'assets/icon/bill.svg';
      default:
        return 'assets/icon/money.svg';
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
    return Container(
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
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool copyable;
  final bool compact;
  const _DetailRow({
    required this.label,
    required this.value,
    this.copyable = false,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 22.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: compact ? 120.w : 180.w),
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
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
                TouchOpacity(
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
