import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';

part 'bill_model.freezed.dart';
part 'bill_model.g.dart';

@freezed
class BillerModel with _$BillerModel {
  const factory BillerModel({
    required String id,
    required String name,
    required String description,
    required String billerIconUrl,
    required String billTypeId,
    required List<BillItemModel> billItems,
  }) = _BillerModel;

  const BillerModel._();

  factory BillerModel.fromJson(Map<String, dynamic> json) => _$BillerModelFromJson(json);

  BillerEntity toEntity() => BillerEntity(
    id: id,
    name: name,
    description: description,
    billerIconUrl: billerIconUrl,
    billTypeId: billTypeId,
    billItems: billItems.map((e) => e.toEntity()).toList(),
  );
}

@freezed
class BillItemModel with _$BillItemModel {
  const factory BillItemModel({
    required String id,
    required String name,
    required String description,
    required String kudaIdentifier,
    required double amount,
    required bool isFixedPrice,
    required String billerId,
    required bool isActive,
  }) = _BillItemModel;

  const BillItemModel._();

  factory BillItemModel.fromJson(Map<String, dynamic> json) => _$BillItemModelFromJson(json);

  BillItemEntity toEntity() => BillItemEntity(
    id: id,
    name: name,
    description: description,
    kudaIdentifier: kudaIdentifier,
    amount: amount,
    isFixedPrice: isFixedPrice,
    billerId: billerId,
    isActive: isActive,
  );
}

@freezed
class CustomerVerificationModel with _$CustomerVerificationModel {
  const factory CustomerVerificationModel({
    required String customerName,
  }) = _CustomerVerificationModel;

  const CustomerVerificationModel._();

  factory CustomerVerificationModel.fromJson(Map<String, dynamic> json) => _$CustomerVerificationModelFromJson(json);

  CustomerVerificationEntity toEntity() => CustomerVerificationEntity(customerName: customerName);
}

@freezed
class BillPurchaseModel with _$BillPurchaseModel {
  const factory BillPurchaseModel({
    required String reference,
    String? pin,
  }) = _BillPurchaseModel;

  const BillPurchaseModel._();

  factory BillPurchaseModel.fromJson(Map<String, dynamic> json) => _$BillPurchaseModelFromJson(json);

  BillPurchaseEntity toEntity() => BillPurchaseEntity(reference: reference, pin: pin);
}
