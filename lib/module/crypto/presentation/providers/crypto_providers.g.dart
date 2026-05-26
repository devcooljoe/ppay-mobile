// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCryptoRatesHash() => r'b917386abfc1f095685495f8a1d1c52697545602';

/// See also [GetCryptoRates].
@ProviderFor(GetCryptoRates)
final getCryptoRatesProvider = AutoDisposeNotifierProvider<GetCryptoRates,
    AsyncValue<List<CryptoRateEntity>?>>.internal(
  GetCryptoRates.new,
  name: r'getCryptoRatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCryptoRatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetCryptoRates
    = AutoDisposeNotifier<AsyncValue<List<CryptoRateEntity>?>>;
String _$getEstimatedAssetValueHash() =>
    r'db6b54c52c858fbb886d32d3cd21ce9eb25ba316';

/// See also [GetEstimatedAssetValue].
@ProviderFor(GetEstimatedAssetValue)
final getEstimatedAssetValueProvider = AutoDisposeNotifierProvider<
    GetEstimatedAssetValue, AsyncValue<EstimatedAssetValueEntity?>>.internal(
  GetEstimatedAssetValue.new,
  name: r'getEstimatedAssetValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getEstimatedAssetValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetEstimatedAssetValue
    = AutoDisposeNotifier<AsyncValue<EstimatedAssetValueEntity?>>;
String _$getCryptoWalletHash() => r'8e71954d26b77e76dae397e76056859d38de1e97';

/// See also [GetCryptoWallet].
@ProviderFor(GetCryptoWallet)
final getCryptoWalletProvider = AutoDisposeNotifierProvider<GetCryptoWallet,
    AsyncValue<CryptoWalletEntity?>>.internal(
  GetCryptoWallet.new,
  name: r'getCryptoWalletProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCryptoWalletHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetCryptoWallet
    = AutoDisposeNotifier<AsyncValue<CryptoWalletEntity?>>;
String _$buyCryptoHash() => r'eb7251babeea8f45976072d3d12aa863f084e2a4';

/// See also [BuyCrypto].
@ProviderFor(BuyCrypto)
final buyCryptoProvider =
    AutoDisposeNotifierProvider<BuyCrypto, AsyncValue<void>>.internal(
  BuyCrypto.new,
  name: r'buyCryptoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$buyCryptoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BuyCrypto = AutoDisposeNotifier<AsyncValue<void>>;
String _$sellCryptoHash() => r'7e166860a24906fccbbe22dbcbfd378f3619c625';

/// See also [SellCrypto].
@ProviderFor(SellCrypto)
final sellCryptoProvider =
    AutoDisposeNotifierProvider<SellCrypto, AsyncValue<void>>.internal(
  SellCrypto.new,
  name: r'sellCryptoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sellCryptoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SellCrypto = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
