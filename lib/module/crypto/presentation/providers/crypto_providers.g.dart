// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walletAddressHash() => r'77bf72a7ed5ec371b56b10019e3b135b2517d092';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [walletAddress].
@ProviderFor(walletAddress)
const walletAddressProvider = WalletAddressFamily();

/// See also [walletAddress].
class WalletAddressFamily extends Family<AsyncValue<CryptoWalletEntity>> {
  /// See also [walletAddress].
  const WalletAddressFamily();

  /// See also [walletAddress].
  WalletAddressProvider call(
    String currency,
    String? network,
  ) {
    return WalletAddressProvider(
      currency,
      network,
    );
  }

  @override
  WalletAddressProvider getProviderOverride(
    covariant WalletAddressProvider provider,
  ) {
    return call(
      provider.currency,
      provider.network,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'walletAddressProvider';
}

/// See also [walletAddress].
class WalletAddressProvider
    extends AutoDisposeFutureProvider<CryptoWalletEntity> {
  /// See also [walletAddress].
  WalletAddressProvider(
    String currency,
    String? network,
  ) : this._internal(
          (ref) => walletAddress(
            ref as WalletAddressRef,
            currency,
            network,
          ),
          from: walletAddressProvider,
          name: r'walletAddressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$walletAddressHash,
          dependencies: WalletAddressFamily._dependencies,
          allTransitiveDependencies:
              WalletAddressFamily._allTransitiveDependencies,
          currency: currency,
          network: network,
        );

  WalletAddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currency,
    required this.network,
  }) : super.internal();

  final String currency;
  final String? network;

  @override
  Override overrideWith(
    FutureOr<CryptoWalletEntity> Function(WalletAddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WalletAddressProvider._internal(
        (ref) => create(ref as WalletAddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currency: currency,
        network: network,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CryptoWalletEntity> createElement() {
    return _WalletAddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WalletAddressProvider &&
        other.currency == currency &&
        other.network == network;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currency.hashCode);
    hash = _SystemHash.combine(hash, network.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WalletAddressRef on AutoDisposeFutureProviderRef<CryptoWalletEntity> {
  /// The parameter `currency` of this provider.
  String get currency;

  /// The parameter `network` of this provider.
  String? get network;
}

class _WalletAddressProviderElement
    extends AutoDisposeFutureProviderElement<CryptoWalletEntity>
    with WalletAddressRef {
  _WalletAddressProviderElement(super.provider);

  @override
  String get currency => (origin as WalletAddressProvider).currency;
  @override
  String? get network => (origin as WalletAddressProvider).network;
}

String _$allCryptoRatesHash() => r'a1b1e56e6cb171db777d05c57a0dbe91b5b781b9';

/// See also [AllCryptoRates].
@ProviderFor(AllCryptoRates)
final allCryptoRatesProvider = NotifierProvider<AllCryptoRates,
    AsyncValue<List<CryptoRateEntity>>>.internal(
  AllCryptoRates.new,
  name: r'allCryptoRatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allCryptoRatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AllCryptoRates = Notifier<AsyncValue<List<CryptoRateEntity>>>;
String _$cryptoRatesHash() => r'f21508a5c8d3cd64aca78bd05d89e23ce99f2d23';

/// See also [CryptoRates].
@ProviderFor(CryptoRates)
final cryptoRatesProvider =
    NotifierProvider<CryptoRates, AsyncValue<List<CryptoRateEntity>>>.internal(
  CryptoRates.new,
  name: r'cryptoRatesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cryptoRatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CryptoRates = Notifier<AsyncValue<List<CryptoRateEntity>>>;
String _$estimatedAssetValueHash() =>
    r'4caa454bfcd345fec59836a22bd06af1154d2c15';

/// See also [EstimatedAssetValue].
@ProviderFor(EstimatedAssetValue)
final estimatedAssetValueProvider = NotifierProvider<EstimatedAssetValue,
    AsyncValue<EstimatedAssetValueEntity?>>.internal(
  EstimatedAssetValue.new,
  name: r'estimatedAssetValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$estimatedAssetValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EstimatedAssetValue
    = Notifier<AsyncValue<EstimatedAssetValueEntity?>>;
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
String _$assetSettingsHash() => r'59fecc34652af595a5588efebb25a8921834fe44';

/// See also [AssetSettings].
@ProviderFor(AssetSettings)
final assetSettingsProvider =
    NotifierProvider<AssetSettings, Map<String, bool>>.internal(
  AssetSettings.new,
  name: r'assetSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$assetSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AssetSettings = Notifier<Map<String, bool>>;
String _$balanceVisibilityHash() => r'eb69762b5a0bccc0202074737602594a181e89f4';

/// See also [BalanceVisibility].
@ProviderFor(BalanceVisibility)
final balanceVisibilityProvider =
    NotifierProvider<BalanceVisibility, bool>.internal(
  BalanceVisibility.new,
  name: r'balanceVisibilityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$balanceVisibilityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BalanceVisibility = Notifier<bool>;
String _$getCryptoRatesHash() => r'f69e8ba42a9d725692a479c8325db6ae76937cb7';

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
    r'a319fbbc618d2cc67223560e3fec5b3c25899b1f';

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
String _$getCryptoWalletHash() => r'449fc7a59e94d074ec02dce1b96f91b9903698d6';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
