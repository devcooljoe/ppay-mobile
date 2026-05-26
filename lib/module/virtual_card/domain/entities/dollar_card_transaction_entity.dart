import 'package:freezed_annotation/freezed_annotation.dart';

part 'dollar_card_transaction_entity.freezed.dart';

@freezed
class DollarCardTransactionEntity with _$DollarCardTransactionEntity {
  const factory DollarCardTransactionEntity({
    required String id,
    required double amount,
    required String currency,
    required String description,
    required String status,
    required String entry,
    required DollarCardMerchantEntity merchant,
    required String createdAt,
  }) = _DollarCardTransactionEntity;
}

@freezed
class DollarCardMerchantEntity with _$DollarCardMerchantEntity {
  const factory DollarCardMerchantEntity({
    required String name,
    required String city,
    required String country,
  }) = _DollarCardMerchantEntity;
}
