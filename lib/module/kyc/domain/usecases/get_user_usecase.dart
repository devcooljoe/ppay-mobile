import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/user_entity.dart';
import 'package:ppay_mobile/module/kyc/domain/repositories/kyc_repository.dart';

@lazySingleton
class GetUserUseCase {
  final KycRepository _repository;

  GetUserUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call() => _repository.getUser();
}
