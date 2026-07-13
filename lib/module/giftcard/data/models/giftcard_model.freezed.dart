// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'giftcard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BuyGiftcardRateModel _$BuyGiftcardRateModelFromJson(Map<String, dynamic> json) {
  return _BuyGiftcardRateModel.fromJson(json);
}

/// @nodoc
mixin _$BuyGiftcardRateModel {
  String get type => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<GiftcardRegionModel> get regions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuyGiftcardRateModelCopyWith<BuyGiftcardRateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyGiftcardRateModelCopyWith<$Res> {
  factory $BuyGiftcardRateModelCopyWith(BuyGiftcardRateModel value,
          $Res Function(BuyGiftcardRateModel) then) =
      _$BuyGiftcardRateModelCopyWithImpl<$Res, BuyGiftcardRateModel>;
  @useResult
  $Res call(
      {String type,
      String logoUrl,
      String category,
      List<GiftcardRegionModel> regions});
}

/// @nodoc
class _$BuyGiftcardRateModelCopyWithImpl<$Res,
        $Val extends BuyGiftcardRateModel>
    implements $BuyGiftcardRateModelCopyWith<$Res> {
  _$BuyGiftcardRateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? logoUrl = null,
    Object? category = null,
    Object? regions = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      regions: null == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<GiftcardRegionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuyGiftcardRateModelImplCopyWith<$Res>
    implements $BuyGiftcardRateModelCopyWith<$Res> {
  factory _$$BuyGiftcardRateModelImplCopyWith(_$BuyGiftcardRateModelImpl value,
          $Res Function(_$BuyGiftcardRateModelImpl) then) =
      __$$BuyGiftcardRateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String logoUrl,
      String category,
      List<GiftcardRegionModel> regions});
}

/// @nodoc
class __$$BuyGiftcardRateModelImplCopyWithImpl<$Res>
    extends _$BuyGiftcardRateModelCopyWithImpl<$Res, _$BuyGiftcardRateModelImpl>
    implements _$$BuyGiftcardRateModelImplCopyWith<$Res> {
  __$$BuyGiftcardRateModelImplCopyWithImpl(_$BuyGiftcardRateModelImpl _value,
      $Res Function(_$BuyGiftcardRateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? logoUrl = null,
    Object? category = null,
    Object? regions = null,
  }) {
    return _then(_$BuyGiftcardRateModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      regions: null == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<GiftcardRegionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuyGiftcardRateModelImpl extends _BuyGiftcardRateModel {
  const _$BuyGiftcardRateModelImpl(
      {required this.type,
      required this.logoUrl,
      required this.category,
      required final List<GiftcardRegionModel> regions})
      : _regions = regions,
        super._();

  factory _$BuyGiftcardRateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuyGiftcardRateModelImplFromJson(json);

  @override
  final String type;
  @override
  final String logoUrl;
  @override
  final String category;
  final List<GiftcardRegionModel> _regions;
  @override
  List<GiftcardRegionModel> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  @override
  String toString() {
    return 'BuyGiftcardRateModel(type: $type, logoUrl: $logoUrl, category: $category, regions: $regions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyGiftcardRateModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._regions, _regions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, logoUrl, category,
      const DeepCollectionEquality().hash(_regions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyGiftcardRateModelImplCopyWith<_$BuyGiftcardRateModelImpl>
      get copyWith =>
          __$$BuyGiftcardRateModelImplCopyWithImpl<_$BuyGiftcardRateModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuyGiftcardRateModelImplToJson(
      this,
    );
  }
}

abstract class _BuyGiftcardRateModel extends BuyGiftcardRateModel {
  const factory _BuyGiftcardRateModel(
          {required final String type,
          required final String logoUrl,
          required final String category,
          required final List<GiftcardRegionModel> regions}) =
      _$BuyGiftcardRateModelImpl;
  const _BuyGiftcardRateModel._() : super._();

  factory _BuyGiftcardRateModel.fromJson(Map<String, dynamic> json) =
      _$BuyGiftcardRateModelImpl.fromJson;

  @override
  String get type;
  @override
  String get logoUrl;
  @override
  String get category;
  @override
  List<GiftcardRegionModel> get regions;
  @override
  @JsonKey(ignore: true)
  _$$BuyGiftcardRateModelImplCopyWith<_$BuyGiftcardRateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GiftcardRegionModel _$GiftcardRegionModelFromJson(Map<String, dynamic> json) {
  return _GiftcardRegionModel.fromJson(json);
}

/// @nodoc
mixin _$GiftcardRegionModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get flagUrl => throw _privateConstructorUsedError;
  String? get packageName => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get countryName => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  List<GiftcardItemModel>? get items => throw _privateConstructorUsedError;
  List<GiftcardSubcategoryModel>? get subcategories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftcardRegionModelCopyWith<GiftcardRegionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftcardRegionModelCopyWith<$Res> {
  factory $GiftcardRegionModelCopyWith(
          GiftcardRegionModel value, $Res Function(GiftcardRegionModel) then) =
      _$GiftcardRegionModelCopyWithImpl<$Res, GiftcardRegionModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String flagUrl,
      String? packageName,
      String? currency,
      String? countryName,
      String? countryCode,
      List<GiftcardItemModel>? items,
      List<GiftcardSubcategoryModel>? subcategories});
}

/// @nodoc
class _$GiftcardRegionModelCopyWithImpl<$Res, $Val extends GiftcardRegionModel>
    implements $GiftcardRegionModelCopyWith<$Res> {
  _$GiftcardRegionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? flagUrl = null,
    Object? packageName = freezed,
    Object? currency = freezed,
    Object? countryName = freezed,
    Object? countryCode = freezed,
    Object? items = freezed,
    Object? subcategories = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      flagUrl: null == flagUrl
          ? _value.flagUrl
          : flagUrl // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GiftcardItemModel>?,
      subcategories: freezed == subcategories
          ? _value.subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<GiftcardSubcategoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftcardRegionModelImplCopyWith<$Res>
    implements $GiftcardRegionModelCopyWith<$Res> {
  factory _$$GiftcardRegionModelImplCopyWith(_$GiftcardRegionModelImpl value,
          $Res Function(_$GiftcardRegionModelImpl) then) =
      __$$GiftcardRegionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String flagUrl,
      String? packageName,
      String? currency,
      String? countryName,
      String? countryCode,
      List<GiftcardItemModel>? items,
      List<GiftcardSubcategoryModel>? subcategories});
}

/// @nodoc
class __$$GiftcardRegionModelImplCopyWithImpl<$Res>
    extends _$GiftcardRegionModelCopyWithImpl<$Res, _$GiftcardRegionModelImpl>
    implements _$$GiftcardRegionModelImplCopyWith<$Res> {
  __$$GiftcardRegionModelImplCopyWithImpl(_$GiftcardRegionModelImpl _value,
      $Res Function(_$GiftcardRegionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? flagUrl = null,
    Object? packageName = freezed,
    Object? currency = freezed,
    Object? countryName = freezed,
    Object? countryCode = freezed,
    Object? items = freezed,
    Object? subcategories = freezed,
  }) {
    return _then(_$GiftcardRegionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      flagUrl: null == flagUrl
          ? _value.flagUrl
          : flagUrl // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GiftcardItemModel>?,
      subcategories: freezed == subcategories
          ? _value._subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<GiftcardSubcategoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftcardRegionModelImpl extends _GiftcardRegionModel {
  const _$GiftcardRegionModelImpl(
      {this.id,
      this.name,
      required this.flagUrl,
      this.packageName,
      this.currency,
      this.countryName,
      this.countryCode,
      final List<GiftcardItemModel>? items,
      final List<GiftcardSubcategoryModel>? subcategories})
      : _items = items,
        _subcategories = subcategories,
        super._();

  factory _$GiftcardRegionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftcardRegionModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String flagUrl;
  @override
  final String? packageName;
  @override
  final String? currency;
  @override
  final String? countryName;
  @override
  final String? countryCode;
  final List<GiftcardItemModel>? _items;
  @override
  List<GiftcardItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<GiftcardSubcategoryModel>? _subcategories;
  @override
  List<GiftcardSubcategoryModel>? get subcategories {
    final value = _subcategories;
    if (value == null) return null;
    if (_subcategories is EqualUnmodifiableListView) return _subcategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GiftcardRegionModel(id: $id, name: $name, flagUrl: $flagUrl, packageName: $packageName, currency: $currency, countryName: $countryName, countryCode: $countryCode, items: $items, subcategories: $subcategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftcardRegionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.flagUrl, flagUrl) || other.flagUrl == flagUrl) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._subcategories, _subcategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      flagUrl,
      packageName,
      currency,
      countryName,
      countryCode,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_subcategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftcardRegionModelImplCopyWith<_$GiftcardRegionModelImpl> get copyWith =>
      __$$GiftcardRegionModelImplCopyWithImpl<_$GiftcardRegionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftcardRegionModelImplToJson(
      this,
    );
  }
}

abstract class _GiftcardRegionModel extends GiftcardRegionModel {
  const factory _GiftcardRegionModel(
          {final String? id,
          final String? name,
          required final String flagUrl,
          final String? packageName,
          final String? currency,
          final String? countryName,
          final String? countryCode,
          final List<GiftcardItemModel>? items,
          final List<GiftcardSubcategoryModel>? subcategories}) =
      _$GiftcardRegionModelImpl;
  const _GiftcardRegionModel._() : super._();

  factory _GiftcardRegionModel.fromJson(Map<String, dynamic> json) =
      _$GiftcardRegionModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String get flagUrl;
  @override
  String? get packageName;
  @override
  String? get currency;
  @override
  String? get countryName;
  @override
  String? get countryCode;
  @override
  List<GiftcardItemModel>? get items;
  @override
  List<GiftcardSubcategoryModel>? get subcategories;
  @override
  @JsonKey(ignore: true)
  _$$GiftcardRegionModelImplCopyWith<_$GiftcardRegionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GiftcardItemModel _$GiftcardItemModelFromJson(Map<String, dynamic> json) {
  return _GiftcardItemModel.fromJson(json);
}

/// @nodoc
mixin _$GiftcardItemModel {
  double get minAmount => throw _privateConstructorUsedError;
  double get maxAmount => throw _privateConstructorUsedError;
  String get kudaIdentifier => throw _privateConstructorUsedError;
  double get amountInNaira => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftcardItemModelCopyWith<GiftcardItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftcardItemModelCopyWith<$Res> {
  factory $GiftcardItemModelCopyWith(
          GiftcardItemModel value, $Res Function(GiftcardItemModel) then) =
      _$GiftcardItemModelCopyWithImpl<$Res, GiftcardItemModel>;
  @useResult
  $Res call(
      {double minAmount,
      double maxAmount,
      String kudaIdentifier,
      double amountInNaira,
      double rate});
}

/// @nodoc
class _$GiftcardItemModelCopyWithImpl<$Res, $Val extends GiftcardItemModel>
    implements $GiftcardItemModelCopyWith<$Res> {
  _$GiftcardItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minAmount = null,
    Object? maxAmount = null,
    Object? kudaIdentifier = null,
    Object? amountInNaira = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      minAmount: null == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxAmount: null == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      kudaIdentifier: null == kudaIdentifier
          ? _value.kudaIdentifier
          : kudaIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      amountInNaira: null == amountInNaira
          ? _value.amountInNaira
          : amountInNaira // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftcardItemModelImplCopyWith<$Res>
    implements $GiftcardItemModelCopyWith<$Res> {
  factory _$$GiftcardItemModelImplCopyWith(_$GiftcardItemModelImpl value,
          $Res Function(_$GiftcardItemModelImpl) then) =
      __$$GiftcardItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double minAmount,
      double maxAmount,
      String kudaIdentifier,
      double amountInNaira,
      double rate});
}

/// @nodoc
class __$$GiftcardItemModelImplCopyWithImpl<$Res>
    extends _$GiftcardItemModelCopyWithImpl<$Res, _$GiftcardItemModelImpl>
    implements _$$GiftcardItemModelImplCopyWith<$Res> {
  __$$GiftcardItemModelImplCopyWithImpl(_$GiftcardItemModelImpl _value,
      $Res Function(_$GiftcardItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minAmount = null,
    Object? maxAmount = null,
    Object? kudaIdentifier = null,
    Object? amountInNaira = null,
    Object? rate = null,
  }) {
    return _then(_$GiftcardItemModelImpl(
      minAmount: null == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxAmount: null == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      kudaIdentifier: null == kudaIdentifier
          ? _value.kudaIdentifier
          : kudaIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      amountInNaira: null == amountInNaira
          ? _value.amountInNaira
          : amountInNaira // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftcardItemModelImpl extends _GiftcardItemModel {
  const _$GiftcardItemModelImpl(
      {required this.minAmount,
      required this.maxAmount,
      required this.kudaIdentifier,
      required this.amountInNaira,
      required this.rate})
      : super._();

  factory _$GiftcardItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftcardItemModelImplFromJson(json);

  @override
  final double minAmount;
  @override
  final double maxAmount;
  @override
  final String kudaIdentifier;
  @override
  final double amountInNaira;
  @override
  final double rate;

  @override
  String toString() {
    return 'GiftcardItemModel(minAmount: $minAmount, maxAmount: $maxAmount, kudaIdentifier: $kudaIdentifier, amountInNaira: $amountInNaira, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftcardItemModelImpl &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount) &&
            (identical(other.kudaIdentifier, kudaIdentifier) ||
                other.kudaIdentifier == kudaIdentifier) &&
            (identical(other.amountInNaira, amountInNaira) ||
                other.amountInNaira == amountInNaira) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, minAmount, maxAmount, kudaIdentifier, amountInNaira, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftcardItemModelImplCopyWith<_$GiftcardItemModelImpl> get copyWith =>
      __$$GiftcardItemModelImplCopyWithImpl<_$GiftcardItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftcardItemModelImplToJson(
      this,
    );
  }
}

abstract class _GiftcardItemModel extends GiftcardItemModel {
  const factory _GiftcardItemModel(
      {required final double minAmount,
      required final double maxAmount,
      required final String kudaIdentifier,
      required final double amountInNaira,
      required final double rate}) = _$GiftcardItemModelImpl;
  const _GiftcardItemModel._() : super._();

  factory _GiftcardItemModel.fromJson(Map<String, dynamic> json) =
      _$GiftcardItemModelImpl.fromJson;

  @override
  double get minAmount;
  @override
  double get maxAmount;
  @override
  String get kudaIdentifier;
  @override
  double get amountInNaira;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$GiftcardItemModelImplCopyWith<_$GiftcardItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GiftcardSubcategoryModel _$GiftcardSubcategoryModelFromJson(
    Map<String, dynamic> json) {
  return _GiftcardSubcategoryModel.fromJson(json);
}

/// @nodoc
mixin _$GiftcardSubcategoryModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get minAmount => throw _privateConstructorUsedError;
  String get maxAmount => throw _privateConstructorUsedError;
  String get sellRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftcardSubcategoryModelCopyWith<GiftcardSubcategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftcardSubcategoryModelCopyWith<$Res> {
  factory $GiftcardSubcategoryModelCopyWith(GiftcardSubcategoryModel value,
          $Res Function(GiftcardSubcategoryModel) then) =
      _$GiftcardSubcategoryModelCopyWithImpl<$Res, GiftcardSubcategoryModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String minAmount,
      String maxAmount,
      String sellRate});
}

/// @nodoc
class _$GiftcardSubcategoryModelCopyWithImpl<$Res,
        $Val extends GiftcardSubcategoryModel>
    implements $GiftcardSubcategoryModelCopyWith<$Res> {
  _$GiftcardSubcategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? minAmount = null,
    Object? maxAmount = null,
    Object? sellRate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minAmount: null == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as String,
      maxAmount: null == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as String,
      sellRate: null == sellRate
          ? _value.sellRate
          : sellRate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftcardSubcategoryModelImplCopyWith<$Res>
    implements $GiftcardSubcategoryModelCopyWith<$Res> {
  factory _$$GiftcardSubcategoryModelImplCopyWith(
          _$GiftcardSubcategoryModelImpl value,
          $Res Function(_$GiftcardSubcategoryModelImpl) then) =
      __$$GiftcardSubcategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String minAmount,
      String maxAmount,
      String sellRate});
}

/// @nodoc
class __$$GiftcardSubcategoryModelImplCopyWithImpl<$Res>
    extends _$GiftcardSubcategoryModelCopyWithImpl<$Res,
        _$GiftcardSubcategoryModelImpl>
    implements _$$GiftcardSubcategoryModelImplCopyWith<$Res> {
  __$$GiftcardSubcategoryModelImplCopyWithImpl(
      _$GiftcardSubcategoryModelImpl _value,
      $Res Function(_$GiftcardSubcategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? minAmount = null,
    Object? maxAmount = null,
    Object? sellRate = null,
  }) {
    return _then(_$GiftcardSubcategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minAmount: null == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as String,
      maxAmount: null == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as String,
      sellRate: null == sellRate
          ? _value.sellRate
          : sellRate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftcardSubcategoryModelImpl extends _GiftcardSubcategoryModel {
  const _$GiftcardSubcategoryModelImpl(
      {required this.id,
      required this.name,
      required this.minAmount,
      required this.maxAmount,
      required this.sellRate})
      : super._();

  factory _$GiftcardSubcategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftcardSubcategoryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String minAmount;
  @override
  final String maxAmount;
  @override
  final String sellRate;

  @override
  String toString() {
    return 'GiftcardSubcategoryModel(id: $id, name: $name, minAmount: $minAmount, maxAmount: $maxAmount, sellRate: $sellRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftcardSubcategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount) &&
            (identical(other.sellRate, sellRate) ||
                other.sellRate == sellRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, minAmount, maxAmount, sellRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftcardSubcategoryModelImplCopyWith<_$GiftcardSubcategoryModelImpl>
      get copyWith => __$$GiftcardSubcategoryModelImplCopyWithImpl<
          _$GiftcardSubcategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftcardSubcategoryModelImplToJson(
      this,
    );
  }
}

abstract class _GiftcardSubcategoryModel extends GiftcardSubcategoryModel {
  const factory _GiftcardSubcategoryModel(
      {required final String id,
      required final String name,
      required final String minAmount,
      required final String maxAmount,
      required final String sellRate}) = _$GiftcardSubcategoryModelImpl;
  const _GiftcardSubcategoryModel._() : super._();

  factory _GiftcardSubcategoryModel.fromJson(Map<String, dynamic> json) =
      _$GiftcardSubcategoryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get minAmount;
  @override
  String get maxAmount;
  @override
  String get sellRate;
  @override
  @JsonKey(ignore: true)
  _$$GiftcardSubcategoryModelImplCopyWith<_$GiftcardSubcategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SellGiftcardRateModel _$SellGiftcardRateModelFromJson(
    Map<String, dynamic> json) {
  return _SellGiftcardRateModel.fromJson(json);
}

/// @nodoc
mixin _$SellGiftcardRateModel {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;
  List<GiftcardRegionModel> get regions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellGiftcardRateModelCopyWith<SellGiftcardRateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellGiftcardRateModelCopyWith<$Res> {
  factory $SellGiftcardRateModelCopyWith(SellGiftcardRateModel value,
          $Res Function(SellGiftcardRateModel) then) =
      _$SellGiftcardRateModelCopyWithImpl<$Res, SellGiftcardRateModel>;
  @useResult
  $Res call(
      {String id,
      String type,
      String logoUrl,
      List<GiftcardRegionModel> regions});
}

/// @nodoc
class _$SellGiftcardRateModelCopyWithImpl<$Res,
        $Val extends SellGiftcardRateModel>
    implements $SellGiftcardRateModelCopyWith<$Res> {
  _$SellGiftcardRateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? logoUrl = null,
    Object? regions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      regions: null == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<GiftcardRegionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellGiftcardRateModelImplCopyWith<$Res>
    implements $SellGiftcardRateModelCopyWith<$Res> {
  factory _$$SellGiftcardRateModelImplCopyWith(
          _$SellGiftcardRateModelImpl value,
          $Res Function(_$SellGiftcardRateModelImpl) then) =
      __$$SellGiftcardRateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String logoUrl,
      List<GiftcardRegionModel> regions});
}

/// @nodoc
class __$$SellGiftcardRateModelImplCopyWithImpl<$Res>
    extends _$SellGiftcardRateModelCopyWithImpl<$Res,
        _$SellGiftcardRateModelImpl>
    implements _$$SellGiftcardRateModelImplCopyWith<$Res> {
  __$$SellGiftcardRateModelImplCopyWithImpl(_$SellGiftcardRateModelImpl _value,
      $Res Function(_$SellGiftcardRateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? logoUrl = null,
    Object? regions = null,
  }) {
    return _then(_$SellGiftcardRateModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      regions: null == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<GiftcardRegionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellGiftcardRateModelImpl extends _SellGiftcardRateModel {
  const _$SellGiftcardRateModelImpl(
      {required this.id,
      required this.type,
      required this.logoUrl,
      required final List<GiftcardRegionModel> regions})
      : _regions = regions,
        super._();

  factory _$SellGiftcardRateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellGiftcardRateModelImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String logoUrl;
  final List<GiftcardRegionModel> _regions;
  @override
  List<GiftcardRegionModel> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  @override
  String toString() {
    return 'SellGiftcardRateModel(id: $id, type: $type, logoUrl: $logoUrl, regions: $regions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellGiftcardRateModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            const DeepCollectionEquality().equals(other._regions, _regions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, logoUrl,
      const DeepCollectionEquality().hash(_regions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellGiftcardRateModelImplCopyWith<_$SellGiftcardRateModelImpl>
      get copyWith => __$$SellGiftcardRateModelImplCopyWithImpl<
          _$SellGiftcardRateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellGiftcardRateModelImplToJson(
      this,
    );
  }
}

abstract class _SellGiftcardRateModel extends SellGiftcardRateModel {
  const factory _SellGiftcardRateModel(
          {required final String id,
          required final String type,
          required final String logoUrl,
          required final List<GiftcardRegionModel> regions}) =
      _$SellGiftcardRateModelImpl;
  const _SellGiftcardRateModel._() : super._();

  factory _SellGiftcardRateModel.fromJson(Map<String, dynamic> json) =
      _$SellGiftcardRateModelImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get logoUrl;
  @override
  List<GiftcardRegionModel> get regions;
  @override
  @JsonKey(ignore: true)
  _$$SellGiftcardRateModelImplCopyWith<_$SellGiftcardRateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
