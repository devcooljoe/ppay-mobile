import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/auth/domain/entities/auth_entity.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({required String token}) = _AuthModel;

  const AuthModel._();

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  AuthEntity toEntity() => AuthEntity(token: token);
}
