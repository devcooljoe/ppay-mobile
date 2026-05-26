import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/kyc/data/models/requests/update_profile_request.dart';
import 'package:ppay_mobile/module/kyc/data/models/requests/verify_bvn_request.dart';
import 'package:ppay_mobile/module/kyc/data/models/requests/verify_kyc_request.dart';
import 'package:ppay_mobile/module/kyc/data/sources/kyc_remote_datasource.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/kyc_document_type_entity.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/profile_picture_entity.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/user_entity.dart';
import 'package:ppay_mobile/module/kyc/domain/repositories/kyc_repository.dart';

@LazySingleton(as: KycRepository)
class KycRepositoryImpl implements KycRepository {
  final KycRemoteDataSource _remoteDataSource;

  KycRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final result = await _remoteDataSource.getUser();
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<KycDocumentTypeEntity>>> getKycDocumentTypes() async {
    try {
      final result = await _remoteDataSource.getKycDocumentTypes();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> verifyBvn({
    required String bvnNumber,
    required String dob,
  }) async {
    try {
      await _remoteDataSource.verifyBvn(
        VerifyBvnRequest(bvnNumber: bvnNumber, dob: dob),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> verifyKyc({
    required String idType,
    required String idNumber,
  }) async {
    try {
      await _remoteDataSource.verifyKyc(
        VerifyKycRequest(idType: idType, idNumber: idNumber),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, ProfilePictureEntity>> uploadProfilePicture({
    required String filePath,
  }) async {
    try {
      final result = await _remoteDataSource.uploadProfilePicture(filePath);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile({
    String? fullName,
    String? dob,
  }) async {
    try {
      await _remoteDataSource.updateProfile(
        UpdateProfileRequest(fullName: fullName, dob: dob),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
