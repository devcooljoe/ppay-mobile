import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart';

part 'bank_account_model.freezed.dart';
part 'bank_account_model.g.dart';

@freezed
class BankAccountModel with _$BankAccountModel {
  const factory BankAccountModel({
    required String id,
    required String accountName,
    required String accountNumber,
    required String bankName,
    required String bankCode,
    required String bankLogo,
    required String date,
  }) = _BankAccountModel;

  const BankAccountModel._();

  factory BankAccountModel.fromJson(Map<String, dynamic> json) => _$BankAccountModelFromJson(json);

  BankAccountEntity toEntity() => BankAccountEntity(
    id: id,
    accountName: accountName,
    accountNumber: accountNumber,
    bankName: bankName,
    bankCode: bankCode,
    bankLogo: bankLogo,
    date: date,
  );
}
