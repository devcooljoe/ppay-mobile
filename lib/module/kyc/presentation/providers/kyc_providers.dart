import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/kyc_document_type_entity.dart';
import 'package:ppay_mobile/module/kyc/domain/usecases/get_kyc_document_types_usecase.dart';
import 'package:ppay_mobile/module/kyc/domain/usecases/update_profile_usecase.dart';
import 'package:ppay_mobile/module/kyc/domain/usecases/upload_profile_picture_usecase.dart';
import 'package:ppay_mobile/module/kyc/domain/usecases/verify_bvn_usecase.dart';
import 'package:ppay_mobile/module/kyc/domain/usecases/verify_kyc_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kyc_providers.g.dart';

@riverpod
class GetKycDocumentTypes extends _$GetKycDocumentTypes {
  @override
  AsyncValue<List<KycDocumentTypeEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetKycDocumentTypesUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (types) => AsyncValue.data(types),
    );
  }
}

@riverpod
class VerifyBvn extends _$VerifyBvn {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String bvn,
    required String dob,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<VerifyBvnUseCase>()(bvnNumber: bvn, dob: dob);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class VerifyKyc extends _$VerifyKyc {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String idType,
    required String idNumber,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<VerifyKycUseCase>()(
      idType: idType,
      idNumber: idNumber,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class UploadProfilePicture extends _$UploadProfilePicture {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call(String filePath) async {
    state = const AsyncValue.loading();
    final result = await getIt<UploadProfilePictureUseCase>()(filePath: filePath);
    await result.fold(
      (l) async {
        state = AsyncValue.error(l.message, StackTrace.current);
      },
      (profilePictureEntity) async {
        final currentUser = ref.read(authenticatedUserProvider).value;
        if (currentUser != null) {
          ref.read(authenticatedUserProvider.notifier).updateUser(
            currentUser.copyWith(picture: profilePictureEntity.pictureUrl),
          );
        }
        state = const AsyncValue.data(null);
      },
    );
  }
}

@riverpod
class UpdateProfile extends _$UpdateProfile {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    String? fullName,
    String? dob,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<UpdateProfileUseCase>()(
      fullName: fullName,
      dob: dob,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}
