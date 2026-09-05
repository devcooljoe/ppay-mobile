// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_limits_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TierLimitEntity {
  int get tier =>
      throw _privateConstructorUsedError; // null means unlimited for that dimension.
  double? get singleLimit => throw _privateConstructorUsedError;
  double? get dailyLimit => throw _privateConstructorUsedError;
  double? get monthlyLimit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TierLimitEntityCopyWith<TierLimitEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TierLimitEntityCopyWith<$Res> {
  factory $TierLimitEntityCopyWith(
          TierLimitEntity value, $Res Function(TierLimitEntity) then) =
      _$TierLimitEntityCopyWithImpl<$Res, TierLimitEntity>;
  @useResult
  $Res call(
      {int tier,
      double? singleLimit,
      double? dailyLimit,
      double? monthlyLimit});
}

/// @nodoc
class _$TierLimitEntityCopyWithImpl<$Res, $Val extends TierLimitEntity>
    implements $TierLimitEntityCopyWith<$Res> {
  _$TierLimitEntityCopyWithImpl(this._value, this._then);

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
              as double?,
      dailyLimit: freezed == dailyLimit
          ? _value.dailyLimit
          : dailyLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      monthlyLimit: freezed == monthlyLimit
          ? _value.monthlyLimit
          : monthlyLimit // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TierLimitEntityImplCopyWith<$Res>
    implements $TierLimitEntityCopyWith<$Res> {
  factory _$$TierLimitEntityImplCopyWith(_$TierLimitEntityImpl value,
          $Res Function(_$TierLimitEntityImpl) then) =
      __$$TierLimitEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int tier,
      double? singleLimit,
      double? dailyLimit,
      double? monthlyLimit});
}

/// @nodoc
class __$$TierLimitEntityImplCopyWithImpl<$Res>
    extends _$TierLimitEntityCopyWithImpl<$Res, _$TierLimitEntityImpl>
    implements _$$TierLimitEntityImplCopyWith<$Res> {
  __$$TierLimitEntityImplCopyWithImpl(
      _$TierLimitEntityImpl _value, $Res Function(_$TierLimitEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tier = null,
    Object? singleLimit = freezed,
    Object? dailyLimit = freezed,
    Object? monthlyLimit = freezed,
  }) {
    return _then(_$TierLimitEntityImpl(
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int,
      singleLimit: freezed == singleLimit
          ? _value.singleLimit
          : singleLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      dailyLimit: freezed == dailyLimit
          ? _value.dailyLimit
          : dailyLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      monthlyLimit: freezed == monthlyLimit
          ? _value.monthlyLimit
          : monthlyLimit // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$TierLimitEntityImpl implements _TierLimitEntity {
  const _$TierLimitEntityImpl(
      {required this.tier,
      this.singleLimit,
      this.dailyLimit,
      this.monthlyLimit});

  @override
  final int tier;
// null means unlimited for that dimension.
  @override
  final double? singleLimit;
  @override
  final double? dailyLimit;
  @override
  final double? monthlyLimit;

  @override
  String toString() {
    return 'TierLimitEntity(tier: $tier, singleLimit: $singleLimit, dailyLimit: $dailyLimit, monthlyLimit: $monthlyLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TierLimitEntityImpl &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.singleLimit, singleLimit) ||
                other.singleLimit == singleLimit) &&
            (identical(other.dailyLimit, dailyLimit) ||
                other.dailyLimit == dailyLimit) &&
            (identical(other.monthlyLimit, monthlyLimit) ||
                other.monthlyLimit == monthlyLimit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tier, singleLimit, dailyLimit, monthlyLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TierLimitEntityImplCopyWith<_$TierLimitEntityImpl> get copyWith =>
      __$$TierLimitEntityImplCopyWithImpl<_$TierLimitEntityImpl>(
          this, _$identity);
}

abstract class _TierLimitEntity implements TierLimitEntity {
  const factory _TierLimitEntity(
      {required final int tier,
      final double? singleLimit,
      final double? dailyLimit,
      final double? monthlyLimit}) = _$TierLimitEntityImpl;

  @override
  int get tier;
  @override // null means unlimited for that dimension.
  double? get singleLimit;
  @override
  double? get dailyLimit;
  @override
  double? get monthlyLimit;
  @override
  @JsonKey(ignore: true)
  _$$TierLimitEntityImplCopyWith<_$TierLimitEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionLimitsEntity {
  int get currentTier => throw _privateConstructorUsedError;
  double get dailySpent => throw _privateConstructorUsedError;
  double get monthlySpent => throw _privateConstructorUsedError;
  List<TierLimitEntity> get tiers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionLimitsEntityCopyWith<TransactionLimitsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionLimitsEntityCopyWith<$Res> {
  factory $TransactionLimitsEntityCopyWith(TransactionLimitsEntity value,
          $Res Function(TransactionLimitsEntity) then) =
      _$TransactionLimitsEntityCopyWithImpl<$Res, TransactionLimitsEntity>;
  @useResult
  $Res call(
      {int currentTier,
      double dailySpent,
      double monthlySpent,
      List<TierLimitEntity> tiers});
}

/// @nodoc
class _$TransactionLimitsEntityCopyWithImpl<$Res,
        $Val extends TransactionLimitsEntity>
    implements $TransactionLimitsEntityCopyWith<$Res> {
  _$TransactionLimitsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTier = null,
    Object? dailySpent = null,
    Object? monthlySpent = null,
    Object? tiers = null,
  }) {
    return _then(_value.copyWith(
      currentTier: null == currentTier
          ? _value.currentTier
          : currentTier // ignore: cast_nullable_to_non_nullable
              as int,
      dailySpent: null == dailySpent
          ? _value.dailySpent
          : dailySpent // ignore: cast_nullable_to_non_nullable
              as double,
      monthlySpent: null == monthlySpent
          ? _value.monthlySpent
          : monthlySpent // ignore: cast_nullable_to_non_nullable
              as double,
      tiers: null == tiers
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<TierLimitEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionLimitsEntityImplCopyWith<$Res>
    implements $TransactionLimitsEntityCopyWith<$Res> {
  factory _$$TransactionLimitsEntityImplCopyWith(
          _$TransactionLimitsEntityImpl value,
          $Res Function(_$TransactionLimitsEntityImpl) then) =
      __$$TransactionLimitsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentTier,
      double dailySpent,
      double monthlySpent,
      List<TierLimitEntity> tiers});
}

/// @nodoc
class __$$TransactionLimitsEntityImplCopyWithImpl<$Res>
    extends _$TransactionLimitsEntityCopyWithImpl<$Res,
        _$TransactionLimitsEntityImpl>
    implements _$$TransactionLimitsEntityImplCopyWith<$Res> {
  __$$TransactionLimitsEntityImplCopyWithImpl(
      _$TransactionLimitsEntityImpl _value,
      $Res Function(_$TransactionLimitsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTier = null,
    Object? dailySpent = null,
    Object? monthlySpent = null,
    Object? tiers = null,
  }) {
    return _then(_$TransactionLimitsEntityImpl(
      currentTier: null == currentTier
          ? _value.currentTier
          : currentTier // ignore: cast_nullable_to_non_nullable
              as int,
      dailySpent: null == dailySpent
          ? _value.dailySpent
          : dailySpent // ignore: cast_nullable_to_non_nullable
              as double,
      monthlySpent: null == monthlySpent
          ? _value.monthlySpent
          : monthlySpent // ignore: cast_nullable_to_non_nullable
              as double,
      tiers: null == tiers
          ? _value._tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as List<TierLimitEntity>,
    ));
  }
}

/// @nodoc

class _$TransactionLimitsEntityImpl implements _TransactionLimitsEntity {
  const _$TransactionLimitsEntityImpl(
      {required this.currentTier,
      required this.dailySpent,
      required this.monthlySpent,
      required final List<TierLimitEntity> tiers})
      : _tiers = tiers;

  @override
  final int currentTier;
  @override
  final double dailySpent;
  @override
  final double monthlySpent;
  final List<TierLimitEntity> _tiers;
  @override
  List<TierLimitEntity> get tiers {
    if (_tiers is EqualUnmodifiableListView) return _tiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiers);
  }

  @override
  String toString() {
    return 'TransactionLimitsEntity(currentTier: $currentTier, dailySpent: $dailySpent, monthlySpent: $monthlySpent, tiers: $tiers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionLimitsEntityImpl &&
            (identical(other.currentTier, currentTier) ||
                other.currentTier == currentTier) &&
            (identical(other.dailySpent, dailySpent) ||
                other.dailySpent == dailySpent) &&
            (identical(other.monthlySpent, monthlySpent) ||
                other.monthlySpent == monthlySpent) &&
            const DeepCollectionEquality().equals(other._tiers, _tiers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentTier, dailySpent,
      monthlySpent, const DeepCollectionEquality().hash(_tiers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionLimitsEntityImplCopyWith<_$TransactionLimitsEntityImpl>
      get copyWith => __$$TransactionLimitsEntityImplCopyWithImpl<
          _$TransactionLimitsEntityImpl>(this, _$identity);
}

abstract class _TransactionLimitsEntity implements TransactionLimitsEntity {
  const factory _TransactionLimitsEntity(
          {required final int currentTier,
          required final double dailySpent,
          required final double monthlySpent,
          required final List<TierLimitEntity> tiers}) =
      _$TransactionLimitsEntityImpl;

  @override
  int get currentTier;
  @override
  double get dailySpent;
  @override
  double get monthlySpent;
  @override
  List<TierLimitEntity> get tiers;
  @override
  @JsonKey(ignore: true)
  _$$TransactionLimitsEntityImplCopyWith<_$TransactionLimitsEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
