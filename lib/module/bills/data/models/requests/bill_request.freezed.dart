// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyBillCustomerRequest _$VerifyBillCustomerRequestFromJson(
    Map<String, dynamic> json) {
  return _VerifyBillCustomerRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyBillCustomerRequest {
  String get kudaBillItemIdentifier => throw _privateConstructorUsedError;
  String get customerIdentification => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyBillCustomerRequestCopyWith<VerifyBillCustomerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyBillCustomerRequestCopyWith<$Res> {
  factory $VerifyBillCustomerRequestCopyWith(VerifyBillCustomerRequest value,
          $Res Function(VerifyBillCustomerRequest) then) =
      _$VerifyBillCustomerRequestCopyWithImpl<$Res, VerifyBillCustomerRequest>;
  @useResult
  $Res call({String kudaBillItemIdentifier, String customerIdentification});
}

/// @nodoc
class _$VerifyBillCustomerRequestCopyWithImpl<$Res,
        $Val extends VerifyBillCustomerRequest>
    implements $VerifyBillCustomerRequestCopyWith<$Res> {
  _$VerifyBillCustomerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kudaBillItemIdentifier = null,
    Object? customerIdentification = null,
  }) {
    return _then(_value.copyWith(
      kudaBillItemIdentifier: null == kudaBillItemIdentifier
          ? _value.kudaBillItemIdentifier
          : kudaBillItemIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      customerIdentification: null == customerIdentification
          ? _value.customerIdentification
          : customerIdentification // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyBillCustomerRequestImplCopyWith<$Res>
    implements $VerifyBillCustomerRequestCopyWith<$Res> {
  factory _$$VerifyBillCustomerRequestImplCopyWith(
          _$VerifyBillCustomerRequestImpl value,
          $Res Function(_$VerifyBillCustomerRequestImpl) then) =
      __$$VerifyBillCustomerRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String kudaBillItemIdentifier, String customerIdentification});
}

/// @nodoc
class __$$VerifyBillCustomerRequestImplCopyWithImpl<$Res>
    extends _$VerifyBillCustomerRequestCopyWithImpl<$Res,
        _$VerifyBillCustomerRequestImpl>
    implements _$$VerifyBillCustomerRequestImplCopyWith<$Res> {
  __$$VerifyBillCustomerRequestImplCopyWithImpl(
      _$VerifyBillCustomerRequestImpl _value,
      $Res Function(_$VerifyBillCustomerRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kudaBillItemIdentifier = null,
    Object? customerIdentification = null,
  }) {
    return _then(_$VerifyBillCustomerRequestImpl(
      kudaBillItemIdentifier: null == kudaBillItemIdentifier
          ? _value.kudaBillItemIdentifier
          : kudaBillItemIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      customerIdentification: null == customerIdentification
          ? _value.customerIdentification
          : customerIdentification // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyBillCustomerRequestImpl implements _VerifyBillCustomerRequest {
  const _$VerifyBillCustomerRequestImpl(
      {required this.kudaBillItemIdentifier,
      required this.customerIdentification});

  factory _$VerifyBillCustomerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyBillCustomerRequestImplFromJson(json);

  @override
  final String kudaBillItemIdentifier;
  @override
  final String customerIdentification;

  @override
  String toString() {
    return 'VerifyBillCustomerRequest(kudaBillItemIdentifier: $kudaBillItemIdentifier, customerIdentification: $customerIdentification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyBillCustomerRequestImpl &&
            (identical(other.kudaBillItemIdentifier, kudaBillItemIdentifier) ||
                other.kudaBillItemIdentifier == kudaBillItemIdentifier) &&
            (identical(other.customerIdentification, customerIdentification) ||
                other.customerIdentification == customerIdentification));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, kudaBillItemIdentifier, customerIdentification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyBillCustomerRequestImplCopyWith<_$VerifyBillCustomerRequestImpl>
      get copyWith => __$$VerifyBillCustomerRequestImplCopyWithImpl<
          _$VerifyBillCustomerRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyBillCustomerRequestImplToJson(
      this,
    );
  }
}

abstract class _VerifyBillCustomerRequest implements VerifyBillCustomerRequest {
  const factory _VerifyBillCustomerRequest(
          {required final String kudaBillItemIdentifier,
          required final String customerIdentification}) =
      _$VerifyBillCustomerRequestImpl;

  factory _VerifyBillCustomerRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyBillCustomerRequestImpl.fromJson;

  @override
  String get kudaBillItemIdentifier;
  @override
  String get customerIdentification;
  @override
  @JsonKey(ignore: true)
  _$$VerifyBillCustomerRequestImplCopyWith<_$VerifyBillCustomerRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PurchaseBillRequest _$PurchaseBillRequestFromJson(Map<String, dynamic> json) {
  return _PurchaseBillRequest.fromJson(json);
}

/// @nodoc
mixin _$PurchaseBillRequest {
  String get billItemIdentifier => throw _privateConstructorUsedError;
  String get customerIdentifier => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get customerFirstName => throw _privateConstructorUsedError;
  String get billerName => throw _privateConstructorUsedError;
  String get billerCategory => throw _privateConstructorUsedError;
  String? get meterNumber => throw _privateConstructorUsedError;
  String? get plan => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseBillRequestCopyWith<PurchaseBillRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseBillRequestCopyWith<$Res> {
  factory $PurchaseBillRequestCopyWith(
          PurchaseBillRequest value, $Res Function(PurchaseBillRequest) then) =
      _$PurchaseBillRequestCopyWithImpl<$Res, PurchaseBillRequest>;
  @useResult
  $Res call(
      {String billItemIdentifier,
      String customerIdentifier,
      String phoneNumber,
      double amount,
      String customerFirstName,
      String billerName,
      String billerCategory,
      String? meterNumber,
      String? plan,
      String? provider,
      String? logoUrl});
}

/// @nodoc
class _$PurchaseBillRequestCopyWithImpl<$Res, $Val extends PurchaseBillRequest>
    implements $PurchaseBillRequestCopyWith<$Res> {
  _$PurchaseBillRequestCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billItemIdentifier = null,
    Object? customerIdentifier = null,
    Object? phoneNumber = null,
    Object? amount = null,
    Object? customerFirstName = null,
    Object? billerName = null,
    Object? billerCategory = null,
    Object? meterNumber = freezed,
    Object? plan = freezed,
    Object? provider = freezed,
    Object? logoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      billItemIdentifier: null == billItemIdentifier ? _value.billItemIdentifier : billItemIdentifier as String,
      customerIdentifier: null == customerIdentifier ? _value.customerIdentifier : customerIdentifier as String,
      phoneNumber: null == phoneNumber ? _value.phoneNumber : phoneNumber as String,
      amount: null == amount ? _value.amount : amount as double,
      customerFirstName: null == customerFirstName ? _value.customerFirstName : customerFirstName as String,
      billerName: null == billerName ? _value.billerName : billerName as String,
      billerCategory: null == billerCategory ? _value.billerCategory : billerCategory as String,
      meterNumber: freezed == meterNumber ? _value.meterNumber : meterNumber as String?,
      plan: freezed == plan ? _value.plan : plan as String?,
      provider: freezed == provider ? _value.provider : provider as String?,
      logoUrl: freezed == logoUrl ? _value.logoUrl : logoUrl as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseBillRequestImplCopyWith<$Res>
    implements $PurchaseBillRequestCopyWith<$Res> {
  factory _$$PurchaseBillRequestImplCopyWith(_$PurchaseBillRequestImpl value,
          $Res Function(_$PurchaseBillRequestImpl) then) =
      __$$PurchaseBillRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String billItemIdentifier,
      String customerIdentifier,
      String phoneNumber,
      double amount,
      String customerFirstName,
      String billerName,
      String billerCategory,
      String? meterNumber,
      String? plan,
      String? provider,
      String? logoUrl});
}

/// @nodoc
class __$$PurchaseBillRequestImplCopyWithImpl<$Res>
    extends _$PurchaseBillRequestCopyWithImpl<$Res, _$PurchaseBillRequestImpl>
    implements _$$PurchaseBillRequestImplCopyWith<$Res> {
  __$$PurchaseBillRequestImplCopyWithImpl(_$PurchaseBillRequestImpl _value,
      $Res Function(_$PurchaseBillRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billItemIdentifier = null,
    Object? customerIdentifier = null,
    Object? phoneNumber = null,
    Object? amount = null,
    Object? customerFirstName = null,
    Object? billerName = null,
    Object? billerCategory = null,
    Object? meterNumber = freezed,
    Object? plan = freezed,
    Object? provider = freezed,
    Object? logoUrl = freezed,
  }) {
    return _then(_$PurchaseBillRequestImpl(
      billItemIdentifier: null == billItemIdentifier ? _value.billItemIdentifier : billItemIdentifier as String,
      customerIdentifier: null == customerIdentifier ? _value.customerIdentifier : customerIdentifier as String,
      phoneNumber: null == phoneNumber ? _value.phoneNumber : phoneNumber as String,
      amount: null == amount ? _value.amount : amount as double,
      customerFirstName: null == customerFirstName ? _value.customerFirstName : customerFirstName as String,
      billerName: null == billerName ? _value.billerName : billerName as String,
      billerCategory: null == billerCategory ? _value.billerCategory : billerCategory as String,
      meterNumber: freezed == meterNumber ? _value.meterNumber : meterNumber as String?,
      plan: freezed == plan ? _value.plan : plan as String?,
      provider: freezed == provider ? _value.provider : provider as String?,
      logoUrl: freezed == logoUrl ? _value.logoUrl : logoUrl as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseBillRequestImpl implements _PurchaseBillRequest {
  const _$PurchaseBillRequestImpl(
      {required this.billItemIdentifier,
      required this.customerIdentifier,
      required this.phoneNumber,
      required this.amount,
      required this.customerFirstName,
      required this.billerName,
      required this.billerCategory,
      this.meterNumber,
      this.plan,
      this.provider,
      this.logoUrl});

  factory _$PurchaseBillRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseBillRequestImplFromJson(json);

  @override
  final String billItemIdentifier;
  @override
  final String customerIdentifier;
  @override
  final String phoneNumber;
  @override
  final double amount;
  @override
  final String customerFirstName;
  @override
  final String billerName;
  @override
  final String billerCategory;
  @override
  final String? meterNumber;
  @override
  final String? plan;
  @override
  final String? provider;
  @override
  final String? logoUrl;

  @override
  String toString() {
    return 'PurchaseBillRequest(billItemIdentifier: $billItemIdentifier, customerIdentifier: $customerIdentifier, phoneNumber: $phoneNumber, amount: $amount, customerFirstName: $customerFirstName, billerName: $billerName, billerCategory: $billerCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseBillRequestImpl &&
            other.billItemIdentifier == billItemIdentifier &&
            other.customerIdentifier == customerIdentifier &&
            other.phoneNumber == phoneNumber &&
            other.amount == amount &&
            other.customerFirstName == customerFirstName &&
            other.billerName == billerName &&
            other.billerCategory == billerCategory);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, billItemIdentifier,
      customerIdentifier, phoneNumber, amount, customerFirstName, billerName, billerCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseBillRequestImplCopyWith<_$PurchaseBillRequestImpl> get copyWith =>
      __$$PurchaseBillRequestImplCopyWithImpl<_$PurchaseBillRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseBillRequestImplToJson(this);
  }
}

abstract class _PurchaseBillRequest implements PurchaseBillRequest {
  const factory _PurchaseBillRequest(
      {required final String billItemIdentifier,
      required final String customerIdentifier,
      required final String phoneNumber,
      required final double amount,
      required final String customerFirstName,
      required final String billerName,
      required final String billerCategory,
      final String? meterNumber,
      final String? plan,
      final String? provider,
      final String? logoUrl}) = _$PurchaseBillRequestImpl;

  factory _PurchaseBillRequest.fromJson(Map<String, dynamic> json) =
      _$PurchaseBillRequestImpl.fromJson;

  @override
  String get billItemIdentifier;
  @override
  String get customerIdentifier;
  @override
  String get phoneNumber;
  @override
  double get amount;
  @override
  String get customerFirstName;
  @override
  String get billerName;
  @override
  String get billerCategory;
  @override
  String? get meterNumber;
  @override
  String? get plan;
  @override
  String? get provider;
  @override
  String? get logoUrl;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseBillRequestImplCopyWith<_$PurchaseBillRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
