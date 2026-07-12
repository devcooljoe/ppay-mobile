import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';

part 'dollar_card_model.freezed.dart';
part 'dollar_card_model.g.dart';

@freezed
class DollarCardModel with _$DollarCardModel {
  const factory DollarCardModel({
    required String id,
    required String name,
    required String cardNumber,
    required String maskedPan,
    required String expiry,
    required String cvv,
    required String status,
    required String type,
    required String issuer,
    required String currency,
    required double balance,
    required DollarCardAddressModel address,
    required String createdAt,
    required String updatedAt,
    required double rate,
  }) = _DollarCardModel;

  const DollarCardModel._();

  factory DollarCardModel.fromJson(Map<String, dynamic> json) => _$DollarCardModelFromJson(json);

  DollarCardEntity toEntity() => DollarCardEntity(
    id: id,
    name: name,
    cardNumber: cardNumber,
    maskedPan: maskedPan,
    expiry: expiry,
    cvv: cvv,
    status: status,
    type: type,
    issuer: issuer,
    currency: currency,
    balance: balance,
    address: address.toEntity(),
    createdAt: createdAt,
    updatedAt: updatedAt,
    rate: rate,
  );
}

@freezed
class DollarCardAddressModel with _$DollarCardAddressModel {
  const factory DollarCardAddressModel({
    required String street,
    required String city,
    required String state,
    required String postalCode,
    required String country,
  }) = _DollarCardAddressModel;

  const DollarCardAddressModel._();

  factory DollarCardAddressModel.fromJson(Map<String, dynamic> json) => _$DollarCardAddressModelFromJson(json);

  DollarCardAddressEntity toEntity() => DollarCardAddressEntity(
    street: street,
    city: city,
    state: state,
    postalCode: postalCode,
    country: country,
  );
}
