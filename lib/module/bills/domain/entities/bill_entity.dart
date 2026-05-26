import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_entity.freezed.dart';

@freezed
class BillerEntity with _$BillerEntity {
  const factory BillerEntity({
    required String id,
    required String name,
    required String description,
    required String billerIconUrl,
    required String billTypeId,
    required List<BillItemEntity> billItems,
  }) = _BillerEntity;
}

@freezed
class BillItemEntity with _$BillItemEntity {
  const factory BillItemEntity({
    required String id,
    required String name,
    required String description,
    required String kudaIdentifier,
    required double amount,
    required bool isFixedPrice,
    required String billerId,
    required bool isActive,
  }) = _BillItemEntity;
}

@freezed
class CustomerVerificationEntity with _$CustomerVerificationEntity {
  const factory CustomerVerificationEntity({
    required String customerName,
  }) = _CustomerVerificationEntity;
}

@freezed
class BillPurchaseEntity with _$BillPurchaseEntity {
  const factory BillPurchaseEntity({
    required String reference,
    String? pin,
  }) = _BillPurchaseEntity;
}
