enum TransactionType {
  cryptoPurchase,
  cryptoSale,
  cryptoDeposit,
  giftcardPurchase,
  giftcardSale,
  walletFunding,
  walletWithdrawal,
  cardFunding,
  cardWithdrawal,
  billPayment,
  shopping,
  flightBooking,
}

extension TransactionTypeX on TransactionType {
  static TransactionType fromString(String value) {
    switch (value) {
      case 'crypto_purchase': return TransactionType.cryptoPurchase;
      case 'crypto_sale': return TransactionType.cryptoSale;
      case 'crypto_deposit': return TransactionType.cryptoDeposit;
      case 'giftcard_purchase': return TransactionType.giftcardPurchase;
      case 'giftcard_sale': return TransactionType.giftcardSale;
      case 'wallet_funding': return TransactionType.walletFunding;
      case 'wallet_withdrawal': return TransactionType.walletWithdrawal;
      case 'card_funding': return TransactionType.cardFunding;
      case 'card_withdrawal': return TransactionType.cardWithdrawal;
      case 'bill_payment': return TransactionType.billPayment;
      case 'shopping': return TransactionType.shopping;
      case 'flight_booking': return TransactionType.flightBooking;
      default: return TransactionType.walletFunding;
    }
  }

  bool get isCredit {
    return this == TransactionType.walletFunding ||
        this == TransactionType.cardFunding ||
        this == TransactionType.cryptoDeposit;
  }
}

enum TransactionStatus { pending, successful, failed }

extension TransactionStatusX on TransactionStatus {
  static TransactionStatus fromString(String value) {
    switch (value) {
      case 'successful': return TransactionStatus.successful;
      case 'failed': return TransactionStatus.failed;
      default: return TransactionStatus.pending;
    }
  }
}

class TransactionEntity {
  final String id;
  final TransactionType type;
  final String title;
  final String amount;
  final String fee;
  final String balanceBefore;
  final String balanceAfter;
  final String transactionId;
  final String? reference;
  final TransactionStatus status;
  final DateTime date;

  // Type-specific details
  final Map<String, dynamic>? details;

  const TransactionEntity({
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
    this.details,
  });
}

class PaginatedTransactionsEntity {
  final List<TransactionEntity> transactions;
  final int total;
  final int pageNumber;
  final int pageSize;
  final int totalPages;

  const PaginatedTransactionsEntity({
    required this.transactions,
    required this.total,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
  });
}
