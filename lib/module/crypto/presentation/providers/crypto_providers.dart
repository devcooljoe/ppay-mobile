import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/domain/usecases/crypto_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crypto_providers.g.dart';

@riverpod
class GetCryptoRates extends _$GetCryptoRates {
  @override
  AsyncValue<List<CryptoRateEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetCryptoRatesUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (rates) => AsyncValue.data(rates),
    );
  }
}

@riverpod
class GetEstimatedAssetValue extends _$GetEstimatedAssetValue {
  @override
  AsyncValue<EstimatedAssetValueEntity?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetEstimatedAssetValueUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (value) => AsyncValue.data(value),
    );
  }
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
      (wallet) => AsyncValue.data(wallet),
    );
  }
}

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
