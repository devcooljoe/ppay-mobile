import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/module/bills/domain/usecases/bill_payment_usecases.dart';
import 'package:ppay_mobile/module/transaction/domain/usecases/calculate_fee_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bills_providers.g.dart';

// Auto-fetch providers — load billers as soon as their page mounts
@riverpod
Future<List<BillerEntity>> airtimeBillers(AirtimeBillersRef ref) async {
  final result = await getIt<GetAirtimeBillersUseCase>()();
  return result.fold((l) => throw l.message, (r) => r);
}

@riverpod
Future<List<BillerEntity>> dataBillers(DataBillersRef ref) async {
  final result = await getIt<GetDataBillersUseCase>()();
  return result.fold((l) => throw l.message, (r) => r);
}

@riverpod
Future<List<BillerEntity>> electricityBillers(ElectricityBillersRef ref) async {
  final result = await getIt<GetElectricityBillersUseCase>()();
  return result.fold((l) => throw l.message, (r) => r);
}

@riverpod
Future<List<BillerEntity>> tvBillers(TvBillersRef ref) async {
  final result = await getIt<GetTvBillersUseCase>()();
  return result.fold((l) => throw l.message, (r) => r);
}

@riverpod
Future<List<BillerEntity>> bettingBillers(BettingBillersRef ref) async {
  final result = await getIt<GetBettingBillersUseCase>()();
  return result.fold((l) => throw l.message, (r) => r);
}

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

  void reset() => state = const AsyncValue.data(null);

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
    required String billerName,
    required String billerCategory,
    String? meterNumber,
    String? plan,
    String? provider,
    String? logoUrl,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<PurchaseBillUseCase>()(
      billItemIdentifier: billItemIdentifier,
      customerIdentifier: customerIdentifier,
      phoneNumber: phoneNumber,
      amount: amount,
      customerFirstName: customerFirstName,
      billerName: billerName,
      billerCategory: billerCategory,
      meterNumber: meterNumber,
      plan: plan,
      provider: provider,
      logoUrl: logoUrl,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (purchase) => AsyncValue.data(purchase),
    );
  }
}

@riverpod
class CalculateFee extends _$CalculateFee {
  @override
  AsyncValue<double?> build() => const AsyncValue.data(null);

  Future<void> call({
    required String transactionType,
    required double amount,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<CalculateFeeUseCase>()(
      transactionType: transactionType,
      amount: amount,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (fee) => AsyncValue.data(fee),
    );
  }
}
