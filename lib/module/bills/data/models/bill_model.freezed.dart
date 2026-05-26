// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BillerModel _$BillerModelFromJson(Map<String, dynamic> json) {
  return _BillerModel.fromJson(json);
}

/// @nodoc
mixin _$BillerModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get billerIconUrl => throw _privateConstructorUsedError;
  String get billTypeId => throw _privateConstructorUsedError;
  List<BillItemModel> get billItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillerModelCopyWith<BillerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillerModelCopyWith<$Res> {
  factory $BillerModelCopyWith(
          BillerModel value, $Res Function(BillerModel) then) =
      _$BillerModelCopyWithImpl<$Res, BillerModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String billerIconUrl,
      String billTypeId,
      List<BillItemModel> billItems});
}

/// @nodoc
class _$BillerModelCopyWithImpl<$Res, $Val extends BillerModel>
    implements $BillerModelCopyWith<$Res> {
  _$BillerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? billerIconUrl = null,
    Object? billTypeId = null,
    Object? billItems = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      billerIconUrl: null == billerIconUrl
          ? _value.billerIconUrl
          : billerIconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      billTypeId: null == billTypeId
          ? _value.billTypeId
          : billTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      billItems: null == billItems
          ? _value.billItems
          : billItems // ignore: cast_nullable_to_non_nullable
              as List<BillItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillerModelImplCopyWith<$Res>
    implements $BillerModelCopyWith<$Res> {
  factory _$$BillerModelImplCopyWith(
          _$BillerModelImpl value, $Res Function(_$BillerModelImpl) then) =
      __$$BillerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String billerIconUrl,
      String billTypeId,
      List<BillItemModel> billItems});
}

/// @nodoc
class __$$BillerModelImplCopyWithImpl<$Res>
    extends _$BillerModelCopyWithImpl<$Res, _$BillerModelImpl>
    implements _$$BillerModelImplCopyWith<$Res> {
  __$$BillerModelImplCopyWithImpl(
      _$BillerModelImpl _value, $Res Function(_$BillerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? billerIconUrl = null,
    Object? billTypeId = null,
    Object? billItems = null,
  }) {
    return _then(_$BillerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      billerIconUrl: null == billerIconUrl
          ? _value.billerIconUrl
          : billerIconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      billTypeId: null == billTypeId
          ? _value.billTypeId
          : billTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      billItems: null == billItems
          ? _value._billItems
          : billItems // ignore: cast_nullable_to_non_nullable
              as List<BillItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillerModelImpl extends _BillerModel {
  const _$BillerModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.billerIconUrl,
      required this.billTypeId,
      required final List<BillItemModel> billItems})
      : _billItems = billItems,
        super._();

  factory _$BillerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String billerIconUrl;
  @override
  final String billTypeId;
  final List<BillItemModel> _billItems;
  @override
  List<BillItemModel> get billItems {
    if (_billItems is EqualUnmodifiableListView) return _billItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billItems);
  }

  @override
  String toString() {
    return 'BillerModel(id: $id, name: $name, description: $description, billerIconUrl: $billerIconUrl, billTypeId: $billTypeId, billItems: $billItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.billerIconUrl, billerIconUrl) ||
                other.billerIconUrl == billerIconUrl) &&
            (identical(other.billTypeId, billTypeId) ||
                other.billTypeId == billTypeId) &&
            const DeepCollectionEquality()
                .equals(other._billItems, _billItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      billerIconUrl,
      billTypeId,
      const DeepCollectionEquality().hash(_billItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillerModelImplCopyWith<_$BillerModelImpl> get copyWith =>
      __$$BillerModelImplCopyWithImpl<_$BillerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillerModelImplToJson(
      this,
    );
  }
}

abstract class _BillerModel extends BillerModel {
  const factory _BillerModel(
      {required final String id,
      required final String name,
      required final String description,
      required final String billerIconUrl,
      required final String billTypeId,
      required final List<BillItemModel> billItems}) = _$BillerModelImpl;
  const _BillerModel._() : super._();

  factory _BillerModel.fromJson(Map<String, dynamic> json) =
      _$BillerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get billerIconUrl;
  @override
  String get billTypeId;
  @override
  List<BillItemModel> get billItems;
  @override
  @JsonKey(ignore: true)
  _$$BillerModelImplCopyWith<_$BillerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BillItemModel _$BillItemModelFromJson(Map<String, dynamic> json) {
  return _BillItemModel.fromJson(json);
}

/// @nodoc
mixin _$BillItemModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get kudaIdentifier => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  bool get isFixedPrice => throw _privateConstructorUsedError;
  String get billerId => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillItemModelCopyWith<BillItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillItemModelCopyWith<$Res> {
  factory $BillItemModelCopyWith(
          BillItemModel value, $Res Function(BillItemModel) then) =
      _$BillItemModelCopyWithImpl<$Res, BillItemModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String kudaIdentifier,
      double amount,
      bool isFixedPrice,
      String billerId,
      bool isActive});
}

/// @nodoc
class _$BillItemModelCopyWithImpl<$Res, $Val extends BillItemModel>
    implements $BillItemModelCopyWith<$Res> {
  _$BillItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? kudaIdentifier = null,
    Object? amount = null,
    Object? isFixedPrice = null,
    Object? billerId = null,
    Object? isActive = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      kudaIdentifier: null == kudaIdentifier
          ? _value.kudaIdentifier
          : kudaIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      isFixedPrice: null == isFixedPrice
          ? _value.isFixedPrice
          : isFixedPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      billerId: null == billerId
          ? _value.billerId
          : billerId // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillItemModelImplCopyWith<$Res>
    implements $BillItemModelCopyWith<$Res> {
  factory _$$BillItemModelImplCopyWith(
          _$BillItemModelImpl value, $Res Function(_$BillItemModelImpl) then) =
      __$$BillItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String kudaIdentifier,
      double amount,
      bool isFixedPrice,
      String billerId,
      bool isActive});
}

/// @nodoc
class __$$BillItemModelImplCopyWithImpl<$Res>
    extends _$BillItemModelCopyWithImpl<$Res, _$BillItemModelImpl>
    implements _$$BillItemModelImplCopyWith<$Res> {
  __$$BillItemModelImplCopyWithImpl(
      _$BillItemModelImpl _value, $Res Function(_$BillItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? kudaIdentifier = null,
    Object? amount = null,
    Object? isFixedPrice = null,
    Object? billerId = null,
    Object? isActive = null,
  }) {
    return _then(_$BillItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      kudaIdentifier: null == kudaIdentifier
          ? _value.kudaIdentifier
          : kudaIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      isFixedPrice: null == isFixedPrice
          ? _value.isFixedPrice
          : isFixedPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      billerId: null == billerId
          ? _value.billerId
          : billerId // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillItemModelImpl extends _BillItemModel {
  const _$BillItemModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.kudaIdentifier,
      required this.amount,
      required this.isFixedPrice,
      required this.billerId,
      required this.isActive})
      : super._();

  factory _$BillItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String kudaIdentifier;
  @override
  final double amount;
  @override
  final bool isFixedPrice;
  @override
  final String billerId;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'BillItemModel(id: $id, name: $name, description: $description, kudaIdentifier: $kudaIdentifier, amount: $amount, isFixedPrice: $isFixedPrice, billerId: $billerId, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.kudaIdentifier, kudaIdentifier) ||
                other.kudaIdentifier == kudaIdentifier) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.isFixedPrice, isFixedPrice) ||
                other.isFixedPrice == isFixedPrice) &&
            (identical(other.billerId, billerId) ||
                other.billerId == billerId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      kudaIdentifier, amount, isFixedPrice, billerId, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillItemModelImplCopyWith<_$BillItemModelImpl> get copyWith =>
      __$$BillItemModelImplCopyWithImpl<_$BillItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillItemModelImplToJson(
      this,
    );
  }
}

abstract class _BillItemModel extends BillItemModel {
  const factory _BillItemModel(
      {required final String id,
      required final String name,
      required final String description,
      required final String kudaIdentifier,
      required final double amount,
      required final bool isFixedPrice,
      required final String billerId,
      required final bool isActive}) = _$BillItemModelImpl;
  const _BillItemModel._() : super._();

  factory _BillItemModel.fromJson(Map<String, dynamic> json) =
      _$BillItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get kudaIdentifier;
  @override
  double get amount;
  @override
  bool get isFixedPrice;
  @override
  String get billerId;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$BillItemModelImplCopyWith<_$BillItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerVerificationModel _$CustomerVerificationModelFromJson(
    Map<String, dynamic> json) {
  return _CustomerVerificationModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerVerificationModel {
  String get customerName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerVerificationModelCopyWith<CustomerVerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerVerificationModelCopyWith<$Res> {
  factory $CustomerVerificationModelCopyWith(CustomerVerificationModel value,
          $Res Function(CustomerVerificationModel) then) =
      _$CustomerVerificationModelCopyWithImpl<$Res, CustomerVerificationModel>;
  @useResult
  $Res call({String customerName});
}

/// @nodoc
class _$CustomerVerificationModelCopyWithImpl<$Res,
        $Val extends CustomerVerificationModel>
    implements $CustomerVerificationModelCopyWith<$Res> {
  _$CustomerVerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
  }) {
    return _then(_value.copyWith(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerVerificationModelImplCopyWith<$Res>
    implements $CustomerVerificationModelCopyWith<$Res> {
  factory _$$CustomerVerificationModelImplCopyWith(
          _$CustomerVerificationModelImpl value,
          $Res Function(_$CustomerVerificationModelImpl) then) =
      __$$CustomerVerificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String customerName});
}

/// @nodoc
class __$$CustomerVerificationModelImplCopyWithImpl<$Res>
    extends _$CustomerVerificationModelCopyWithImpl<$Res,
        _$CustomerVerificationModelImpl>
    implements _$$CustomerVerificationModelImplCopyWith<$Res> {
  __$$CustomerVerificationModelImplCopyWithImpl(
      _$CustomerVerificationModelImpl _value,
      $Res Function(_$CustomerVerificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
  }) {
    return _then(_$CustomerVerificationModelImpl(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerVerificationModelImpl extends _CustomerVerificationModel {
  const _$CustomerVerificationModelImpl({required this.customerName})
      : super._();

  factory _$CustomerVerificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerVerificationModelImplFromJson(json);

  @override
  final String customerName;

  @override
  String toString() {
    return 'CustomerVerificationModel(customerName: $customerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerVerificationModelImpl &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customerName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerVerificationModelImplCopyWith<_$CustomerVerificationModelImpl>
      get copyWith => __$$CustomerVerificationModelImplCopyWithImpl<
          _$CustomerVerificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerVerificationModelImplToJson(
      this,
    );
  }
}

abstract class _CustomerVerificationModel extends CustomerVerificationModel {
  const factory _CustomerVerificationModel(
      {required final String customerName}) = _$CustomerVerificationModelImpl;
  const _CustomerVerificationModel._() : super._();

  factory _CustomerVerificationModel.fromJson(Map<String, dynamic> json) =
      _$CustomerVerificationModelImpl.fromJson;

  @override
  String get customerName;
  @override
  @JsonKey(ignore: true)
  _$$CustomerVerificationModelImplCopyWith<_$CustomerVerificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BillPurchaseModel _$BillPurchaseModelFromJson(Map<String, dynamic> json) {
  return _BillPurchaseModel.fromJson(json);
}

/// @nodoc
mixin _$BillPurchaseModel {
  String get reference => throw _privateConstructorUsedError;
  String? get pin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillPurchaseModelCopyWith<BillPurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillPurchaseModelCopyWith<$Res> {
  factory $BillPurchaseModelCopyWith(
          BillPurchaseModel value, $Res Function(BillPurchaseModel) then) =
      _$BillPurchaseModelCopyWithImpl<$Res, BillPurchaseModel>;
  @useResult
  $Res call({String reference, String? pin});
}

/// @nodoc
class _$BillPurchaseModelCopyWithImpl<$Res, $Val extends BillPurchaseModel>
    implements $BillPurchaseModelCopyWith<$Res> {
  _$BillPurchaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? pin = freezed,
  }) {
    return _then(_value.copyWith(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillPurchaseModelImplCopyWith<$Res>
    implements $BillPurchaseModelCopyWith<$Res> {
  factory _$$BillPurchaseModelImplCopyWith(_$BillPurchaseModelImpl value,
          $Res Function(_$BillPurchaseModelImpl) then) =
      __$$BillPurchaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reference, String? pin});
}

/// @nodoc
class __$$BillPurchaseModelImplCopyWithImpl<$Res>
    extends _$BillPurchaseModelCopyWithImpl<$Res, _$BillPurchaseModelImpl>
    implements _$$BillPurchaseModelImplCopyWith<$Res> {
  __$$BillPurchaseModelImplCopyWithImpl(_$BillPurchaseModelImpl _value,
      $Res Function(_$BillPurchaseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? pin = freezed,
  }) {
    return _then(_$BillPurchaseModelImpl(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillPurchaseModelImpl extends _BillPurchaseModel {
  const _$BillPurchaseModelImpl({required this.reference, this.pin})
      : super._();

  factory _$BillPurchaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillPurchaseModelImplFromJson(json);

  @override
  final String reference;
  @override
  final String? pin;

  @override
  String toString() {
    return 'BillPurchaseModel(reference: $reference, pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillPurchaseModelImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reference, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillPurchaseModelImplCopyWith<_$BillPurchaseModelImpl> get copyWith =>
      __$$BillPurchaseModelImplCopyWithImpl<_$BillPurchaseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillPurchaseModelImplToJson(
      this,
    );
  }
}

abstract class _BillPurchaseModel extends BillPurchaseModel {
  const factory _BillPurchaseModel(
      {required final String reference,
      final String? pin}) = _$BillPurchaseModelImpl;
  const _BillPurchaseModel._() : super._();

  factory _BillPurchaseModel.fromJson(Map<String, dynamic> json) =
      _$BillPurchaseModelImpl.fromJson;

  @override
  String get reference;
  @override
  String? get pin;
  @override
  @JsonKey(ignore: true)
  _$$BillPurchaseModelImplCopyWith<_$BillPurchaseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
