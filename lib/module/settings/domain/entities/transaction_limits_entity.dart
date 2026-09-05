import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_limits_entity.freezed.dart';

@freezed
class TierLimitEntity with _$TierLimitEntity {
  const factory TierLimitEntity({
    required int tier,
    // null means unlimited for that dimension.
    double? singleLimit,
    double? dailyLimit,
    double? monthlyLimit,
  }) = _TierLimitEntity;
}

@freezed
class TransactionLimitsEntity with _$TransactionLimitsEntity {
  const factory TransactionLimitsEntity({
    required int currentTier,
    required double dailySpent,
    required double monthlySpent,
    required List<TierLimitEntity> tiers,
  }) = _TransactionLimitsEntity;
}
