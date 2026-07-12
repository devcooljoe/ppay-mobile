// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getWalletHash() => r'382fbddf9a28e788ef214dc55d860d15c25eb2ac';

/// See also [GetWallet].
@ProviderFor(GetWallet)
final getWalletProvider =
    AutoDisposeNotifierProvider<GetWallet, AsyncValue<WalletEntity?>>.internal(
  GetWallet.new,
  name: r'getWalletProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getWalletHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetWallet = AutoDisposeNotifier<AsyncValue<WalletEntity?>>;
String _$nameEnquiryHash() => r'3a1d489da73d5c1feda4452ee626725e0addc24c';

/// See also [NameEnquiry].
@ProviderFor(NameEnquiry)
final nameEnquiryProvider = AutoDisposeNotifierProvider<NameEnquiry,
    AsyncValue<NameEnquiryEntity?>>.internal(
  NameEnquiry.new,
  name: r'nameEnquiryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nameEnquiryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NameEnquiry = AutoDisposeNotifier<AsyncValue<NameEnquiryEntity?>>;
String _$withdrawHash() => r'913b02fce492c68ed4419401933c501ae3543daf';

/// See also [Withdraw].
@ProviderFor(Withdraw)
final withdrawProvider =
    AutoDisposeNotifierProvider<Withdraw, AsyncValue<void>>.internal(
  Withdraw.new,
  name: r'withdrawProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$withdrawHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Withdraw = AutoDisposeNotifier<AsyncValue<void>>;
String _$getMyTransactionsHash() => r'f93060f865f7fc82769356604aeb6aefb495343e';

/// See also [GetMyTransactions].
@ProviderFor(GetMyTransactions)
final getMyTransactionsProvider = AutoDisposeNotifierProvider<GetMyTransactions,
    AsyncValue<PaginatedTransactionsEntity?>>.internal(
  GetMyTransactions.new,
  name: r'getMyTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMyTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetMyTransactions
    = AutoDisposeNotifier<AsyncValue<PaginatedTransactionsEntity?>>;
String _$calculateFeeHash() => r'a609841b5a111b9cc692717201ef0f51ece6f03a';

/// See also [CalculateFee].
@ProviderFor(CalculateFee)
final calculateFeeProvider =
    AutoDisposeNotifierProvider<CalculateFee, AsyncValue<double?>>.internal(
  CalculateFee.new,
  name: r'calculateFeeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$calculateFeeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CalculateFee = AutoDisposeNotifier<AsyncValue<double?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
