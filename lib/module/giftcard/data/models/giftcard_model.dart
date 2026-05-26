import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/giftcard/domain/entities/giftcard_entity.dart';

part 'giftcard_model.freezed.dart';
part 'giftcard_model.g.dart';

@freezed
class BuyGiftcardRateModel with _$BuyGiftcardRateModel {
  const factory BuyGiftcardRateModel({
    required String type,
    required String logoUrl,
    required String category,
    required List<GiftcardRegionModel> regions,
  }) = _BuyGiftcardRateModel;

  const BuyGiftcardRateModel._();

  factory BuyGiftcardRateModel.fromJson(Map<String, dynamic> json) => _$BuyGiftcardRateModelFromJson(json);

  BuyGiftcardRateEntity toEntity() => BuyGiftcardRateEntity(
    type: type,
    logoUrl: logoUrl,
    category: category,
    regions: regions.map((e) => e.toEntity()).toList(),
  );
}

@freezed
class GiftcardRegionModel with _$GiftcardRegionModel {
  const factory GiftcardRegionModel({
    String? id,
    required String name,
    required String flagUrl,
    String? packageName,
    required String currency,
    String? countryName,
    String? countryCode,
    List<GiftcardItemModel>? items,
    List<GiftcardSubcategoryModel>? subcategories,
  }) = _GiftcardRegionModel;

  const GiftcardRegionModel._();

  factory GiftcardRegionModel.fromJson(Map<String, dynamic> json) => _$GiftcardRegionModelFromJson(json);

  GiftcardRegionEntity toEntity() => GiftcardRegionEntity(
    id: id,
    name: name,
    flagUrl: flagUrl,
    packageName: packageName,
    currency: currency,
    countryName: countryName,
    countryCode: countryCode,
    items: items?.map((e) => e.toEntity()).toList(),
    subcategories: subcategories?.map((e) => e.toEntity()).toList(),
  );
}

@freezed
class GiftcardItemModel with _$GiftcardItemModel {
  const factory GiftcardItemModel({
    required double minAmount,
    required double maxAmount,
    required String kudaIdentifier,
    required double amountInNaira,
    required double rate,
  }) = _GiftcardItemModel;

  const GiftcardItemModel._();

  factory GiftcardItemModel.fromJson(Map<String, dynamic> json) => _$GiftcardItemModelFromJson(json);

  GiftcardItemEntity toEntity() => GiftcardItemEntity(
    minAmount: minAmount,
    maxAmount: maxAmount,
    kudaIdentifier: kudaIdentifier,
    amountInNaira: amountInNaira,
    rate: rate,
  );
}

@freezed
class GiftcardSubcategoryModel with _$GiftcardSubcategoryModel {
  const factory GiftcardSubcategoryModel({
    required String id,
    required String name,
    required String minAmount,
    required String maxAmount,
    required String sellRate,
  }) = _GiftcardSubcategoryModel;

  const GiftcardSubcategoryModel._();

  factory GiftcardSubcategoryModel.fromJson(Map<String, dynamic> json) => _$GiftcardSubcategoryModelFromJson(json);

  GiftcardSubcategoryEntity toEntity() => GiftcardSubcategoryEntity(
    id: id,
    name: name,
    minAmount: minAmount,
    maxAmount: maxAmount,
    sellRate: sellRate,
  );
}

@freezed
class SellGiftcardRateModel with _$SellGiftcardRateModel {
  const factory SellGiftcardRateModel({
    required String id,
    required String type,
    required String logoUrl,
    required List<GiftcardRegionModel> regions,
  }) = _SellGiftcardRateModel;

  const SellGiftcardRateModel._();

  factory SellGiftcardRateModel.fromJson(Map<String, dynamic> json) => _$SellGiftcardRateModelFromJson(json);

  SellGiftcardRateEntity toEntity() => SellGiftcardRateEntity(
    id: id,
    type: type,
    logoUrl: logoUrl,
    regions: regions.map((e) => e.toEntity()).toList(),
  );
}
