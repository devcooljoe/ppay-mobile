// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giftcard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getBuyGiftcardRatesHash() =>
    r'0aa0dcce48206d2e5ea078e423ae15ab939ff939';

/// See also [GetBuyGiftcardRates].
@ProviderFor(GetBuyGiftcardRates)
final getBuyGiftcardRatesProvider = AutoDisposeNotifierProvider<
    GetBuyGiftcardRates, AsyncValue<List<BuyGiftcardRateEntity>?>>.internal(
  GetBuyGiftcardRates.new,
  name: r'getBuyGiftcardRatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getBuyGiftcardRatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetBuyGiftcardRates
    = AutoDisposeNotifier<AsyncValue<List<BuyGiftcardRateEntity>?>>;
String _$getSellGiftcardRatesHash() =>
    r'9da8209b5b70b20303304a802839545dd337d2d0';

/// See also [GetSellGiftcardRates].
@ProviderFor(GetSellGiftcardRates)
final getSellGiftcardRatesProvider = AutoDisposeNotifierProvider<
    GetSellGiftcardRates, AsyncValue<List<SellGiftcardRateEntity>?>>.internal(
  GetSellGiftcardRates.new,
  name: r'getSellGiftcardRatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSellGiftcardRatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetSellGiftcardRates
    = AutoDisposeNotifier<AsyncValue<List<SellGiftcardRateEntity>?>>;
String _$buyGiftcardHash() => r'2d428c8a9f1f0437794c6451321eec03edb6d53d';

/// See also [BuyGiftcard].
@ProviderFor(BuyGiftcard)
final buyGiftcardProvider =
    AutoDisposeNotifierProvider<BuyGiftcard, AsyncValue<void>>.internal(
  BuyGiftcard.new,
  name: r'buyGiftcardProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$buyGiftcardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BuyGiftcard = AutoDisposeNotifier<AsyncValue<void>>;
String _$sellGiftcardHash() => r'2577529843cd6e40d4a60f39959a9110ca3c337d';

/// See also [SellGiftcard].
@ProviderFor(SellGiftcard)
final sellGiftcardProvider =
    AutoDisposeNotifierProvider<SellGiftcard, AsyncValue<void>>.internal(
  SellGiftcard.new,
  name: r'sellGiftcardProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sellGiftcardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SellGiftcard = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
