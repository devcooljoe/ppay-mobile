import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/name_enquiry_entity.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/wallet_entity.dart';
import 'package:ppay_mobile/module/transaction/domain/usecases/get_wallet_usecase.dart';
import 'package:ppay_mobile/module/transaction/domain/usecases/name_enquiry_usecase.dart';
import 'package:ppay_mobile/module/transaction/domain/usecases/withdraw_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_providers.g.dart';

@riverpod
class GetWallet extends _$GetWallet {
  @override
  AsyncValue<WalletEntity?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetWalletUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (wallet) => AsyncValue.data(wallet),
    );
  }
}

@riverpod
class NameEnquiry extends _$NameEnquiry {
  @override
  AsyncValue<NameEnquiryEntity?> build() => const AsyncValue.data(null);

  Future<void> call({
    required String accountNumber,
    required String bankCode,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<NameEnquiryUseCase>()(
      accountNumber: accountNumber,
      bankCode: bankCode,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (nameEnquiry) => AsyncValue.data(nameEnquiry),
    );
  }
}

@riverpod
class Withdraw extends _$Withdraw {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required double amount,
    required String accountNumber,
    required String accountName,
    required String bankCode,
    required String bankName,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<WithdrawUseCase>()(
      amount: amount,
      accountNumber: accountNumber,
      accountName: accountName,
      bankCode: bankCode,
      bankName: bankName,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}
