import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_token_model.freezed.dart';
part 'reset_token_model.g.dart';

@freezed
class ResetTokenModel with _$ResetTokenModel {
  const factory ResetTokenModel({
    required String resetToken,
  }) = _ResetTokenModel;

  factory ResetTokenModel.fromJson(Map<String, dynamic> json) => _$ResetTokenModelFromJson(json);
}
