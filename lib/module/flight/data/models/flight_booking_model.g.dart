// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlightBookingModelImpl _$$FlightBookingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FlightBookingModelImpl(
      bookingId: json['bookingId'] as String,
      bookingReference: json['bookingReference'] as String,
      status: json['status'] as String,
      airline: json['airline'] as String,
      airlineLogo: json['airlineLogo'] as String,
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      departureTime: json['departureTime'] as String,
      arrivalTime: json['arrivalTime'] as String,
      duration: (json['duration'] as num).toInt(),
      cabinClass: json['cabinClass'] as String,
      totalAmount: json['totalAmount'] as String,
      currency: json['currency'] as String,
      passengers: (json['passengers'] as List<dynamic>)
          .map((e) => PassengerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      outbound: (json['outbound'] as List<dynamic>)
          .map((e) => FlightSegmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      inbound: (json['inbound'] as List<dynamic>)
          .map((e) => FlightSegmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tickets: (json['tickets'] as List<dynamic>)
          .map((e) => TicketModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$FlightBookingModelImplToJson(
        _$FlightBookingModelImpl instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'bookingReference': instance.bookingReference,
      'status': instance.status,
      'airline': instance.airline,
      'airlineLogo': instance.airlineLogo,
      'origin': instance.origin,
      'destination': instance.destination,
      'departureTime': instance.departureTime,
      'arrivalTime': instance.arrivalTime,
      'duration': instance.duration,
      'cabinClass': instance.cabinClass,
      'totalAmount': instance.totalAmount,
      'currency': instance.currency,
      'passengers': instance.passengers,
      'outbound': instance.outbound,
      'inbound': instance.inbound,
      'tickets': instance.tickets,
      'createdAt': instance.createdAt,
    };

_$PassengerModelImpl _$$PassengerModelImplFromJson(Map<String, dynamic> json) =>
    _$PassengerModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      type: json['type'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      nationality: json['nationality'] as String?,
      passportNumber: json['passportNumber'] as String?,
    );

Map<String, dynamic> _$$PassengerModelImplToJson(
        _$PassengerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'nationality': instance.nationality,
      'passportNumber': instance.passportNumber,
    };

_$TicketModelImpl _$$TicketModelImplFromJson(Map<String, dynamic> json) =>
    _$TicketModelImpl(
      ticketNumber: json['ticketNumber'] as String,
      passengerName: json['passengerName'] as String,
      status: json['status'] as String,
      issuedAt: json['issuedAt'] as String?,
    );

Map<String, dynamic> _$$TicketModelImplToJson(_$TicketModelImpl instance) =>
    <String, dynamic>{
      'ticketNumber': instance.ticketNumber,
      'passengerName': instance.passengerName,
      'status': instance.status,
      'issuedAt': instance.issuedAt,
    };

_$BoardingPassModelImpl _$$BoardingPassModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BoardingPassModelImpl(
      bookingReference: json['bookingReference'] as String,
      providerReference: json['providerReference'] as String,
      status: json['status'] as String,
      airline: json['airline'] as String,
      airlineLogo: json['airlineLogo'] as String,
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      departureTime: json['departureTime'] as String,
      arrivalTime: json['arrivalTime'] as String,
      duration: (json['duration'] as num).toInt(),
      flightNumber: json['flightNumber'] as String,
      cabinClass: json['cabinClass'] as String,
      bookingClass: json['bookingClass'] as String,
      totalAmount: json['totalAmount'] as String,
      currency: json['currency'] as String,
      passengers: (json['passengers'] as List<dynamic>)
          .map((e) => PassengerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tickets: (json['tickets'] as List<dynamic>)
          .map((e) => TicketModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      outbound: (json['outbound'] as List<dynamic>)
          .map((e) => FlightSegmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      inbound: (json['inbound'] as List<dynamic>)
          .map((e) => FlightSegmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      expiresAt: json['expiresAt'] as String?,
    );

Map<String, dynamic> _$$BoardingPassModelImplToJson(
        _$BoardingPassModelImpl instance) =>
    <String, dynamic>{
      'bookingReference': instance.bookingReference,
      'providerReference': instance.providerReference,
      'status': instance.status,
      'airline': instance.airline,
      'airlineLogo': instance.airlineLogo,
      'origin': instance.origin,
      'destination': instance.destination,
      'departureTime': instance.departureTime,
      'arrivalTime': instance.arrivalTime,
      'duration': instance.duration,
      'flightNumber': instance.flightNumber,
      'cabinClass': instance.cabinClass,
      'bookingClass': instance.bookingClass,
      'totalAmount': instance.totalAmount,
      'currency': instance.currency,
      'passengers': instance.passengers,
      'tickets': instance.tickets,
      'outbound': instance.outbound,
      'inbound': instance.inbound,
      'createdAt': instance.createdAt,
      'expiresAt': instance.expiresAt,
    };
