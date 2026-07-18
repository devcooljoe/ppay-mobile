import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_request.freezed.dart';
part 'flight_request.g.dart';

@freezed
class ConfirmFlightRequest with _$ConfirmFlightRequest {
  const factory ConfirmFlightRequest({required String offerId}) =
      _ConfirmFlightRequest;

  factory ConfirmFlightRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmFlightRequestFromJson(json);
}

@freezed
class BookFlightRequest with _$BookFlightRequest {
  const factory BookFlightRequest({
    required String offerId,
    required List<PassengerRequest> passengers,
  }) = _BookFlightRequest;

  factory BookFlightRequest.fromJson(Map<String, dynamic> json) =>
      _$BookFlightRequestFromJson(json);
}

@freezed
class PassengerRequest with _$PassengerRequest {
  const factory PassengerRequest({
    required String passengerType,
    required String firstName,
    required String lastName,
    required String title,
    required String dob,
    required String gender,
    required String email,
    required String phoneNumber,
    PassengerDocumentRequest? documents,
  }) = _PassengerRequest;

  factory PassengerRequest.fromJson(Map<String, dynamic> json) =>
      _$PassengerRequestFromJson(json);
}

@freezed
class PassengerDocumentRequest with _$PassengerDocumentRequest {
  const factory PassengerDocumentRequest({
    required String number,
    required String issuingDate,
    required String expiryDate,
    required String issuingCountry,
    required String nationalityCountry,
    required String documentType,
  }) = _PassengerDocumentRequest;

  factory PassengerDocumentRequest.fromJson(Map<String, dynamic> json) =>
      _$PassengerDocumentRequestFromJson(json);
}

@freezed
class CancelFlightRequest with _$CancelFlightRequest {
  const factory CancelFlightRequest({required String bookingReference}) =
      _CancelFlightRequest;

  factory CancelFlightRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelFlightRequestFromJson(json);
}
