// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_limit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TierLimitModel _$TierLimitModelFromJson(Map<String, dynamic> json) {
  return _TierLimitModel.fromJson(json);
}

/// @nodoc
mixin _$TierLimitModel {
  int get tier => throw _privateConstructorUsedError;
  String? get singleLimit => throw _privateConstructorUsedError;
  String? get dailyLimit => throw _privateConstructorUsedError;
  String? get monthlyLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TierLimitModelCopyWith<TierLimitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TierLimitModelCopyWith<$Res> {
  factory $TierLimitModelCopyWith(
          TierLimitModel value, $Res Function(TierLimitModel) then) =
      _$TierLimitModelCopyWithImpl<$Res, TierLimitModel>;
  @useResult
  $Res call(
      {int tier,
      String? singleLimit,
      String? dailyLimit,
      String? monthlyLimit});
}

/// @nodoc
class _$TierLimitModelCopyWithImpl<$Res, $Val extends TierLimitModel>
    implements $TierLimitModelCopyWith<$Res> {
  _$TierLimitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tier = null,
    Object? singleLimit = freezed,
    Object? dailyLimit = freezed,
    Object? monthlyLimit = freezed,
  }) {
    return _then(_value.copyWith(
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int,
      singleLimit: freezed == singleLimit
          ? _value.singleLimit
          : singleLimit // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyLimit: freezed == dailyLimit
          ? _value.dailyLimit
          : dailyLimit // ignore: cast_nullable_to_non_nullable
              as String?,
      monthlyLimit: freezed == monthlyLimit
          ? _value.monthlyLimit
          : monthlyLimit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TierLimitModelImplCopyWith<$Res>
    implements $TierLimitModelCopyWith<$Res> {
  factory _$$TierLimitModelImplCopyWith(_$TierLimitModelImpl value,
          $Res Function(_$TierLimitModelImpl) then) =
      __$$TierLimitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int tier,
      String? singleLimit,
      String? dailyLimit,
      String? monthlyLimit});
}

/// @nodoc
class __$$TierLimitModelImplCopyWithImpl<$Res>
    extends _$TierLimitModelCopyWithImpl<$Res, _$TierLimitModelImpl>
    implements _$$TierLimitModelImplCopyWith<$Res> {
  __$$TierLimitModelImplCopyWithImpl(
      _$TierLimitModelImpl _value, $Res Function(_$TierLimitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tier = null,
    Object? singleLimit = freezed,
    Object? dailyLimit = freezed,
    Object? monthlyLimit = freezed,
  }) {
    return _then(_$TierLimitModelImpl(
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int,
      singleLimit: freezed == singleLimit
          ? _value.singleLimit
          : singleLimit // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyLimit: freezed == dailyLimit
          ? _value.dailyLimit
          : dailyLimit // ignore: cast_nullable_to_non_nullable
              as String?,
      monthlyLimit: freezed == monthlyLimit
          ? _value.monthlyLimit
          : monthlyLimit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TierLimitModelImpl extends _TierLimitModel {
  const _$TierLimitModelImpl(
      {this.tier = 0, this.singleLimit, this.dailyLimit, this.monthlyLimit})
      : super._();

  factory _$TierLimitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TierLimitModelImplFromJson(json);

  @override
  @JsonKey()
  final int tier;
  @override
  final String? singleLimit;
  @override
  final String? dailyLimit;
  @override
  final String? monthlyLimit;

  @override
  String toString() {
    return 'TierLimitModel(tier: $tier, singleLimit: $singleLimit, dailyLimit: $dailyLimit, monthlyLimit: $monthlyLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TierLimitModelImpl &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.singleLimit, singleLimit) ||
                other.singleLimit == singleLimit) &&
            (identical(other.dailyLimit, dailyLimit) ||
                other.dailyLimit == dailyLimit) &&
            (identical(other.monthlyLimit, monthlyLimit) ||
                other.monthlyLimit == monthlyLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tier, singleLimit, dailyLimit, monthlyLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TierLimitModelImplCopyWith<_$TierLimitModelImpl> get copyWith =>
      __$$TierLimitModelImplCopyWithImpl<_$TierLimitModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TierLimitModelImplToJson(
      this,
    );
  }
}

abstract class _TierLimitModel extends TierLimitModel {
  const factory _TierLimitModel(
      {final int tier,
      final String? singleLimit,
      final String? dailyLimit,
      final String? monthlyLimit}) = _$TierLimitModelImpl;
  const _TierLimitModel._() : super._();

  factory _TierLimitModel.fromJson(Map<String, dynamic> json) =
      _$TierLimitModelImpl.fromJson;

  @override
  int get tier;
  @override
  String? get singleLimit;
  @override
  String? get dailyLimit;
  @override
  String? get monthlyLimit;
  @override
  @JsonKey(ignore: true)
  _$$TierLimitModelImplCopyWith<_$TierLimitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionLimitsUsageModel _$TransactionLimitsUsageModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionLimitsUsageModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionLimitsUsageModel {
  String get dailySpent => throw _privateConstructorUsedError;
  String get monthlySpent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionLimitsUsageModelCopyWith<TransactionLimitsUsageModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionLimitsUsageModelCopyWith<$Res> {
  factory $TransactionLimitsUsageModelCopyWith(
          TransactionLimitsUsageModel value,
          $Res Function(TransactionLimitsUsageModel) then) =
      _$TransactionLimitsUsageModelCopyWithImpl<$Res,
          TransactionLimitsUsageModel>;
  @useResult
  $Res call({String dailySpent, String monthlySpent});
}

/// @nodoc
class _$TransactionLimitsUsageModelCopyWithImpl<$Res,
        $Val extends TransactionLimitsUsageModel>
    implements $TransactionLimitsUsageModelCopyWith<$Res> {
  _$TransactionLimitsUsageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailySpent = null,
    Object? monthlySpent = null,
  }) {
    return _then(_value.copyWith(
      dailySpent: null == dailySpent
          ? _value.dailySpent
          : dailySpent // ignore: cast_nullable_to_non_nullable
              as String,
      monthlySpent: null == monthlySpent
          ? _value.monthlySpent
          : monthlySpent // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionLimitsUsageModelImplCopyWith<$Res>
    implements $TransactionLimitsUsageModelCopyWith<$Res> {
  factory _$$TransactionLimitsUsageModelImplCopyWith(
          _$TransactionLimitsUsageModelImpl value,
          $Res Function(_$TransactionLimitsUsageModelImpl) then) =
      __$$TransactionLimitsUsageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dailySpent, String monthlySpent});
}

/// @nodoc
class __$$TransactionLimitsUsageModelImplCopyWithImpl<$Res>
    extends _$TransactionLimitsUsageModelCopyWithImpl<$Res,
        _$TransactionLimitsUsageModelImpl>
    implements _$$TransactionLimitsUsageModelImplCopyWith<$Res> {
  __$$TransactionLimitsUsageModelImplCopyWithImpl(
      _$TransactionLimitsUsageModelImpl _value,
      $Res Function(_$TransactionLimitsUsageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailySpent = null,
    Object? monthlySpent = null,
  }) {
    return _then(_$TransactionLimitsUsageModelImpl(
      dailySpent: null == dailySpent
          ? _value.dailySpent
          : dailySpent // ignore: cast_nullable_to_non_nullable
              as String,
      monthlySpent: null == monthlySpent
          ? _value.monthlySpent
          : monthlySpent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionLimitsUsageModelImpl
    implements _TransactionLimitsUsageModel {
  const _$TransactionLimitsUsageModelImpl(
      {this.dailySpent = '0', this.monthlySpent = '0'});

  factory _$TransactionLimitsUsageModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TransactionLimitsUsageModelImplFromJson(json);

  @override
  @JsonKey()
  final String dailySpent;
  @override
  @JsonKey()
  final String monthlySpent;

  @override
  String toString() {
    return 'TransactionLimitsUsageModel(dailySpent: $dailySpent, monthlySpent: $monthlySpent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionLimitsUsageModelImpl &&
            (identical(other.dailySpent, dailySpent) ||
                other.dailySpent == dailySpent) &&
            (identical(other.monthlySpent, monthlySpent) ||
                other.monthlySpent == monthlySpent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dailySpent, monthlySpent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionLimitsUsageModelImplCopyWith<_$TransactionLimitsUsageModelImpl>
      get copyWith => __$$TransactionLimitsUsageModelImplCopyWithImpl<
          _$TransactionLimitsUsageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionLimitsUsageModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionLimitsUsageModel
    implements TransactionLimitsUsageModel {
  const factory _TransactionLimitsUsageModel(
      {final String dailySpent,
      final String monthlySpent}) = _$TransactionLimitsUsageModelImpl;

  factory _TransactionLimitsUsageModel.fromJson(Map<String, dynamic> json) =
      _$TransactionLimitsUsageModelImpl.fromJson;

  @override
  String get dailySpent;
  @override
  String get monthlySpent;
  @override
  @JsonKey(ignore: true)
  _$$TransactionLimitsUsageModelImplCopyWith<_$TransactionLimitsUsageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TransactionLimitsModel _$TransactionLimitsModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionLimitsModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionLimitsModel {
  int get currentTier => throw _privateConstructorUsedError;
  TransactionLimitsUsageModel? get usage => throw _privateConstructorUsedError;
  List<TierLimitModel> get tiers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionLimitsModelCopyWith<TransactionLimitsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionLimitsModelCopyWith<$Res> {
  factory $TransactionLimitsModelCopyWith(TransactionLimitsModel value,
          $Res Function(TransactionLimitsModel) then) =
      _$TransactionLimitsModelCopyWithImpl<$Res, TransactionLimitsModel>;
  @useResult
  $Res call(
      {int currentTier,
      TransactionLimitsUsageModel? usage,
      List<TierLimitModel> tiers});

  $TransactionLimitsUsageModelCopyWith<$Res>? get usage;
}

/// @nodoc
class _$TransactionLimitsModelCopyWithImpl<$Res,
        $Val extends TransactionLimitsModel>
    implements $TransactionLimitsModelCopyWith<$Res> {
  _$TransactionLimitsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTier = null,
    Object? usage = freezed,
    Object? tiers = null,
  }) {
    return _then(_value.copyWith(
      currentTier: null == currentTier
          ? _value.currentTier
          : currentTier // ignore: cast_nullable_to_non_nullable
              as int,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as TransactionLimitsUsageModel?,
      tiers: null == tiers
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<TierLimitModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionLimitsUsageModelCopyWith<$Res>? get usage {
    if (_value.usage == null) {
      return null;
    }

    return $TransactionLimitsUsageModelCopyWith<$Res>(_value.usage!, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionLimitsModelImplCopyWith<$Res>
    implements $TransactionLimitsModelCopyWith<$Res> {
  factory _$$TransactionLimitsModelImplCopyWith(
          _$TransactionLimitsModelImpl value,
          $Res Function(_$TransactionLimitsModelImpl) then) =
      __$$TransactionLimitsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentTier,
      TransactionLimitsUsageModel? usage,
      List<TierLimitModel> tiers});

  @override
  $TransactionLimitsUsageModelCopyWith<$Res>? get usage;
}

/// @nodoc
class __$$TransactionLimitsModelImplCopyWithImpl<$Res>
    extends _$TransactionLimitsModelCopyWithImpl<$Res,
        _$TransactionLimitsModelImpl>
    implements _$$TransactionLimitsModelImplCopyWith<$Res> {
  __$$TransactionLimitsModelImplCopyWithImpl(
      _$TransactionLimitsModelImpl _value,
      $Res Function(_$TransactionLimitsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTier = null,
    Object? usage = freezed,
    Object? tiers = null,
  }) {
    return _then(_$TransactionLimitsModelImpl(
      currentTier: null == currentTier
          ? _value.currentTier
          : currentTier // ignore: cast_nullable_to_non_nullable
              as int,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as TransactionLimitsUsageModel?,
      tiers: null == tiers
          ? _value._tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<TierLimitModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionLimitsModelImpl extends _TransactionLimitsModel {
  const _$TransactionLimitsModelImpl(
      {this.currentTier = 0,
      this.usage,
      final List<TierLimitModel> tiers = const <TierLimitModel>[]})
      : _tiers = tiers,
        super._();

  factory _$TransactionLimitsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionLimitsModelImplFromJson(json);

  @override
  @JsonKey()
  final int currentTier;
  @override
  final TransactionLimitsUsageModel? usage;
  final List<TierLimitModel> _tiers;
  @override
  @JsonKey()
  List<TierLimitModel> get tiers {
    if (_tiers is EqualUnmodifiableListView) return _tiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiers);
  }

  @override
  String toString() {
    return 'TransactionLimitsModel(currentTier: $currentTier, usage: $usage, tiers: $tiers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionLimitsModelImpl &&
            (identical(other.currentTier, currentTier) ||
                other.currentTier == currentTier) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            const DeepCollectionEquality().equals(other._tiers, _tiers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentTier, usage,
      const DeepCollectionEquality().hash(_tiers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionLimitsModelImplCopyWith<_$TransactionLimitsModelImpl>
      get copyWith => __$$TransactionLimitsModelImplCopyWithImpl<
          _$TransactionLimitsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionLimitsModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionLimitsModel extends TransactionLimitsModel {
  const factory _TransactionLimitsModel(
      {final int currentTier,
      final TransactionLimitsUsageModel? usage,
      final List<TierLimitModel> tiers}) = _$TransactionLimitsModelImpl;
  const _TransactionLimitsModel._() : super._();

  factory _TransactionLimitsModel.fromJson(Map<String, dynamic> json) =
      _$TransactionLimitsModelImpl.fromJson;

  @override
  int get currentTier;
  @override
  TransactionLimitsUsageModel? get usage;
  @override
  List<TierLimitModel> get tiers;
  @override
  @JsonKey(ignore: true)
  _$$TransactionLimitsModelImplCopyWith<_$TransactionLimitsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
