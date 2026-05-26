import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/wallet_entity.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel {
  const factory WalletModel({
    required String id,
    required String balance,
    required String accountNumber,
    required String accountName,
    required String bankName,
  }) = _WalletModel;

  const WalletModel._();

  factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);

  WalletEntity toEntity() => WalletEntity(
    id: id,
    balance: balance,
    accountNumber: accountNumber,
    accountName: accountName,
    bankName: bankName,
  );
}
