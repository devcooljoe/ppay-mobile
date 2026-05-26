import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/wallet_entity.dart';
import 'package:ppay_mobile/module/transaction/domain/repositories/wallet_repository.dart';

@lazySingleton
class GetWalletUseCase {
  final WalletRepository _repository;

  GetWalletUseCase(this._repository);

  Future<Either<Failure, WalletEntity>> call() => _repository.getWallet();
}
