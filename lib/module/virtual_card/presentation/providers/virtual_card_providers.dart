import 'dart:io';

import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_transaction_entity.dart';
import 'package:ppay_mobile/module/virtual_card/domain/usecases/dollar_card_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'virtual_card_providers.g.dart';

@riverpod
class CreateDollarCard extends _$CreateDollarCard {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String street,
    required String city,
    required String cardState,
    required String country,
    required String postalCode,
    required File photo,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<CreateDollarCardUseCase>()(
      street: street,
      city: city,
      state: cardState,
      country: country,
      postalCode: postalCode,
      photo: photo,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class GetDollarCard extends _$GetDollarCard {
  @override
  AsyncValue<DollarCardEntity?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetDollarCardUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (card) => AsyncValue.data(card),
    );
  }
}

@riverpod
class FundDollarCard extends _$FundDollarCard {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({required double amount}) async {
    state = const AsyncValue.loading();
    final result = await getIt<FundDollarCardUseCase>()(amount: amount);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class WithdrawDollarCard extends _$WithdrawDollarCard {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({required double amount}) async {
    state = const AsyncValue.loading();
    final result = await getIt<WithdrawDollarCardUseCase>()(amount: amount);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class GetDollarCardTransactions extends _$GetDollarCardTransactions {
  @override
  AsyncValue<List<DollarCardTransactionEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetDollarCardTransactionsUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (transactions) => AsyncValue.data(transactions),
    );
  }
}

@riverpod
class FreezeDollarCard extends _$FreezeDollarCard {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<FreezeDollarCardUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class UnfreezeDollarCard extends _$UnfreezeDollarCard {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<UnfreezeDollarCardUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class TerminateDollarCard extends _$TerminateDollarCard {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<TerminateDollarCardUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}
