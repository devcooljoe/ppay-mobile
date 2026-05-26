import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';

part 'flight_model.freezed.dart';
part 'flight_model.g.dart';

@freezed
class FlightModel with _$FlightModel {
  const factory FlightModel({
    required String id,
    required double amount,
    required List<TravelerPriceModel> travelersPrice,
    required String currency,
    required int totalDuration,
    required List<FlightSegmentModel> outbound,
    required List<FlightSegmentModel> inbound,
    required int outboundStops,
    required int inboundStops,
    required String source,
  }) = _FlightModel;

  const FlightModel._();

  factory FlightModel.fromJson(Map<String, dynamic> json) => _$FlightModelFromJson(json);

  FlightEntity toEntity() => FlightEntity(
    id: id,
    amount: amount,
    travelersPrice: travelersPrice.map((e) => e.toEntity()).toList(),
    currency: currency,
    totalDuration: totalDuration,
    outbound: outbound.map((e) => e.toEntity()).toList(),
    inbound: inbound.map((e) => e.toEntity()).toList(),
    outboundStops: outboundStops,
    inboundStops: inboundStops,
    source: source,
  );
}

@freezed
class TravelerPriceModel with _$TravelerPriceModel {
  const factory TravelerPriceModel({
    required double adult,
    required double child,
    required double infant,
  }) = _TravelerPriceModel;

  const TravelerPriceModel._();

  factory TravelerPriceModel.fromJson(Map<String, dynamic> json) => _$TravelerPriceModelFromJson(json);

  TravelerPriceEntity toEntity() => TravelerPriceEntity(adult: adult, child: child, infant: infant);
}

@freezed
class FlightSegmentModel with _$FlightSegmentModel {
  const factory FlightSegmentModel({
    required String airportFrom,
    required String airportTo,
    required String departureTime,
    required String arrivalTime,
    required String flightNumber,
    required String cabinType,
    required int duration,
    required String equipmentType,
    required String operatingAirline,
    required String marketingAirline,
    required AirlineDetailsModel airlineDetails,
    String? marriageGroup,
    required String bookingClass,
    required String baggage,
    required bool overnight,
    int? layover,
  }) = _FlightSegmentModel;

  const FlightSegmentModel._();

  factory FlightSegmentModel.fromJson(Map<String, dynamic> json) => _$FlightSegmentModelFromJson(json);

  FlightSegmentEntity toEntity() => FlightSegmentEntity(
    airportFrom: airportFrom,
    airportTo: airportTo,
    departureTime: departureTime,
    arrivalTime: arrivalTime,
    flightNumber: flightNumber,
    cabinType: cabinType,
    duration: duration,
    equipmentType: equipmentType,
    operatingAirline: operatingAirline,
    marketingAirline: marketingAirline,
    airlineDetails: airlineDetails.toEntity(),
    marriageGroup: marriageGroup,
    bookingClass: bookingClass,
    baggage: baggage,
    overnight: overnight,
    layover: layover,
  );
}

@freezed
class AirlineDetailsModel with _$AirlineDetailsModel {
  const factory AirlineDetailsModel({
    required String code,
    required String name,
    required String logo,
  }) = _AirlineDetailsModel;

  const AirlineDetailsModel._();

  factory AirlineDetailsModel.fromJson(Map<String, dynamic> json) => _$AirlineDetailsModelFromJson(json);

  AirlineDetailsEntity toEntity() => AirlineDetailsEntity(code: code, name: name, logo: logo);
}

@freezed
class FlightConfirmationModel with _$FlightConfirmationModel {
  const factory FlightConfirmationModel({
    required String id,
    required double amount,
    required int bookableSeats,
    required String currency,
    required bool documentRequired,
    required String expiresAt,
    required bool priceChange,
    required String bookingId,
    required String bookingReference,
    required List<FlightSegmentModel> outbound,
    required List<FlightSegmentModel> inbound,
  }) = _FlightConfirmationModel;

  const FlightConfirmationModel._();

  factory FlightConfirmationModel.fromJson(Map<String, dynamic> json) => _$FlightConfirmationModelFromJson(json);

  FlightConfirmationEntity toEntity() => FlightConfirmationEntity(
    id: id,
    amount: amount,
    bookableSeats: bookableSeats,
    currency: currency,
    documentRequired: documentRequired,
    expiresAt: expiresAt,
    priceChange: priceChange,
    bookingId: bookingId,
    bookingReference: bookingReference,
    outbound: outbound.map((e) => e.toEntity()).toList(),
    inbound: inbound.map((e) => e.toEntity()).toList(),
  );
}

@freezed
class FlightBookingResponseModel with _$FlightBookingResponseModel {
  const factory FlightBookingResponseModel({
    required String message,
    required String bookingReference,
    required String providerReference,
  }) = _FlightBookingResponseModel;

  const FlightBookingResponseModel._();

  factory FlightBookingResponseModel.fromJson(Map<String, dynamic> json) => _$FlightBookingResponseModelFromJson(json);

  FlightBookingResponseEntity toEntity() => FlightBookingResponseEntity(
    message: message,
    bookingReference: bookingReference,
    providerReference: providerReference,
  );
}
