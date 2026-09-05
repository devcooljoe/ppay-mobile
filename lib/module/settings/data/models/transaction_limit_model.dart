import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/settings/domain/entities/transaction_limits_entity.dart';

part 'transaction_limit_model.freezed.dart';
part 'transaction_limit_model.g.dart';

@freezed
class TierLimitModel with _$TierLimitModel {
  const factory TierLimitModel({
    @Default(0) int tier,
    String? singleLimit,
    String? dailyLimit,
    String? monthlyLimit,
  }) = _TierLimitModel;

  const TierLimitModel._();

  factory TierLimitModel.fromJson(Map<String, dynamic> json) => _$TierLimitModelFromJson(json);

  TierLimitEntity toEntity() => TierLimitEntity(
    tier: tier,
    singleLimit: _toDouble(singleLimit),
    dailyLimit: _toDouble(dailyLimit),
    monthlyLimit: _toDouble(monthlyLimit),
  );

  // null limit means unlimited.
  static double? _toDouble(String? value) {
    if (value == null) return null;
    return double.tryParse(value);
  }
}

@freezed
class TransactionLimitsUsageModel with _$TransactionLimitsUsageModel {
  const factory TransactionLimitsUsageModel({
    @Default('0') String dailySpent,
    @Default('0') String monthlySpent,
  }) = _TransactionLimitsUsageModel;

  factory TransactionLimitsUsageModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionLimitsUsageModelFromJson(json);
}

@freezed
class TransactionLimitsModel with _$TransactionLimitsModel {
  const factory TransactionLimitsModel({
    @Default(0) int currentTier,
    TransactionLimitsUsageModel? usage,
    @Default(<TierLimitModel>[]) List<TierLimitModel> tiers,
  }) = _TransactionLimitsModel;

  const TransactionLimitsModel._();

  factory TransactionLimitsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionLimitsModelFromJson(json);

  TransactionLimitsEntity toEntity() => TransactionLimitsEntity(
    currentTier: currentTier,
    dailySpent: double.tryParse(usage?.dailySpent ?? '0') ?? 0,
    monthlySpent: double.tryParse(usage?.monthlySpent ?? '0') ?? 0,
    tiers: tiers.map((e) => e.toEntity()).toList(),
  );
}
