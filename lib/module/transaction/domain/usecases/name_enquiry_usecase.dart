import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/name_enquiry_entity.dart';
import 'package:ppay_mobile/module/transaction/domain/repositories/wallet_repository.dart';

@lazySingleton
class NameEnquiryUseCase {
  final WalletRepository _repository;

  NameEnquiryUseCase(this._repository);

  Future<Either<Failure, NameEnquiryEntity>> call({
    required String accountNumber,
    required String bankCode,
  }) => _repository.nameEnquiry(accountNumber: accountNumber, bankCode: bankCode);
}
