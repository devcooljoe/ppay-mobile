import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account_entity.freezed.dart';

@freezed
class BankAccountEntity with _$BankAccountEntity {
  const factory BankAccountEntity({
    required String id,
    required String accountName,
    required String accountNumber,
    required String bankName,
    required String bankCode,
    required String bankLogo,
    required String date,
  }) = _BankAccountEntity;
}
