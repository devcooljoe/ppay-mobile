import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_pin_request.freezed.dart';
part 'set_pin_request.g.dart';

@freezed
class SetPinRequest with _$SetPinRequest {
  const factory SetPinRequest({
    required String pin,
    required String confirmPin,
  }) = _SetPinRequest;

  factory SetPinRequest.fromJson(Map<String, dynamic> json) => _$SetPinRequestFromJson(json);
}
