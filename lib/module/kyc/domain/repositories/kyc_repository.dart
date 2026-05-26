import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/kyc_document_type_entity.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/profile_picture_entity.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/user_entity.dart';

abstract class KycRepository {
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, List<KycDocumentTypeEntity>>> getKycDocumentTypes();
  Future<Either<Failure, void>> verifyBvn({
    required String bvnNumber,
    required String dob,
  });
  Future<Either<Failure, void>> verifyKyc({
    required String idType,
    required String idNumber,
  });
  Future<Either<Failure, ProfilePictureEntity>> uploadProfilePicture({
    required String filePath,
  });
  Future<Either<Failure, void>> updateProfile({
    String? fullName,
    String? dob,
  });
}
