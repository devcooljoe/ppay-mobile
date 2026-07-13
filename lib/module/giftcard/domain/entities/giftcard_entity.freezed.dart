// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'giftcard_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BuyGiftcardRateEntity {
  String get type => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<GiftcardRegionEntity> get regions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BuyGiftcardRateEntityCopyWith<BuyGiftcardRateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyGiftcardRateEntityCopyWith<$Res> {
  factory $BuyGiftcardRateEntityCopyWith(BuyGiftcardRateEntity value,
          $Res Function(BuyGiftcardRateEntity) then) =
      _$BuyGiftcardRateEntityCopyWithImpl<$Res, BuyGiftcardRateEntity>;
  @useResult
  $Res call(
      {String type,
      String logoUrl,
      String category,
      List<GiftcardRegionEntity> regions});
}

/// @nodoc
class _$BuyGiftcardRateEntityCopyWithImpl<$Res,
        $Val extends BuyGiftcardRateEntity>
    implements $BuyGiftcardRateEntityCopyWith<$Res> {
  _$BuyGiftcardRateEntityCopyWithImpl(this._value, this._then);

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
              as List<GiftcardRegionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuyGiftcardRateEntityImplCopyWith<$Res>
    implements $BuyGiftcardRateEntityCopyWith<$Res> {
  factory _$$BuyGiftcardRateEntityImplCopyWith(
          _$BuyGiftcardRateEntityImpl value,
          $Res Function(_$BuyGiftcardRateEntityImpl) then) =
      __$$BuyGiftcardRateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String logoUrl,
      String category,
      List<GiftcardRegionEntity> regions});
}

/// @nodoc
class __$$BuyGiftcardRateEntityImplCopyWithImpl<$Res>
    extends _$BuyGiftcardRateEntityCopyWithImpl<$Res,
        _$BuyGiftcardRateEntityImpl>
    implements _$$BuyGiftcardRateEntityImplCopyWith<$Res> {
  __$$BuyGiftcardRateEntityImplCopyWithImpl(_$BuyGiftcardRateEntityImpl _value,
      $Res Function(_$BuyGiftcardRateEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? logoUrl = null,
    Object? category = null,
    Object? regions = null,
  }) {
    return _then(_$BuyGiftcardRateEntityImpl(
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
              as List<GiftcardRegionEntity>,
    ));
  }
}

/// @nodoc

class _$BuyGiftcardRateEntityImpl implements _BuyGiftcardRateEntity {
  const _$BuyGiftcardRateEntityImpl(
      {required this.type,
      required this.logoUrl,
      required this.category,
      required final List<GiftcardRegionEntity> regions})
      : _regions = regions;

  @override
  final String type;
  @override
  final String logoUrl;
  @override
  final String category;
  final List<GiftcardRegionEntity> _regions;
  @override
  List<GiftcardRegionEntity> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  @override
  String toString() {
    return 'BuyGiftcardRateEntity(type: $type, logoUrl: $logoUrl, category: $category, regions: $regions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyGiftcardRateEntityImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._regions, _regions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, logoUrl, category,
      const DeepCollectionEquality().hash(_regions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyGiftcardRateEntityImplCopyWith<_$BuyGiftcardRateEntityImpl>
      get copyWith => __$$BuyGiftcardRateEntityImplCopyWithImpl<
          _$BuyGiftcardRateEntityImpl>(this, _$identity);
}

abstract class _BuyGiftcardRateEntity implements BuyGiftcardRateEntity {
  const factory _BuyGiftcardRateEntity(
          {required final String type,
          required final String logoUrl,
          required final String category,
          required final List<GiftcardRegionEntity> regions}) =
      _$BuyGiftcardRateEntityImpl;

  @override
  String get type;
  @override
  String get logoUrl;
  @override
  String get category;
  @override
  List<GiftcardRegionEntity> get regions;
  @override
  @JsonKey(ignore: true)
  _$$BuyGiftcardRateEntityImplCopyWith<_$BuyGiftcardRateEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GiftcardRegionEntity {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get flagUrl => throw _privateConstructorUsedError;
  String? get packageName => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get countryName => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  List<GiftcardItemEntity>? get items => throw _privateConstructorUsedError;
  List<GiftcardSubcategoryEntity>? get subcategories =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GiftcardRegionEntityCopyWith<GiftcardRegionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftcardRegionEntityCopyWith<$Res> {
  factory $GiftcardRegionEntityCopyWith(GiftcardRegionEntity value,
          $Res Function(GiftcardRegionEntity) then) =
      _$GiftcardRegionEntityCopyWithImpl<$Res, GiftcardRegionEntity>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String flagUrl,
      String? packageName,
      String? currency,
      String? countryName,
      String? countryCode,
      List<GiftcardItemEntity>? items,
      List<GiftcardSubcategoryEntity>? subcategories});
}

/// @nodoc
class _$GiftcardRegionEntityCopyWithImpl<$Res,
        $Val extends GiftcardRegionEntity>
    implements $GiftcardRegionEntityCopyWith<$Res> {
  _$GiftcardRegionEntityCopyWithImpl(this._value, this._then);

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
              as List<GiftcardItemEntity>?,
      subcategories: freezed == subcategories
          ? _value.subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<GiftcardSubcategoryEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftcardRegionEntityImplCopyWith<$Res>
    implements $GiftcardRegionEntityCopyWith<$Res> {
  factory _$$GiftcardRegionEntityImplCopyWith(_$GiftcardRegionEntityImpl value,
          $Res Function(_$GiftcardRegionEntityImpl) then) =
      __$$GiftcardRegionEntityImplCopyWithImpl<$Res>;
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
      List<GiftcardItemEntity>? items,
      List<GiftcardSubcategoryEntity>? subcategories});
}

/// @nodoc
class __$$GiftcardRegionEntityImplCopyWithImpl<$Res>
    extends _$GiftcardRegionEntityCopyWithImpl<$Res, _$GiftcardRegionEntityImpl>
    implements _$$GiftcardRegionEntityImplCopyWith<$Res> {
  __$$GiftcardRegionEntityImplCopyWithImpl(_$GiftcardRegionEntityImpl _value,
      $Res Function(_$GiftcardRegionEntityImpl) _then)
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
    return _then(_$GiftcardRegionEntityImpl(
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
              as List<GiftcardItemEntity>?,
      subcategories: freezed == subcategories
          ? _value._subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<GiftcardSubcategoryEntity>?,
    ));
  }
}

/// @nodoc

class _$GiftcardRegionEntityImpl implements _GiftcardRegionEntity {
  const _$GiftcardRegionEntityImpl(
      {this.id,
      this.name,
      required this.flagUrl,
      this.packageName,
      this.currency,
      this.countryName,
      this.countryCode,
      final List<GiftcardItemEntity>? items,
      final List<GiftcardSubcategoryEntity>? subcategories})
      : _items = items,
        _subcategories = subcategories;

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
  final List<GiftcardItemEntity>? _items;
  @override
  List<GiftcardItemEntity>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<GiftcardSubcategoryEntity>? _subcategories;
  @override
  List<GiftcardSubcategoryEntity>? get subcategories {
    final value = _subcategories;
    if (value == null) return null;
    if (_subcategories is EqualUnmodifiableListView) return _subcategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GiftcardRegionEntity(id: $id, name: $name, flagUrl: $flagUrl, packageName: $packageName, currency: $currency, countryName: $countryName, countryCode: $countryCode, items: $items, subcategories: $subcategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftcardRegionEntityImpl &&
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
  _$$GiftcardRegionEntityImplCopyWith<_$GiftcardRegionEntityImpl>
      get copyWith =>
          __$$GiftcardRegionEntityImplCopyWithImpl<_$GiftcardRegionEntityImpl>(
              this, _$identity);
}

abstract class _GiftcardRegionEntity implements GiftcardRegionEntity {
  const factory _GiftcardRegionEntity(
          {final String? id,
          final String? name,
          required final String flagUrl,
          final String? packageName,
          final String? currency,
          final String? countryName,
          final String? countryCode,
          final List<GiftcardItemEntity>? items,
          final List<GiftcardSubcategoryEntity>? subcategories}) =
      _$GiftcardRegionEntityImpl;

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
  List<GiftcardItemEntity>? get items;
  @override
  List<GiftcardSubcategoryEntity>? get subcategories;
  @override
  @JsonKey(ignore: true)
  _$$GiftcardRegionEntityImplCopyWith<_$GiftcardRegionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GiftcardItemEntity {
  double get minAmount => throw _privateConstructorUsedError;
  double get maxAmount => throw _privateConstructorUsedError;
  String get kudaIdentifier => throw _privateConstructorUsedError;
  double get amountInNaira => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GiftcardItemEntityCopyWith<GiftcardItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftcardItemEntityCopyWith<$Res> {
  factory $GiftcardItemEntityCopyWith(
          GiftcardItemEntity value, $Res Function(GiftcardItemEntity) then) =
      _$GiftcardItemEntityCopyWithImpl<$Res, GiftcardItemEntity>;
  @useResult
  $Res call(
      {double minAmount,
      double maxAmount,
      String kudaIdentifier,
      double amountInNaira,
      double rate});
}

/// @nodoc
class _$GiftcardItemEntityCopyWithImpl<$Res, $Val extends GiftcardItemEntity>
    implements $GiftcardItemEntityCopyWith<$Res> {
  _$GiftcardItemEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$GiftcardItemEntityImplCopyWith<$Res>
    implements $GiftcardItemEntityCopyWith<$Res> {
  factory _$$GiftcardItemEntityImplCopyWith(_$GiftcardItemEntityImpl value,
          $Res Function(_$GiftcardItemEntityImpl) then) =
      __$$GiftcardItemEntityImplCopyWithImpl<$Res>;
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
class __$$GiftcardItemEntityImplCopyWithImpl<$Res>
    extends _$GiftcardItemEntityCopyWithImpl<$Res, _$GiftcardItemEntityImpl>
    implements _$$GiftcardItemEntityImplCopyWith<$Res> {
  __$$GiftcardItemEntityImplCopyWithImpl(_$GiftcardItemEntityImpl _value,
      $Res Function(_$GiftcardItemEntityImpl) _then)
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
    return _then(_$GiftcardItemEntityImpl(
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

class _$GiftcardItemEntityImpl implements _GiftcardItemEntity {
  const _$GiftcardItemEntityImpl(
      {required this.minAmount,
      required this.maxAmount,
      required this.kudaIdentifier,
      required this.amountInNaira,
      required this.rate});

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
    return 'GiftcardItemEntity(minAmount: $minAmount, maxAmount: $maxAmount, kudaIdentifier: $kudaIdentifier, amountInNaira: $amountInNaira, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftcardItemEntityImpl &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType, minAmount, maxAmount, kudaIdentifier, amountInNaira, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftcardItemEntityImplCopyWith<_$GiftcardItemEntityImpl> get copyWith =>
      __$$GiftcardItemEntityImplCopyWithImpl<_$GiftcardItemEntityImpl>(
          this, _$identity);
}

abstract class _GiftcardItemEntity implements GiftcardItemEntity {
  const factory _GiftcardItemEntity(
      {required final double minAmount,
      required final double maxAmount,
      required final String kudaIdentifier,
      required final double amountInNaira,
      required final double rate}) = _$GiftcardItemEntityImpl;

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
  _$$GiftcardItemEntityImplCopyWith<_$GiftcardItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GiftcardSubcategoryEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get minAmount => throw _privateConstructorUsedError;
  String get maxAmount => throw _privateConstructorUsedError;
  String get sellRate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GiftcardSubcategoryEntityCopyWith<GiftcardSubcategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftcardSubcategoryEntityCopyWith<$Res> {
  factory $GiftcardSubcategoryEntityCopyWith(GiftcardSubcategoryEntity value,
          $Res Function(GiftcardSubcategoryEntity) then) =
      _$GiftcardSubcategoryEntityCopyWithImpl<$Res, GiftcardSubcategoryEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String minAmount,
      String maxAmount,
      String sellRate});
}

/// @nodoc
class _$GiftcardSubcategoryEntityCopyWithImpl<$Res,
        $Val extends GiftcardSubcategoryEntity>
    implements $GiftcardSubcategoryEntityCopyWith<$Res> {
  _$GiftcardSubcategoryEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$GiftcardSubcategoryEntityImplCopyWith<$Res>
    implements $GiftcardSubcategoryEntityCopyWith<$Res> {
  factory _$$GiftcardSubcategoryEntityImplCopyWith(
          _$GiftcardSubcategoryEntityImpl value,
          $Res Function(_$GiftcardSubcategoryEntityImpl) then) =
      __$$GiftcardSubcategoryEntityImplCopyWithImpl<$Res>;
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
class __$$GiftcardSubcategoryEntityImplCopyWithImpl<$Res>
    extends _$GiftcardSubcategoryEntityCopyWithImpl<$Res,
        _$GiftcardSubcategoryEntityImpl>
    implements _$$GiftcardSubcategoryEntityImplCopyWith<$Res> {
  __$$GiftcardSubcategoryEntityImplCopyWithImpl(
      _$GiftcardSubcategoryEntityImpl _value,
      $Res Function(_$GiftcardSubcategoryEntityImpl) _then)
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
    return _then(_$GiftcardSubcategoryEntityImpl(
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

class _$GiftcardSubcategoryEntityImpl implements _GiftcardSubcategoryEntity {
  const _$GiftcardSubcategoryEntityImpl(
      {required this.id,
      required this.name,
      required this.minAmount,
      required this.maxAmount,
      required this.sellRate});

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
    return 'GiftcardSubcategoryEntity(id: $id, name: $name, minAmount: $minAmount, maxAmount: $maxAmount, sellRate: $sellRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftcardSubcategoryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount) &&
            (identical(other.sellRate, sellRate) ||
                other.sellRate == sellRate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, minAmount, maxAmount, sellRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftcardSubcategoryEntityImplCopyWith<_$GiftcardSubcategoryEntityImpl>
      get copyWith => __$$GiftcardSubcategoryEntityImplCopyWithImpl<
          _$GiftcardSubcategoryEntityImpl>(this, _$identity);
}

abstract class _GiftcardSubcategoryEntity implements GiftcardSubcategoryEntity {
  const factory _GiftcardSubcategoryEntity(
      {required final String id,
      required final String name,
      required final String minAmount,
      required final String maxAmount,
      required final String sellRate}) = _$GiftcardSubcategoryEntityImpl;

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
  _$$GiftcardSubcategoryEntityImplCopyWith<_$GiftcardSubcategoryEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SellGiftcardRateEntity {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;
  List<GiftcardRegionEntity> get regions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SellGiftcardRateEntityCopyWith<SellGiftcardRateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellGiftcardRateEntityCopyWith<$Res> {
  factory $SellGiftcardRateEntityCopyWith(SellGiftcardRateEntity value,
          $Res Function(SellGiftcardRateEntity) then) =
      _$SellGiftcardRateEntityCopyWithImpl<$Res, SellGiftcardRateEntity>;
  @useResult
  $Res call(
      {String id,
      String type,
      String logoUrl,
      List<GiftcardRegionEntity> regions});
}

/// @nodoc
class _$SellGiftcardRateEntityCopyWithImpl<$Res,
        $Val extends SellGiftcardRateEntity>
    implements $SellGiftcardRateEntityCopyWith<$Res> {
  _$SellGiftcardRateEntityCopyWithImpl(this._value, this._then);

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
              as List<GiftcardRegionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellGiftcardRateEntityImplCopyWith<$Res>
    implements $SellGiftcardRateEntityCopyWith<$Res> {
  factory _$$SellGiftcardRateEntityImplCopyWith(
          _$SellGiftcardRateEntityImpl value,
          $Res Function(_$SellGiftcardRateEntityImpl) then) =
      __$$SellGiftcardRateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String logoUrl,
      List<GiftcardRegionEntity> regions});
}

/// @nodoc
class __$$SellGiftcardRateEntityImplCopyWithImpl<$Res>
    extends _$SellGiftcardRateEntityCopyWithImpl<$Res,
        _$SellGiftcardRateEntityImpl>
    implements _$$SellGiftcardRateEntityImplCopyWith<$Res> {
  __$$SellGiftcardRateEntityImplCopyWithImpl(
      _$SellGiftcardRateEntityImpl _value,
      $Res Function(_$SellGiftcardRateEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? logoUrl = null,
    Object? regions = null,
  }) {
    return _then(_$SellGiftcardRateEntityImpl(
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
              as List<GiftcardRegionEntity>,
    ));
  }
}

/// @nodoc

class _$SellGiftcardRateEntityImpl implements _SellGiftcardRateEntity {
  const _$SellGiftcardRateEntityImpl(
      {required this.id,
      required this.type,
      required this.logoUrl,
      required final List<GiftcardRegionEntity> regions})
      : _regions = regions;

  @override
  final String id;
  @override
  final String type;
  @override
  final String logoUrl;
  final List<GiftcardRegionEntity> _regions;
  @override
  List<GiftcardRegionEntity> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  @override
  String toString() {
    return 'SellGiftcardRateEntity(id: $id, type: $type, logoUrl: $logoUrl, regions: $regions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellGiftcardRateEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            const DeepCollectionEquality().equals(other._regions, _regions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, type, logoUrl,
      const DeepCollectionEquality().hash(_regions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellGiftcardRateEntityImplCopyWith<_$SellGiftcardRateEntityImpl>
      get copyWith => __$$SellGiftcardRateEntityImplCopyWithImpl<
          _$SellGiftcardRateEntityImpl>(this, _$identity);
}

abstract class _SellGiftcardRateEntity implements SellGiftcardRateEntity {
  const factory _SellGiftcardRateEntity(
          {required final String id,
          required final String type,
          required final String logoUrl,
          required final List<GiftcardRegionEntity> regions}) =
      _$SellGiftcardRateEntityImpl;

  @override
  String get id;
  @override
  String get type;
  @override
  String get logoUrl;
  @override
  List<GiftcardRegionEntity> get regions;
  @override
  @JsonKey(ignore: true)
  _$$SellGiftcardRateEntityImplCopyWith<_$SellGiftcardRateEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
