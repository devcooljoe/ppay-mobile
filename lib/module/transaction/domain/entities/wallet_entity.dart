import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_entity.freezed.dart';

@freezed
class WalletEntity with _$WalletEntity {
  const factory WalletEntity({
    required String id,
    required String balance,
    required String accountNumber,
    required String accountName,
    required String bankName,
  }) = _WalletEntity;
}
