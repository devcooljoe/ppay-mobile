import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/settings/domain/entities/transaction_limits_entity.dart';
import 'package:ppay_mobile/module/settings/domain/usecases/transaction_limit_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_limit_provider.g.dart';

@riverpod
class TransactionLimits extends _$TransactionLimits {
  @override
  AsyncValue<TransactionLimitsEntity?> build() {
    fetch();
    return const AsyncValue.loading();
  }

  Future<void> fetch() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetTransactionLimitsUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (limits) => AsyncValue.data(limits),
    );
  }
}
