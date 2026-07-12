import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';

class TransactionModel {
  final String id;
  final String type;
  final String title;
  final String amount;
  final String fee;
  final String balanceBefore;
  final String balanceAfter;
  final String transactionId;
  final String? reference;
  final String status;
  final String date;
  final Map<String, dynamic>? cryptoPurchase;
  final Map<String, dynamic>? cryptoSale;
  final Map<String, dynamic>? cryptoDeposit;
  final Map<String, dynamic>? giftcardPurchase;
  final Map<String, dynamic>? giftcardSale;
  final Map<String, dynamic>? funding;
  final Map<String, dynamic>? withdrawal;
  final Map<String, dynamic>? billPayment;
  final Map<String, dynamic>? shopping;
  final Map<String, dynamic>? flightBooking;

  const TransactionModel({
    required this.id,
    required this.type,
    required this.title,
    required this.amount,
    required this.fee,
    required this.balanceBefore,
    required this.balanceAfter,
    required this.transactionId,
    this.reference,
    required this.status,
    required this.date,
    this.cryptoPurchase,
    this.cryptoSale,
    this.cryptoDeposit,
    this.giftcardPurchase,
    this.giftcardSale,
    this.funding,
    this.withdrawal,
    this.billPayment,
    this.shopping,
    this.flightBooking,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      amount: json['amount'] as String,
      fee: json['fee'] as String,
      balanceBefore: json['balanceBefore'] as String,
      balanceAfter: json['balanceAfter'] as String,
      transactionId: json['transactionId'] as String,
      reference: json['reference'] as String?,
      status: json['status'] as String,
      date: json['date'] as String,
      cryptoPurchase: json['cryptoPurchase'] as Map<String, dynamic>?,
      cryptoSale: json['cryptoSale'] as Map<String, dynamic>?,
      cryptoDeposit: json['cryptoDeposit'] as Map<String, dynamic>?,
      giftcardPurchase: json['giftcardPurchase'] as Map<String, dynamic>?,
      giftcardSale: json['giftcardSale'] as Map<String, dynamic>?,
      funding: json['funding'] as Map<String, dynamic>?,
      withdrawal: json['withdrawal'] as Map<String, dynamic>?,
      billPayment: json['billPayment'] as Map<String, dynamic>?,
      shopping: json['shopping'] as Map<String, dynamic>?,
      flightBooking: json['flightBooking'] as Map<String, dynamic>?,
    );
  }

  TransactionEntity toEntity() {
    final txType = TransactionTypeX.fromString(type);
    Map<String, dynamic>? details;

    switch (txType) {
      case TransactionType.cryptoPurchase:
        details = cryptoPurchase;
        break;
      case TransactionType.cryptoSale:
        details = cryptoSale;
        break;
      case TransactionType.cryptoDeposit:
        details = cryptoDeposit;
        break;
      case TransactionType.giftcardPurchase:
        details = giftcardPurchase;
        break;
      case TransactionType.giftcardSale:
        details = giftcardSale;
        break;
      case TransactionType.walletFunding:
      case TransactionType.cardFunding:
        details = funding;
        break;
      case TransactionType.walletWithdrawal:
      case TransactionType.cardWithdrawal:
        details = withdrawal;
        break;
      case TransactionType.billPayment:
        details = billPayment;
        break;
      case TransactionType.shopping:
        details = shopping;
        break;
      case TransactionType.flightBooking:
        details = flightBooking;
        break;
    }

    return TransactionEntity(
      id: id,
      type: txType,
      title: title,
      amount: amount,
      fee: fee,
      balanceBefore: balanceBefore,
      balanceAfter: balanceAfter,
      transactionId: transactionId,
      reference: reference,
      status: TransactionStatusX.fromString(status),
      date: DateTime.tryParse(date) ?? DateTime.now(),
      details: details,
    );
  }
}

class PaginatedTransactionsModel {
  final List<TransactionModel> transactions;
  final int total;
  final int pageNumber;
  final int pageSize;
  final int totalPages;

  const PaginatedTransactionsModel({
    required this.transactions,
    required this.total,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
  });

  factory PaginatedTransactionsModel.fromJson(Map<String, dynamic> json) {
    return PaginatedTransactionsModel(
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );
  }

  PaginatedTransactionsEntity toEntity() => PaginatedTransactionsEntity(
        transactions: transactions.map((t) => t.toEntity()).toList(),
        total: total,
        pageNumber: pageNumber,
        pageSize: pageSize,
        totalPages: totalPages,
      );
}
