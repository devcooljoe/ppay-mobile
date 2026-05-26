import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_transaction_entity.dart';

part 'dollar_card_transaction_model.freezed.dart';
part 'dollar_card_transaction_model.g.dart';

@freezed
class DollarCardTransactionModel with _$DollarCardTransactionModel {
  const factory DollarCardTransactionModel({
    required String id,
    required double amount,
    required String currency,
    required String description,
    required String status,
    required String entry,
    required DollarCardMerchantModel merchant,
    required String createdAt,
  }) = _DollarCardTransactionModel;

  const DollarCardTransactionModel._();

  factory DollarCardTransactionModel.fromJson(Map<String, dynamic> json) => _$DollarCardTransactionModelFromJson(json);

  DollarCardTransactionEntity toEntity() => DollarCardTransactionEntity(
    id: id,
    amount: amount,
    currency: currency,
    description: description,
    status: status,
    entry: entry,
    merchant: merchant.toEntity(),
    createdAt: createdAt,
  );
}

@freezed
class DollarCardMerchantModel with _$DollarCardMerchantModel {
  const factory DollarCardMerchantModel({
    required String name,
    required String city,
    required String country,
  }) = _DollarCardMerchantModel;

  const DollarCardMerchantModel._();

  factory DollarCardMerchantModel.fromJson(Map<String, dynamic> json) => _$DollarCardMerchantModelFromJson(json);

  DollarCardMerchantEntity toEntity() => DollarCardMerchantEntity(
    name: name,
    city: city,
    country: country,
  );
}
