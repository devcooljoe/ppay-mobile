import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/giftcard/domain/entities/giftcard_entity.dart';
import 'package:ppay_mobile/module/giftcard/domain/usecases/giftcard_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'giftcard_providers.g.dart';

@riverpod
class GetBuyGiftcardRates extends _$GetBuyGiftcardRates {
  @override
  AsyncValue<List<BuyGiftcardRateEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetBuyGiftcardRatesUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (rates) => AsyncValue.data(rates),
    );
  }
}

@riverpod
class GetSellGiftcardRates extends _$GetSellGiftcardRates {
  @override
  AsyncValue<List<SellGiftcardRateEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetSellGiftcardRatesUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (rates) => AsyncValue.data(rates),
    );
  }
}

@riverpod
class BuyGiftcard extends _$BuyGiftcard {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String identifier,
    required String fullName,
    required String email,
    required String phoneNumber,
    required double amountInUSD,
    required double amountInNaira,
    required String title,
    required String region,
    required double rate,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<BuyGiftcardUseCase>()(
      identifier: identifier,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      amountInUSD: amountInUSD,
      amountInNaira: amountInNaira,
      title: title,
      region: region,
      rate: rate,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class SellGiftcard extends _$SellGiftcard {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String type,
    required String country,
    required String subcategoryId,
    required double amount,
    String? ecode,
    List<String>? cardImagePaths,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<SellGiftcardUseCase>()(
      type: type,
      country: country,
      subcategoryId: subcategoryId,
      amount: amount,
      ecode: ecode,
      cardImagePaths: cardImagePaths,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}
