// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfirmFlightRequestImpl _$$ConfirmFlightRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfirmFlightRequestImpl(
      offerId: json['offerId'] as String,
    );

Map<String, dynamic> _$$ConfirmFlightRequestImplToJson(
        _$ConfirmFlightRequestImpl instance) =>
    <String, dynamic>{
      'offerId': instance.offerId,
    };

_$BookFlightRequestImpl _$$BookFlightRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$BookFlightRequestImpl(
      offerId: json['offerId'] as String,
      passengers: (json['passengers'] as List<dynamic>)
          .map((e) => PassengerRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookFlightRequestImplToJson(
        _$BookFlightRequestImpl instance) =>
    <String, dynamic>{
      'offerId': instance.offerId,
      'passengers': instance.passengers,
    };

_$PassengerRequestImpl _$$PassengerRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PassengerRequestImpl(
      passengerType: json['passengerType'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      title: json['title'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      documents: json['documents'] == null
          ? null
          : PassengerDocumentRequest.fromJson(
              json['documents'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PassengerRequestImplToJson(
        _$PassengerRequestImpl instance) =>
    <String, dynamic>{
      'passengerType': instance.passengerType,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'title': instance.title,
      'dob': instance.dob,
      'gender': instance.gender,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'documents': instance.documents,
    };

_$PassengerDocumentRequestImpl _$$PassengerDocumentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PassengerDocumentRequestImpl(
      number: json['number'] as String,
      issuingDate: json['issuingDate'] as String,
      expiryDate: json['expiryDate'] as String,
      issuingCountry: json['issuingCountry'] as String,
      nationalityCountry: json['nationalityCountry'] as String,
      documentType: json['documentType'] as String,
    );

Map<String, dynamic> _$$PassengerDocumentRequestImplToJson(
        _$PassengerDocumentRequestImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'issuingDate': instance.issuingDate,
      'expiryDate': instance.expiryDate,
      'issuingCountry': instance.issuingCountry,
      'nationalityCountry': instance.nationalityCountry,
      'documentType': instance.documentType,
    };

_$CancelFlightRequestImpl _$$CancelFlightRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CancelFlightRequestImpl(
      bookingReference: json['bookingReference'] as String,
    );

Map<String, dynamic> _$$CancelFlightRequestImplToJson(
        _$CancelFlightRequestImpl instance) =>
    <String, dynamic>{
      'bookingReference': instance.bookingReference,
    };
