import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/wallet_entity.dart';
import 'package:ppay_mobile/module/transaction/domain/usecases/get_wallet_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet_provider.g.dart';

@Riverpod(keepAlive: true)
class Wallet extends _$Wallet {
  @override
  AsyncValue<WalletEntity?> build() {
    fetch();
    return const AsyncValue.loading();
  }

  Future<void> fetch() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetWalletUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (wallet) => AsyncValue.data(wallet),
    );
  }
}
