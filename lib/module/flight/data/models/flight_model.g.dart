// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlightModelImpl _$$FlightModelImplFromJson(Map<String, dynamic> json) =>
    _$FlightModelImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      travelersPrice: (json['travelersPrice'] as List<dynamic>)
          .map((e) => TravelerPriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currency: json['currency'] as String,
      totalDuration: (json['totalDuration'] as num).toInt(),
      outbound: (json['outbound'] as List<dynamic>)
          .map((e) => FlightSegmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      inbound: (json['inbound'] as List<dynamic>)
          .map((e) => FlightSegmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      outboundStops: (json['outboundStops'] as num).toInt(),
      inboundStops: (json['inboundStops'] as num).toInt(),
      source: json['source'] as String,
    );

Map<String, dynamic> _$$FlightModelImplToJson(_$FlightModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'travelersPrice': instance.travelersPrice,
      'currency': instance.currency,
      'totalDuration': instance.totalDuration,
      'outbound': instance.outbound,
      'inbound': instance.inbound,
      'outboundStops': instance.outboundStops,
      'inboundStops': instance.inboundStops,
      'source': instance.source,
    };

_$TravelerPriceModelImpl _$$TravelerPriceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TravelerPriceModelImpl(
      adult: (json['adult'] as num).toDouble(),
      child: (json['child'] as num).toDouble(),
      infant: (json['infant'] as num).toDouble(),
    );

Map<String, dynamic> _$$TravelerPriceModelImplToJson(
        _$TravelerPriceModelImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
    };

_$FlightSegmentModelImpl _$$FlightSegmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FlightSegmentModelImpl(
      airportFrom: json['airportFrom'] as String,
      airportTo: json['airportTo'] as String,
      departureTime: json['departureTime'] as String,
      arrivalTime: json['arrivalTime'] as String,
      flightNumber: json['flightNumber'] as String,
      cabinType: json['cabinType'] as String,
      duration: (json['duration'] as num).toInt(),
      equipmentType: json['equipmentType'] as String,
      operatingAirline: json['operatingAirline'] as String,
      marketingAirline: json['marketingAirline'] as String,
      airlineDetails: AirlineDetailsModel.fromJson(
          json['airlineDetails'] as Map<String, dynamic>),
      marriageGroup: json['marriageGroup'] as String?,
      bookingClass: json['bookingClass'] as String,
      baggage: json['baggage'] as String,
      overnight: json['overnight'] as bool,
      layover: (json['layover'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FlightSegmentModelImplToJson(
        _$FlightSegmentModelImpl instance) =>
    <String, dynamic>{
      'airportFrom': instance.airportFrom,
      'airportTo': instance.airportTo,
      'departureTime': instance.departureTime,
      'arrivalTime': instance.arrivalTime,
      'flightNumber': instance.flightNumber,
      'cabinType': instance.cabinType,
      'duration': instance.duration,
      'equipmentType': instance.equipmentType,
      'operatingAirline': instance.operatingAirline,
      'marketingAirline': instance.marketingAirline,
      'airlineDetails': instance.airlineDetails,
      'marriageGroup': instance.marriageGroup,
      'bookingClass': instance.bookingClass,
      'baggage': instance.baggage,
      'overnight': instance.overnight,
      'layover': instance.layover,
    };

_$AirlineDetailsModelImpl _$$AirlineDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AirlineDetailsModelImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$$AirlineDetailsModelImplToJson(
        _$AirlineDetailsModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'logo': instance.logo,
    };

_$FlightConfirmationModelImpl _$$FlightConfirmationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FlightConfirmationModelImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      bookableSeats: (json['bookableSeats'] as num).toInt(),
      currency: json['currency'] as String,
      documentRequired: json['documentRequired'] as bool,
      expiresAt: json['expiresAt'] as String,
      priceChange: json['priceChange'] as bool,
      bookingId: json['bookingId'] as String,
      bookingReference: json['bookingReference'] as String,
      outbound: (json['outbound'] as List<dynamic>)
          .map((e) => FlightSegmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      inbound: (json['inbound'] as List<dynamic>)
          .map((e) => FlightSegmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FlightConfirmationModelImplToJson(
        _$FlightConfirmationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'bookableSeats': instance.bookableSeats,
      'currency': instance.currency,
      'documentRequired': instance.documentRequired,
      'expiresAt': instance.expiresAt,
      'priceChange': instance.priceChange,
      'bookingId': instance.bookingId,
      'bookingReference': instance.bookingReference,
      'outbound': instance.outbound,
      'inbound': instance.inbound,
    };

_$FlightBookingResponseModelImpl _$$FlightBookingResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FlightBookingResponseModelImpl(
      message: json['message'] as String,
      bookingReference: json['bookingReference'] as String,
      providerReference: json['providerReference'] as String,
    );

Map<String, dynamic> _$$FlightBookingResponseModelImplToJson(
        _$FlightBookingResponseModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'bookingReference': instance.bookingReference,
      'providerReference': instance.providerReference,
    };
