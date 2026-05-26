import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_picture_entity.freezed.dart';

@freezed
class ProfilePictureEntity with _$ProfilePictureEntity {
  const factory ProfilePictureEntity({
    required String pictureUrl,
  }) = _ProfilePictureEntity;
}
