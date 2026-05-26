// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giftcard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuyGiftcardRateModelImpl _$$BuyGiftcardRateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BuyGiftcardRateModelImpl(
      type: json['type'] as String,
      logoUrl: json['logoUrl'] as String,
      category: json['category'] as String,
      regions: (json['regions'] as List<dynamic>)
          .map((e) => GiftcardRegionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BuyGiftcardRateModelImplToJson(
        _$BuyGiftcardRateModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'logoUrl': instance.logoUrl,
      'category': instance.category,
      'regions': instance.regions,
    };

_$GiftcardRegionModelImpl _$$GiftcardRegionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GiftcardRegionModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      flagUrl: json['flagUrl'] as String,
      packageName: json['packageName'] as String?,
      currency: json['currency'] as String,
      countryName: json['countryName'] as String?,
      countryCode: json['countryCode'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => GiftcardItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subcategories: (json['subcategories'] as List<dynamic>?)
          ?.map((e) =>
              GiftcardSubcategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GiftcardRegionModelImplToJson(
        _$GiftcardRegionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'flagUrl': instance.flagUrl,
      'packageName': instance.packageName,
      'currency': instance.currency,
      'countryName': instance.countryName,
      'countryCode': instance.countryCode,
      'items': instance.items,
      'subcategories': instance.subcategories,
    };

_$GiftcardItemModelImpl _$$GiftcardItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GiftcardItemModelImpl(
      minAmount: (json['minAmount'] as num).toDouble(),
      maxAmount: (json['maxAmount'] as num).toDouble(),
      kudaIdentifier: json['kudaIdentifier'] as String,
      amountInNaira: (json['amountInNaira'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$GiftcardItemModelImplToJson(
        _$GiftcardItemModelImpl instance) =>
    <String, dynamic>{
      'minAmount': instance.minAmount,
      'maxAmount': instance.maxAmount,
      'kudaIdentifier': instance.kudaIdentifier,
      'amountInNaira': instance.amountInNaira,
      'rate': instance.rate,
    };

_$GiftcardSubcategoryModelImpl _$$GiftcardSubcategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GiftcardSubcategoryModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      minAmount: json['minAmount'] as String,
      maxAmount: json['maxAmount'] as String,
      sellRate: json['sellRate'] as String,
    );

Map<String, dynamic> _$$GiftcardSubcategoryModelImplToJson(
        _$GiftcardSubcategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'minAmount': instance.minAmount,
      'maxAmount': instance.maxAmount,
      'sellRate': instance.sellRate,
    };

_$SellGiftcardRateModelImpl _$$SellGiftcardRateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SellGiftcardRateModelImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      logoUrl: json['logoUrl'] as String,
      regions: (json['regions'] as List<dynamic>)
          .map((e) => GiftcardRegionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SellGiftcardRateModelImplToJson(
        _$SellGiftcardRateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logoUrl': instance.logoUrl,
      'regions': instance.regions,
    };
