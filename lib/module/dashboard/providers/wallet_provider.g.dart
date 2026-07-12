// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walletHash() => r'6687f8c99f3deed0be9fd84ff71d1b9c92bc126b';

/// See also [Wallet].
@ProviderFor(Wallet)
final walletProvider =
    NotifierProvider<Wallet, AsyncValue<WalletEntity?>>.internal(
  Wallet.new,
  name: r'walletProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$walletHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Wallet = Notifier<AsyncValue<WalletEntity?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
