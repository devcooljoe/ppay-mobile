import 'package:freezed_annotation/freezed_annotation.dart';

part 'smile_id_token_response.freezed.dart';
part 'smile_id_token_response.g.dart';

@freezed
class SmileIdTokenResponse with _$SmileIdTokenResponse {
  const factory SmileIdTokenResponse({
    required String token,
    required String partnerId,
    required String callbackUrl,
    required bool useSandbox,
  }) = _SmileIdTokenResponse;

  factory SmileIdTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$SmileIdTokenResponseFromJson(json);
}
