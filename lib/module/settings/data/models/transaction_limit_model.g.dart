// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_limit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TierLimitModelImpl _$$TierLimitModelImplFromJson(Map<String, dynamic> json) =>
    _$TierLimitModelImpl(
      tier: (json['tier'] as num?)?.toInt() ?? 0,
      singleLimit: json['singleLimit'] as String?,
      dailyLimit: json['dailyLimit'] as String?,
      monthlyLimit: json['monthlyLimit'] as String?,
    );

Map<String, dynamic> _$$TierLimitModelImplToJson(
        _$TierLimitModelImpl instance) =>
    <String, dynamic>{
      'tier': instance.tier,
      'singleLimit': instance.singleLimit,
      'dailyLimit': instance.dailyLimit,
      'monthlyLimit': instance.monthlyLimit,
    };

_$TransactionLimitsUsageModelImpl _$$TransactionLimitsUsageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionLimitsUsageModelImpl(
      dailySpent: json['dailySpent'] as String? ?? '0',
      monthlySpent: json['monthlySpent'] as String? ?? '0',
    );

Map<String, dynamic> _$$TransactionLimitsUsageModelImplToJson(
        _$TransactionLimitsUsageModelImpl instance) =>
    <String, dynamic>{
      'dailySpent': instance.dailySpent,
      'monthlySpent': instance.monthlySpent,
    };

_$TransactionLimitsModelImpl _$$TransactionLimitsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionLimitsModelImpl(
      currentTier: (json['currentTier'] as num?)?.toInt() ?? 0,
      usage: json['usage'] == null
          ? null
          : TransactionLimitsUsageModel.fromJson(
              json['usage'] as Map<String, dynamic>),
      tiers: (json['tiers'] as List<dynamic>?)
              ?.map((e) => TierLimitModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TierLimitModel>[],
    );

Map<String, dynamic> _$$TransactionLimitsModelImplToJson(
        _$TransactionLimitsModelImpl instance) =>
    <String, dynamic>{
      'currentTier': instance.currentTier,
      'usage': instance.usage,
      'tiers': instance.tiers,
    };
