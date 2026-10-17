import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';
import 'package:ppay_mobile/shared/extensions/string_extensions.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';

/// Represents a single detail item to be displayed in the transaction detail page.
class DetailItem {
  final String label;
  final String value;
  final bool copyable;
  final bool compact;
  final bool multiline;

  const DetailItem({
    required this.label,
    required this.value,
    this.copyable = false,
    this.compact = false,
    this.multiline = false,
  });
}

/// Represents a section of nested detail items (e.g., items, flights, passengers).
class DetailSection {
  final String title;
  final List<DetailItem> items;

  const DetailSection({required this.title, required this.items});
}

/// Helper class that extracts display-ready detail items from a transaction.
class TransactionDetailHelper {
  /// Returns the list of detail items for the given transaction type.
  /// Only returns items where the value is non-null and non-empty.
  static List<DetailItem> getDetailItems(TransactionEntity transaction) {
    final d = transaction.details;
    if (d == null) return [];

    switch (transaction.type) {
      case TransactionType.walletFunding:
      case TransactionType.cardFunding:
      case TransactionType.cardTermination:
        return _buildFundingDetails(d);

      case TransactionType.walletWithdrawal:
      case TransactionType.cardWithdrawal:
        return _buildWithdrawalDetails(d);

      case TransactionType.billPayment:
        return _buildBillPaymentDetails(d);

      case TransactionType.cryptoPurchase:
      case TransactionType.cryptoSale:
      case TransactionType.cryptoDeposit:
        return _buildCryptoDetails(d);

      case TransactionType.giftcardPurchase:
        return _buildGiftcardPurchaseDetails(d);

      case TransactionType.giftcardSale:
        return _buildGiftcardSaleDetails(d);

      case TransactionType.shopping:
        return _buildShoppingDetails(d);

      case TransactionType.flightBooking:
        return _buildFlightBookingDetails(d);
    }
  }

  /// Returns the nested sections for shopping transactions (items, shipping address).
  static List<DetailSection> getShoppingSections(
    TransactionEntity transaction,
  ) {
    final d = transaction.details;
    if (d == null || transaction.type != TransactionType.shopping) return [];

    final sections = <DetailSection>[];

    // Shipping Address section
    final shipping = d['shippingAddress'] as Map<String, dynamic>?;
    if (shipping != null) {
      final shippingItems = <DetailItem>[];
      _addIfNotEmpty(shippingItems, 'Recipient', shipping['receiverName']);
      _addIfNotEmpty(shippingItems, 'Phone', shipping['phoneNumber']);
      _addIfNotEmpty(
        shippingItems,
        'Address',
        shipping['address'],
        multiline: true,
      );
      _addIfNotEmpty(shippingItems, 'State', shipping['state']);
      _addIfNotEmpty(shippingItems, 'Country', shipping['country']);
      _addIfNotEmpty(shippingItems, 'Note', shipping['note'], multiline: true);

      if (shippingItems.isNotEmpty) {
        sections.add(
          DetailSection(title: 'Shipping Address', items: shippingItems),
        );
      }
    }

    return sections;
  }

  /// Returns the list of order items for shopping transactions.
  static List<OrderItemDetail> getShoppingItems(TransactionEntity transaction) {
    final d = transaction.details;
    if (d == null || transaction.type != TransactionType.shopping) return [];

    final items = d['items'] as List<dynamic>?;
    if (items == null || items.isEmpty) return [];

    return items
        .cast<Map<String, dynamic>>()
        .map((item) {
          return OrderItemDetail(
            productName: item['productName'] as String? ?? '',
            quantity: (item['quantity'] as num?)?.toInt() ?? 1,
            unitPrice: item['unitPrice']?.toString() ?? '0',
            variantAttributes:
                (item['variantAttributes'] as Map<String, dynamic>?)?.map(
                  (k, v) =>
                      MapEntry(k.toString().toHumanReadable(), v.toString()),
                ),
          );
        })
        .where((item) => item.productName.isNotNullOrEmpty)
        .toList();
  }

  /// Returns the nested sections for flight booking transactions (flights, passengers).
  static List<DetailSection> getFlightBookingSections(
    TransactionEntity transaction,
  ) {
    final d = transaction.details;
    if (d == null || transaction.type != TransactionType.flightBooking) {
      return [];
    }

    final sections = <DetailSection>[];

    // Flights section
    final flights = d['flights'] as List<dynamic>?;
    if (flights != null && flights.isNotEmpty) {
      for (var i = 0; i < flights.length; i++) {
        final f = flights[i] as Map<String, dynamic>;
        final flightItems = <DetailItem>[];

        final direction = f['direction'] as String?;
        final directionLabel =
            direction.isNotNullOrEmpty
                ? direction!.toTitleCase()
                : 'Flight ${i + 1}';

        _addIfNotEmpty(
          flightItems,
          'Airline',
          f['airlineName'] ?? f['airline'],
        );
        _addIfNotEmpty(flightItems, 'Flight No', f['flightNumber']);

        final origin = f['origin'] as String?;
        final destination = f['destination'] as String?;
        if (origin.isNotNullOrEmpty && destination.isNotNullOrEmpty) {
          flightItems.add(
            DetailItem(label: 'Route', value: '$origin → $destination'),
          );
        }

        if (f['departureTime'] != null) {
          final depTime = _parseDateTime(f['departureTime']);
          if (depTime != null) {
            flightItems.add(
              DetailItem(label: 'Departure', value: _formatDateTime(depTime)),
            );
          }
        }

        if (f['arrivalTime'] != null) {
          final arrTime = _parseDateTime(f['arrivalTime']);
          if (arrTime != null) {
            flightItems.add(
              DetailItem(label: 'Arrival', value: _formatDateTime(arrTime)),
            );
          }
        }

        _addIfNotEmpty(flightItems, 'Cabin', _toTitleCase(f['cabinClass']));

        if (f['duration'] != null) {
          final duration = (f['duration'] as num?)?.toInt();
          if (duration != null && duration > 0) {
            final hours = duration ~/ 60;
            final minutes = duration % 60;
            final durationStr =
                hours > 0 ? '${hours}h ${minutes}m' : '${minutes}m';
            flightItems.add(DetailItem(label: 'Duration', value: durationStr));
          }
        }

        if (flightItems.isNotEmpty) {
          sections.add(
            DetailSection(title: directionLabel, items: flightItems),
          );
        }
      }
    }

    // Passengers section
    final passengers = d['passengers'] as List<dynamic>?;
    if (passengers != null && passengers.isNotEmpty) {
      for (var i = 0; i < passengers.length; i++) {
        final p = passengers[i] as Map<String, dynamic>;
        final passengerItems = <DetailItem>[];

        final firstName = p['firstName'] as String? ?? '';
        final lastName = p['lastName'] as String? ?? '';
        final fullName = '$firstName $lastName'.trim();
        if (fullName.isNotNullOrEmpty) {
          passengerItems.add(DetailItem(label: 'Name', value: fullName));
        }

        _addIfNotEmpty(passengerItems, 'Gender', _toTitleCase(p['gender']));

        if (p['dateOfBirth'] != null) {
          final dob = _parseDateTime(p['dateOfBirth']);
          if (dob != null) {
            passengerItems.add(
              DetailItem(label: 'Date of Birth', value: _formatDate(dob)),
            );
          }
        }

        _addIfNotEmpty(passengerItems, 'Nationality', p['nationality']);
        _addIfNotEmpty(passengerItems, 'Phone', p['phoneNumber']);
        _addIfNotEmpty(passengerItems, 'Email', p['email']);
        _addIfNotEmpty(passengerItems, 'Passport No', p['passportNumber']);

        if (passengerItems.isNotEmpty) {
          sections.add(
            DetailSection(
              title: passengers.length > 1 ? 'Passenger ${i + 1}' : 'Passenger',
              items: passengerItems,
            ),
          );
        }
      }
    }

    return sections;
  }

  /// Returns the gift card image URLs for giftcard sale transactions.
  static List<String> getGiftCardUrls(TransactionEntity transaction) {
    if (transaction.type != TransactionType.giftcardSale) return [];
    final d = transaction.details;
    if (d == null) return [];
    final urls = d['cardUrls'] as List<dynamic>?;
    if (urls == null || urls.isEmpty) return [];
    return urls.cast<String>().where((url) => url.isNotNullOrEmpty).toList();
  }

  // ─────────────────────────────────────────────────────────────
  // Private helper methods for building detail items
  // ─────────────────────────────────────────────────────────────

  static List<DetailItem> _buildFundingDetails(Map<String, dynamic> d) {
    final items = <DetailItem>[];
    _addIfNotEmpty(items, 'From', d['fromAccountName']);
    _addIfNotEmpty(items, 'Account No', d['fromAccountNumber']);
    _addIfNotEmpty(items, 'Bank', d['fromBankName']);
    return items;
  }

  static List<DetailItem> _buildWithdrawalDetails(Map<String, dynamic> d) {
    final items = <DetailItem>[];
    _addIfNotEmpty(items, 'To', d['toAccountName']);
    _addIfNotEmpty(items, 'Account No', d['toAccountNumber']);
    _addIfNotEmpty(items, 'Bank', d['toBankName']);
    return items;
  }

  static List<DetailItem> _buildBillPaymentDetails(Map<String, dynamic> d) {
    final items = <DetailItem>[];
    _addIfNotEmpty(items, 'Biller', d['billerName']);
    _addIfNotEmpty(items, 'Category', d['billerCategory']);
    _addIfNotEmpty(items, 'Provider', d['provider']);
    _addIfNotEmpty(items, 'Phone Number', d['phoneNumber']);
    _addIfNotEmpty(items, 'Meter No', d['meterNumber']);
    _addIfNotEmpty(items, 'Account No', d['accountNumber']);
    _addIfNotEmpty(items, 'Plan', d['plan']);
    return items;
  }

  static List<DetailItem> _buildCryptoDetails(Map<String, dynamic> d) {
    final items = <DetailItem>[];
    final currency = (d['currency'] as String?)?.toUpperCase() ?? '';

    if (currency.isNotEmpty) {
      items.add(DetailItem(label: 'Currency', value: currency));
    }

    final cryptoAmount = d['amountInCrypto']?.toString();
    if (cryptoAmount.isNotNullOrEmpty) {
      items.add(
        DetailItem(label: 'Crypto Amount', value: '$cryptoAmount $currency'),
      );
    }

    final rate = d['ratePerDollar']?.toString();
    if (rate.isNotNullOrEmpty) {
      items.add(
        DetailItem(
          label: 'Rate/Dollar',
          value: '₦${AmountFormatter.formatBalance(rate!)}',
        ),
      );
    }

    return items;
  }

  static List<DetailItem> _buildGiftcardPurchaseDetails(
    Map<String, dynamic> d,
  ) {
    final items = <DetailItem>[];
    _addIfNotEmpty(items, 'Card Type', d['type']);
    _addIfNotEmpty(items, 'Region', d['region']);

    final currency = d['currency'] as String?;
    if (currency.isNotNullOrEmpty) {
      items.add(DetailItem(label: 'Currency', value: currency!.toUpperCase()));
    }

    final amountUsd = d['amountInUsd']?.toString();
    if (amountUsd.isNotNullOrEmpty) {
      items.add(DetailItem(label: 'Amount (USD)', value: '\$$amountUsd'));
    }

    final rate = d['rate']?.toString();
    if (rate.isNotNullOrEmpty) {
      items.add(
        DetailItem(
          label: 'Rate',
          value: '₦${AmountFormatter.formatBalance(rate!)}',
        ),
      );
    }

    final giftCardCode = d['giftCardCode'] as String?;
    if (giftCardCode.isNotNullOrEmpty) {
      items.add(
        DetailItem(
          label: 'Gift Card Code',
          value: giftCardCode!,
          copyable: true,
        ),
      );
    }

    final instructions = d['instructions'] as String?;
    if (instructions.isNotNullOrEmpty) {
      items.add(
        DetailItem(
          label: 'Instructions',
          value: instructions!,
          multiline: true,
        ),
      );
    }

    return items;
  }

  static List<DetailItem> _buildGiftcardSaleDetails(Map<String, dynamic> d) {
    final items = <DetailItem>[];

    // Determine card format
    final ecode = d['ecode'] as String?;
    final cardUrls = d['cardUrls'] as List<dynamic>?;
    final hasEcode = ecode.isNotNullOrEmpty;
    final hasCardUrls = cardUrls != null && cardUrls.isNotEmpty;

    String cardFormat = 'Gift Card';
    if (hasEcode) {
      cardFormat = 'eCode';
    } else if (hasCardUrls) {
      cardFormat = 'Physical';
    }

    _addIfNotEmpty(items, 'Card Type', d['type']);
    items.add(DetailItem(label: 'Card Format', value: cardFormat));
    _addIfNotEmpty(items, 'Subcategory', d['subcategoryName']);
    _addIfNotEmpty(items, 'Country', d['country']);

    final ratePerDollar = d['ratePerDollar']?.toString();
    if (ratePerDollar.isNotNullOrEmpty) {
      items.add(
        DetailItem(
          label: 'Rate/Dollar',
          value: '₦${AmountFormatter.formatBalance(ratePerDollar!)}',
        ),
      );
    }

    final minAmount = d['minAmount']?.toString();
    final maxAmount = d['maxAmount']?.toString();
    if (minAmount.isNotNullOrEmpty && maxAmount.isNotNullOrEmpty) {
      items.add(
        DetailItem(label: 'Amount Range', value: '\$$minAmount – \$$maxAmount'),
      );
    }

    if (hasEcode) {
      items.add(DetailItem(label: 'E-Code', value: ecode!, copyable: true));
    }

    final rejectionReason = d['rejectionReason'] as String?;
    if (rejectionReason.isNotNullOrEmpty) {
      items.add(
        DetailItem(
          label: 'Rejection Reason',
          value: rejectionReason!,
          multiline: true,
        ),
      );
    }

    // Note: card images are handled separately via getGiftCardUrls()

    return items;
  }

  static List<DetailItem> _buildShoppingDetails(Map<String, dynamic> d) {
    final items = <DetailItem>[];

    final orderNumber = d['orderNumber']?.toString();
    if (orderNumber.isNotNullOrEmpty) {
      items.add(
        DetailItem(label: 'Order No', value: '#$orderNumber', copyable: true),
      );
    }

    _addIfNotEmpty(items, 'Order Status', _toTitleCase(d['status']));

    final orderItems = d['items'] as List<dynamic>?;
    if (orderItems != null && orderItems.isNotEmpty) {
      final count = orderItems.length;
      items.add(
        DetailItem(label: 'Items', value: '$count item${count > 1 ? 's' : ''}'),
      );
    }

    final subtotal = d['subtotal']?.toString();
    if (subtotal.isNotNullOrEmpty) {
      items.add(
        DetailItem(
          label: 'Subtotal',
          value: '₦${AmountFormatter.formatBalance(subtotal!)}',
        ),
      );
    }

    final deliveryFee = d['deliveryFee']?.toString();
    if (deliveryFee.isNotNullOrEmpty) {
      items.add(
        DetailItem(
          label: 'Delivery Fee',
          value: '₦${AmountFormatter.formatBalance(deliveryFee!)}',
        ),
      );
    }

    final discount = d['discount']?.toString();
    final discountValue = double.tryParse(discount ?? '0') ?? 0;
    if (discountValue > 0) {
      items.add(
        DetailItem(
          label: 'Discount',
          value: '-₦${AmountFormatter.formatBalance(discount!)}',
        ),
      );
    }

    return items;
  }

  static List<DetailItem> _buildFlightBookingDetails(Map<String, dynamic> d) {
    final items = <DetailItem>[];

    final bookingRef = d['bookingReference'] as String?;
    if (bookingRef.isNotNullOrEmpty) {
      items.add(
        DetailItem(label: 'Booking Ref', value: bookingRef!, copyable: true),
      );
    }

    _addIfNotEmpty(items, 'Trip Type', _toTitleCase(d['tripType']));
    _addIfNotEmpty(items, 'Booking Status', _toTitleCase(d['status']));

    final currency = d['currency'] as String?;
    if (currency.isNotNullOrEmpty) {
      items.add(DetailItem(label: 'Currency', value: currency!.toUpperCase()));
    }

    final totalAmount = d['totalAmount']?.toString();
    if (totalAmount.isNotNullOrEmpty && currency.isNotNullOrEmpty) {
      items.add(
        DetailItem(
          label: 'Total Amount',
          value:
              '${currency!.toUpperCase()} ${AmountFormatter.formatBalance(totalAmount!)}',
        ),
      );
    }

    final passengers = d['passengers'] as List<dynamic>?;
    if (passengers != null && passengers.isNotEmpty) {
      final count = passengers.length;
      items.add(
        DetailItem(
          label: 'Passengers',
          value: '$count passenger${count > 1 ? 's' : ''}',
        ),
      );
    }

    return items;
  }

  // ─────────────────────────────────────────────────────────────
  // Utility methods
  // ─────────────────────────────────────────────────────────────

  static void _addIfNotEmpty(
    List<DetailItem> items,
    String label,
    dynamic value, {
    bool copyable = false,
    bool compact = false,
    bool multiline = false,
  }) {
    final stringValue = value?.toString();
    if (stringValue.isNotNullOrEmpty) {
      items.add(
        DetailItem(
          label: label,
          value: stringValue!,
          copyable: copyable,
          compact: compact,
          multiline: multiline,
        ),
      );
    }
  }

  static String? _toTitleCase(dynamic value) {
    final str = value?.toString();
    if (!str.isNotNullOrEmpty) return null;
    return str!.toTitleCase();
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  static String _formatDateTime(DateTime dt) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour < 12 ? 'AM' : 'PM';
    return '${dt.day} ${months[dt.month]} ${dt.year}, $hour:$minute $period';
  }

  static String _formatDate(DateTime dt) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${dt.day} ${months[dt.month]} ${dt.year}';
  }
}

/// Represents an order item for shopping transactions.
class OrderItemDetail {
  final String productName;
  final int quantity;
  final String unitPrice;
  final Map<String, String>? variantAttributes;

  const OrderItemDetail({
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    this.variantAttributes,
  });
}
