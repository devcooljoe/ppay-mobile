import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_pin_request.freezed.dart';
part 'reset_pin_request.g.dart';

@freezed
class ResetPinRequest with _$ResetPinRequest {
  const factory ResetPinRequest({
    required String resetToken,
    required String pin,
    required String confirmPin,
  }) = _ResetPinRequest;

  factory ResetPinRequest.fromJson(Map<String, dynamic> json) => _$ResetPinRequestFromJson(json);
}
