import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/profile_picture_entity.dart';
import 'package:ppay_mobile/module/kyc/domain/repositories/kyc_repository.dart';

@lazySingleton
class UploadProfilePictureUseCase {
  final KycRepository _repository;

  UploadProfilePictureUseCase(this._repository);

  Future<Either<Failure, ProfilePictureEntity>> call({required String filePath}) =>
      _repository.uploadProfilePicture(filePath: filePath);
}
