import 'package:freezed_annotation/freezed_annotation.dart';

part 'dollar_card_entity.freezed.dart';

@freezed
class DollarCardEntity with _$DollarCardEntity {
  const factory DollarCardEntity({
    required String id,
    required String dbId,
    required String brand,
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
    required DollarCardAddressEntity address,
    required String createdAt,
    required String updatedAt,
    required double rate,
    @Default('teal') String color,
  }) = _DollarCardEntity;
}

@freezed
class DollarCardAddressEntity with _$DollarCardAddressEntity {
  const factory DollarCardAddressEntity({
    required String street,
    required String city,
    required String state,
    required String postalCode,
    required String country,
  }) = _DollarCardAddressEntity;
}
