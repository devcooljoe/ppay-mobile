import 'package:freezed_annotation/freezed_annotation.dart';

part 'giftcard_entity.freezed.dart';

@freezed
class BuyGiftcardRateEntity with _$BuyGiftcardRateEntity {
  const factory BuyGiftcardRateEntity({
    required String type,
    required String logoUrl,
    required String category,
    required List<GiftcardRegionEntity> regions,
  }) = _BuyGiftcardRateEntity;
}

@freezed
class GiftcardRegionEntity with _$GiftcardRegionEntity {
  const factory GiftcardRegionEntity({
    String? id,
    String? name,
    required String flagUrl,
    String? packageName,
    String? currency,
    String? countryName,
    String? countryCode,
    List<GiftcardItemEntity>? items,
    List<GiftcardSubcategoryEntity>? subcategories,
  }) = _GiftcardRegionEntity;
}

@freezed
class GiftcardItemEntity with _$GiftcardItemEntity {
  const factory GiftcardItemEntity({
    required double minAmount,
    required double maxAmount,
    required String kudaIdentifier,
    required double amountInNaira,
    required double rate,
  }) = _GiftcardItemEntity;
}

@freezed
class GiftcardSubcategoryEntity with _$GiftcardSubcategoryEntity {
  const factory GiftcardSubcategoryEntity({
    required String id,
    required String name,
    required String minAmount,
    required String maxAmount,
    required String sellRate,
  }) = _GiftcardSubcategoryEntity;
}

@freezed
class SellGiftcardRateEntity with _$SellGiftcardRateEntity {
  const factory SellGiftcardRateEntity({
    required String id,
    required String type,
    required String logoUrl,
    required List<GiftcardRegionEntity> regions,
  }) = _SellGiftcardRateEntity;
}
