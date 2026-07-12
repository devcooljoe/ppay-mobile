import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';

part 'bill_model.freezed.dart';
part 'bill_model.g.dart';

@freezed
class BillerModel with _$BillerModel {
  const factory BillerModel({
    String? id,
    String? name,
    String? description,
    String? billerIconUrl,
    String? billTypeId,
    List<BillItemModel>? billItems,
  }) = _BillerModel;

  const BillerModel._();

  factory BillerModel.fromJson(Map<String, dynamic> json) =>
      _$BillerModelFromJson(json);

  BillerEntity toEntity() => BillerEntity(
        id: id ?? '',
        name: name ?? '',
        description: description ?? '',
        billerIconUrl: billerIconUrl ?? '',
        billTypeId: billTypeId ?? '',
        billItems:
            (billItems ?? []).map((e) => e.toEntity()).toList(),
      );
}

@freezed
class BillItemModel with _$BillItemModel {
  const factory BillItemModel({
    String? id,
    String? name,
    String? description,
    String? kudaIdentifier,
    double? amount,
    bool? isFixedPrice,
    String? billerId,
    bool? isActive,
    String? vendingAggregator,
  }) = _BillItemModel;

  const BillItemModel._();

  factory BillItemModel.fromJson(Map<String, dynamic> json) =>
      _$BillItemModelFromJson(json);

  BillItemEntity toEntity() => BillItemEntity(
        id: id ?? '',
        name: name ?? '',
        description: description ?? '',
        kudaIdentifier: kudaIdentifier ?? '',
        amount: ((amount ?? 0.0) / 100),
        isFixedPrice: isFixedPrice ?? false,
        billerId: billerId ?? '',
        isActive: isActive ?? false,
      );
}

@freezed
class CustomerVerificationModel with _$CustomerVerificationModel {
  const factory CustomerVerificationModel({
    String? customerName,
  }) = _CustomerVerificationModel;

  const CustomerVerificationModel._();

  factory CustomerVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerVerificationModelFromJson(json);

  CustomerVerificationEntity toEntity() =>
      CustomerVerificationEntity(customerName: customerName ?? '');
}

@freezed
class BillPurchaseModel with _$BillPurchaseModel {
  const factory BillPurchaseModel({
    String? reference,
    String? pin,
  }) = _BillPurchaseModel;

  const BillPurchaseModel._();

  factory BillPurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$BillPurchaseModelFromJson(json);

  BillPurchaseEntity toEntity() =>
      BillPurchaseEntity(reference: reference ?? '', pin: pin);
}
