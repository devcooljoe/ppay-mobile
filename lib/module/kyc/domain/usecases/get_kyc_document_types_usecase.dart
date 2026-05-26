import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/kyc_document_type_entity.dart';
import 'package:ppay_mobile/module/kyc/domain/repositories/kyc_repository.dart';

@lazySingleton
class GetKycDocumentTypesUseCase {
  final KycRepository _repository;

  GetKycDocumentTypesUseCase(this._repository);

  Future<Either<Failure, List<KycDocumentTypeEntity>>> call() =>
      _repository.getKycDocumentTypes();
}
