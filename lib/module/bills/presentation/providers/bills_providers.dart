import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/module/bills/domain/usecases/bill_payment_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bills_providers.g.dart';

@riverpod
class GetAirtimeBillers extends _$GetAirtimeBillers {
  @override
  AsyncValue<List<BillerEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetAirtimeBillersUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (billers) => AsyncValue.data(billers),
    );
  }
}

@riverpod
class GetDataBillers extends _$GetDataBillers {
  @override
  AsyncValue<List<BillerEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetDataBillersUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (billers) => AsyncValue.data(billers),
    );
  }
}

@riverpod
class GetElectricityBillers extends _$GetElectricityBillers {
  @override
  AsyncValue<List<BillerEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetElectricityBillersUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (billers) => AsyncValue.data(billers),
    );
  }
}

@riverpod
class GetBettingBillers extends _$GetBettingBillers {
  @override
  AsyncValue<List<BillerEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetBettingBillersUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (billers) => AsyncValue.data(billers),
    );
  }
}

@riverpod
class GetTvBillers extends _$GetTvBillers {
  @override
  AsyncValue<List<BillerEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetTvBillersUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (billers) => AsyncValue.data(billers),
    );
  }
}

@riverpod
class VerifyBillCustomer extends _$VerifyBillCustomer {
  @override
  AsyncValue<CustomerVerificationEntity?> build() => const AsyncValue.data(null);

  Future<void> call({
    required String kudaBillItemIdentifier,
    required String customerIdentification,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<VerifyBillCustomerUseCase>()(
      kudaBillItemIdentifier: kudaBillItemIdentifier,
      customerIdentification: customerIdentification,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (verification) => AsyncValue.data(verification),
    );
  }
}

@riverpod
class PurchaseBill extends _$PurchaseBill {
  @override
  AsyncValue<BillPurchaseEntity?> build() => const AsyncValue.data(null);

  Future<void> call({
    required String billItemIdentifier,
    required String customerIdentifier,
    required String phoneNumber,
    required double amount,
    required String customerFirstName,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<PurchaseBillUseCase>()(
      billItemIdentifier: billItemIdentifier,
      customerIdentifier: customerIdentifier,
      phoneNumber: phoneNumber,
      amount: amount,
      customerFirstName: customerFirstName,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (purchase) => AsyncValue.data(purchase),
    );
  }
}
