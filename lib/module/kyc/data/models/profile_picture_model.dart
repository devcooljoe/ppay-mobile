import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/profile_picture_entity.dart';

part 'profile_picture_model.freezed.dart';
part 'profile_picture_model.g.dart';

@freezed
class ProfilePictureModel with _$ProfilePictureModel {
  const factory ProfilePictureModel({
    required String pictureUrl,
  }) = _ProfilePictureModel;

  const ProfilePictureModel._();

  factory ProfilePictureModel.fromJson(Map<String, dynamic> json) => _$ProfilePictureModelFromJson(json);

  ProfilePictureEntity toEntity() => ProfilePictureEntity(pictureUrl: pictureUrl);
}
