import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_entity.freezed.dart';

@freezed
class BankEntity with _$BankEntity {
  const factory BankEntity({
    required String bankName,
    required String bankCode,
    required String bankAvailability,
    required String bankStatus,
    required String bankLogo,
  }) = _BankEntity;
}
