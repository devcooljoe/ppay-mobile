import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_entity.dart';
import 'package:ppay_mobile/module/settings/domain/usecases/bank_account_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_providers.g.dart';

@riverpod
class GetBanks extends _$GetBanks {
  @override
  AsyncValue<List<BankEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetBanksUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (banks) => AsyncValue.data(banks),
    );
  }
}

@riverpod
class GetBankAccounts extends _$GetBankAccounts {
  @override
  AsyncValue<List<BankAccountEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetBankAccountsUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (accounts) => AsyncValue.data(accounts),
    );
  }
}

@riverpod
class UpdateBankAccount extends _$UpdateBankAccount {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String id,
    required String accountName,
    required String accountNumber,
    required String bankName,
    required String bankCode,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<UpdateBankAccountUseCase>()(
      id: id,
      accountName: accountName,
      accountNumber: accountNumber,
      bankName: bankName,
      bankCode: bankCode,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class AddBankAccount extends _$AddBankAccount {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String accountName,
    required String accountNumber,
    required String bankName,
    required String bankCode,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<AddBankAccountUseCase>()(
      accountName: accountName,
      accountNumber: accountNumber,
      bankName: bankName,
      bankCode: bankCode,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class DeleteBankAccount extends _$DeleteBankAccount {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({required String id}) async {
    state = const AsyncValue.loading();
    final result = await getIt<DeleteBankAccountUseCase>()(id: id);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}
