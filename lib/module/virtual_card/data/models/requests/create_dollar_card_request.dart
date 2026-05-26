import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_dollar_card_request.freezed.dart';
part 'create_dollar_card_request.g.dart';

@freezed
class CreateDollarCardRequest with _$CreateDollarCardRequest {
  const factory CreateDollarCardRequest({
    required String street,
    required String city,
    required String state,
    required String country,
    required String postalCode,
  }) = _CreateDollarCardRequest;

  factory CreateDollarCardRequest.fromJson(Map<String, dynamic> json) => _$CreateDollarCardRequestFromJson(json);
}
