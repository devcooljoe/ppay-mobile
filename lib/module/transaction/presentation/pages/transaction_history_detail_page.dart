import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';
import 'package:ppay_mobile/module/transaction/presentation/helpers/transaction_detail_helper.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/full_screen_image_viewer.dart';
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
              // Nested sections for shopping transactions
              ..._buildShoppingSections(transaction),
              // Nested sections for flight booking transactions
              ..._buildFlightBookingSections(transaction),
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
      final badgeColor =
          isSale ? const Color(0xFFFF3336) : PPaymobileColors.buttonColor;
      final arrowIcon =
          isSale
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
    final widgets = <Widget>[];

    // Get detail items from helper
    final detailItems = TransactionDetailHelper.getDetailItems(tx);
    for (final item in detailItems) {
      widgets.add(
        _DetailRow(
          label: item.label,
          value: item.value,
          copyable: item.copyable,
          compact: item.compact,
          multiline: item.multiline,
        ),
      );
    }

    // Add gift card thumbnails for giftcard sale
    if (tx.type == TransactionType.giftcardSale) {
      final cardUrls = TransactionDetailHelper.getGiftCardUrls(tx);
      if (cardUrls.isNotEmpty) {
        widgets.add(_GiftCardThumbnails(imageUrls: cardUrls));
      }
    }

    return widgets;
  }

  List<Widget> _buildShoppingSections(TransactionEntity tx) {
    if (tx.type != TransactionType.shopping) return [];

    final widgets = <Widget>[];

    // Order items section
    final orderItems = TransactionDetailHelper.getShoppingItems(tx);
    if (orderItems.isNotEmpty) {
      widgets.add(16.verticalSpace);
      widgets.add(_SectionHeader(title: 'Order Items'));
      widgets.add(8.verticalSpace);
      for (final item in orderItems) {
        widgets.add(_OrderItemCard(item: item));
        widgets.add(8.verticalSpace);
      }
    }

    // Shipping and other sections
    final sections = TransactionDetailHelper.getShoppingSections(tx);
    for (final section in sections) {
      widgets.add(8.verticalSpace);
      widgets.add(_SectionHeader(title: section.title));
      widgets.add(8.verticalSpace);
      widgets.add(_NestedDetailCard(items: section.items));
    }

    return widgets;
  }

  List<Widget> _buildFlightBookingSections(TransactionEntity tx) {
    if (tx.type != TransactionType.flightBooking) return [];

    final sections = TransactionDetailHelper.getFlightBookingSections(tx);
    if (sections.isEmpty) return [];

    final widgets = <Widget>[];
    for (final section in sections) {
      widgets.add(16.verticalSpace);
      widgets.add(_SectionHeader(title: section.title));
      widgets.add(8.verticalSpace);
      widgets.add(_NestedDetailCard(items: section.items));
    }

    return widgets;
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
            onPressed:
                () => context.router.push(TrackOrderRoute(orderId: orderId)),
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
    if (status == TransactionStatus.failed) {
      return PPaymobileColors.redTextfield;
    }
    if (status == TransactionStatus.pending) {
      return PPaymobileColors.svgIconColor;
    }
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
      case TransactionStatus.failed:
        bg = const Color(0xFFFFE5E5);
        text = PPaymobileColors.redTextfield;
        label = 'Failed';
      case TransactionStatus.pending:
        bg = const Color(0xFFFFF3CD);
        text = const Color(0xFF856404);
        label = 'Pending';
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
  final bool multiline;

  const _DetailRow({
    required this.label,
    required this.value,
    this.copyable = false,
    this.compact = false,
    this.multiline = false,
  });

  @override
  Widget build(BuildContext context) {
    if (multiline) {
      return Padding(
        padding: EdgeInsets.only(bottom: 22.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                if (copyable)
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
            ),
            8.verticalSpace,
            Text(
              value,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

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

/// Section header widget for nested sections like "Flights", "Items", etc.
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'InstrumentSans',
        color: Colors.black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

/// Nested detail card for grouped information (e.g., shipping address, passenger info).
class _NestedDetailCard extends StatelessWidget {
  final List<DetailItem> items;
  const _NestedDetailCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: PPaymobileColors.mainScreenBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < items.length; i++) ...[
            _DetailRow(
              label: items[i].label,
              value: items[i].value,
              copyable: items[i].copyable,
              compact: items[i].compact,
              multiline: items[i].multiline,
            ),
          ],
        ],
      ),
    );
  }
}

/// Card widget for displaying an order item with product details.
class _OrderItemCard extends StatelessWidget {
  final OrderItemDetail item;
  const _OrderItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: PPaymobileColors.mainScreenBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.productName,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Qty',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'x${item.quantity}',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Unit Price',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '₦${AmountFormatter.formatBalance(item.unitPrice)}',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          if (item.variantAttributes != null &&
              item.variantAttributes!.isNotEmpty) ...[
            12.verticalSpace,
            Divider(height: 1, color: PPaymobileColors.deepBackgroundColor),
            12.verticalSpace,
            ...item.variantAttributes!.entries.map(
              (entry) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.svgIconColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      entry.value,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Displays a horizontal row of clickable gift card image thumbnails.
/// Tapping any thumbnail opens the full-screen image viewer.
class _GiftCardThumbnails extends StatelessWidget {
  final List<String> imageUrls;

  const _GiftCardThumbnails({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 22.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Images',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: PPaymobileColors.svgIconColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          12.verticalSpace,
          SizedBox(
            height: 80.w,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              separatorBuilder: (_, __) => 8.horizontalSpace,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap:
                      () => FullScreenImageViewer.show(
                        context,
                        imageUrls: imageUrls,
                        initialIndex: index,
                      ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: AppImage(
                      imageUrl: imageUrls[index],
                      width: 80.w,
                      height: 80.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
