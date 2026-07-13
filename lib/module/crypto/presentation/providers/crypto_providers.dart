import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/services/hive_service.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/domain/usecases/crypto_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crypto_providers.g.dart';

// ─── All rates (unfiltered) ───────────────────────────────────────────────────

@Riverpod(keepAlive: true)
class AllCryptoRates extends _$AllCryptoRates {
  @override
  AsyncValue<List<CryptoRateEntity>> build() => const AsyncValue.data([]);

  Future<List<CryptoRateEntity>> fetch() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetCryptoRatesUseCase>()();
    return result.fold(
      (l) {
        state = AsyncValue.error(l.message, StackTrace.current);
        return [];
      },
      (rates) {
        state = AsyncValue.data(rates);
        return rates;
      },
    );
  }
}

// ─── Filtered rates (respects asset settings) ────────────────────────────────

@Riverpod(keepAlive: true)
class CryptoRates extends _$CryptoRates {
  @override
  AsyncValue<List<CryptoRateEntity>> build() => const AsyncValue.data([]);

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetCryptoRatesUseCase>()();
    result.fold(
      (l) => state = AsyncValue.error(l.message, StackTrace.current),
      (rates) async {
        // Cache in allCryptoRates too
        ref.read(allCryptoRatesProvider.notifier).state = AsyncValue.data(rates);
        await _applyFilter(rates);
      },
    );
  }

  Future<void> refreshLocal() async {
    final all = ref.read(allCryptoRatesProvider).value ?? [];
    await _applyFilter(all);
  }

  Future<void> _applyFilter(List<CryptoRateEntity> rates) async {
    final settings = ref.read(assetSettingsProvider.notifier);
    final filtered = <CryptoRateEntity>[];
    for (final r in rates) {
      if (await settings.isEnabled(r.currency)) filtered.add(r);
    }
    filtered.sort((a, b) => a.name.compareTo(b.name));
    state = AsyncValue.data(filtered);
  }
}

// ─── Estimated asset value ────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
class EstimatedAssetValue extends _$EstimatedAssetValue {
  @override
  AsyncValue<EstimatedAssetValueEntity?> build() => const AsyncValue.data(null);

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetEstimatedAssetValueUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (v) => AsyncValue.data(v),
    );
  }
}

// ─── Wallet address (family: currency + optional network) ────────────────────

@riverpod
Future<CryptoWalletEntity> walletAddress(
  WalletAddressRef ref,
  String currency,
  String? network,
) async {
  final result = await getIt<GetCryptoWalletUseCase>()(currency, network: network);
  return result.fold(
    (l) => throw Exception(l.message),
    (wallet) => wallet,
  );
}

// ─── Buy crypto ───────────────────────────────────────────────────────────────

@riverpod
class BuyCrypto extends _$BuyCrypto {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({required double amount, required String walletAddressId}) async {
    state = const AsyncValue.loading();
    final result = await getIt<BuyCryptoUseCase>()(amount: amount, walletAddressId: walletAddressId);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

// ─── Sell crypto ──────────────────────────────────────────────────────────────

@riverpod
class SellCrypto extends _$SellCrypto {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({required double amount, required String walletAddressId}) async {
    state = const AsyncValue.loading();
    final result = await getIt<SellCryptoUseCase>()(amount: amount, walletAddressId: walletAddressId);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

// ─── Asset settings (Hive-backed toggle) ─────────────────────────────────────

@Riverpod(keepAlive: true)
class AssetSettings extends _$AssetSettings {
  static const _prefix = 'crypto_asset_enabled_';

  @override
  Map<String, bool> build() => {};

  Future<bool> isEnabled(String currency) async {
    final cached = state[currency];
    if (cached != null) return cached;
    final stored = await getIt<HiveService>().get<bool>('$_prefix$currency');
    final enabled = stored ?? true; // default: enabled
    state = {...state, currency: enabled};
    return enabled;
  }

  Future<void> toggleAsset(String currency, bool enabled) async {
    await getIt<HiveService>().put('$_prefix$currency', enabled);
    state = {...state, currency: enabled};
    ref.read(cryptoRatesProvider.notifier).refreshLocal();
  }
}

// ─── Balance visibility ───────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
class BalanceVisibility extends _$BalanceVisibility {
  @override
  bool build() => true;
  void toggle() => state = !state;
}

// ─── Legacy aliases (keep old provider names working during transition) ───────

@riverpod
class GetCryptoRates extends _$GetCryptoRates {
  @override
  AsyncValue<List<CryptoRateEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() => ref.read(cryptoRatesProvider.notifier).refresh();
}

@riverpod
class GetEstimatedAssetValue extends _$GetEstimatedAssetValue {
  @override
  AsyncValue<EstimatedAssetValueEntity?> build() => const AsyncValue.data(null);

  Future<void> call() => ref.read(estimatedAssetValueProvider.notifier).refresh();
}

@riverpod
class GetCryptoWallet extends _$GetCryptoWallet {
  @override
  AsyncValue<CryptoWalletEntity?> build() => const AsyncValue.data(null);

  Future<void> call(String currency, {String? network}) async {
    state = const AsyncValue.loading();
    final result = await getIt<GetCryptoWalletUseCase>()(currency, network: network);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (w) => AsyncValue.data(w),
    );
  }
}
