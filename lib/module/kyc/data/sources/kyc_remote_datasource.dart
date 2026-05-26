import 'package:ppay_mobile/module/kyc/data/models/kyc_document_type_model.dart';
import 'package:ppay_mobile/module/kyc/data/models/profile_picture_model.dart';
import 'package:ppay_mobile/module/kyc/data/models/requests/update_profile_request.dart';
import 'package:ppay_mobile/module/kyc/data/models/requests/verify_bvn_request.dart';
import 'package:ppay_mobile/module/kyc/data/models/requests/verify_kyc_request.dart';
import 'package:ppay_mobile/module/kyc/data/models/user_model.dart';

abstract class KycRemoteDataSource {
  Future<UserModel> getUser();
  Future<List<KycDocumentTypeModel>> getKycDocumentTypes();
  Future<void> verifyBvn(VerifyBvnRequest request);
  Future<void> verifyKyc(VerifyKycRequest request);
  Future<ProfilePictureModel> uploadProfilePicture(String filePath);
  Future<void> updateProfile(UpdateProfileRequest request);
}
