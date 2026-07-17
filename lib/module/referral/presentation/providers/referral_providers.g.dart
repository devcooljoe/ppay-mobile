// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMyReferralsHash() => r'eec30172ad2e4b12ef81a52426ba8248f358ba7f';

/// See also [GetMyReferrals].
@ProviderFor(GetMyReferrals)
final getMyReferralsProvider = AutoDisposeNotifierProvider<GetMyReferrals,
    AsyncValue<ReferralInfoEntity?>>.internal(
  GetMyReferrals.new,
  name: r'getMyReferralsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMyReferralsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetMyReferrals = AutoDisposeNotifier<AsyncValue<ReferralInfoEntity?>>;
String _$withdrawPointsHash() => r'd42165fa92dca3b8284a448a5078412322c3300c';

/// See also [WithdrawPoints].
@ProviderFor(WithdrawPoints)
final withdrawPointsProvider =
    AutoDisposeNotifierProvider<WithdrawPoints, AsyncValue<void>>.internal(
  WithdrawPoints.new,
  name: r'withdrawPointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$withdrawPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WithdrawPoints = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
