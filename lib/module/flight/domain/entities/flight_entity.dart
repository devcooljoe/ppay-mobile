import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_entity.freezed.dart';

@freezed
class FlightEntity with _$FlightEntity {
  const factory FlightEntity({
    required String id,
    required double amount,
    required List<TravelerPriceEntity> travelersPrice,
    required String currency,
    required int totalDuration,
    required List<FlightSegmentEntity> outbound,
    required List<FlightSegmentEntity> inbound,
    required int outboundStops,
    required int inboundStops,
    required String source,
  }) = _FlightEntity;
}

@freezed
class TravelerPriceEntity with _$TravelerPriceEntity {
  const factory TravelerPriceEntity({
    required double adult,
    required double child,
    required double infant,
  }) = _TravelerPriceEntity;
}

@freezed
class FlightSegmentEntity with _$FlightSegmentEntity {
  const factory FlightSegmentEntity({
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
    required AirlineDetailsEntity airlineDetails,
    String? marriageGroup,
    required String bookingClass,
    required String baggage,
    required bool overnight,
    int? layover,
  }) = _FlightSegmentEntity;
}

@freezed
class AirlineDetailsEntity with _$AirlineDetailsEntity {
  const factory AirlineDetailsEntity({
    required String code,
    required String name,
    required String logo,
  }) = _AirlineDetailsEntity;
}

@freezed
class FlightConfirmationEntity with _$FlightConfirmationEntity {
  const factory FlightConfirmationEntity({
    required String id,
    required double amount,
    required int bookableSeats,
    required String currency,
    required bool documentRequired,
    required String expiresAt,
    required bool priceChange,
    required String bookingId,
    required String bookingReference,
    required List<FlightSegmentEntity> outbound,
    required List<FlightSegmentEntity> inbound,
  }) = _FlightConfirmationEntity;
}

@freezed
class FlightBookingResponseEntity with _$FlightBookingResponseEntity {
  const factory FlightBookingResponseEntity({
    required String message,
    required String bookingReference,
    required String providerReference,
  }) = _FlightBookingResponseEntity;
}

@freezed
class FlightBookingEntity with _$FlightBookingEntity {
  const factory FlightBookingEntity({
    required String bookingId,
    required String bookingReference,
    required String status,
    required String airline,
    required String airlineLogo,
    required String origin,
    required String destination,
    required String departureTime,
    required String arrivalTime,
    required int duration,
    required String cabinClass,
    required String totalAmount,
    required String currency,
    required List<PassengerEntity> passengers,
    required List<FlightSegmentEntity> outbound,
    required List<FlightSegmentEntity> inbound,
    required List<TicketEntity> tickets,
    required String createdAt,
  }) = _FlightBookingEntity;
}

@freezed
class PassengerEntity with _$PassengerEntity {
  const factory PassengerEntity({
    String? id,
    required String name,
    required String type,
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    String? gender,
    String? nationality,
    String? passportNumber,
  }) = _PassengerEntity;
}

@freezed
class TicketEntity with _$TicketEntity {
  const factory TicketEntity({
    required String ticketNumber,
    required String passengerName,
    required String status,
    String? issuedAt,
  }) = _TicketEntity;
}

@freezed
class BoardingPassEntity with _$BoardingPassEntity {
  const factory BoardingPassEntity({
    required String bookingReference,
    required String providerReference,
    required String status,
    required String airline,
    required String airlineLogo,
    required String origin,
    required String destination,
    required String departureTime,
    required String arrivalTime,
    required int duration,
    required String flightNumber,
    required String cabinClass,
    required String bookingClass,
    required String totalAmount,
    required String currency,
    required List<PassengerEntity> passengers,
    required List<TicketEntity> tickets,
    required List<FlightSegmentEntity> outbound,
    required List<FlightSegmentEntity> inbound,
    required String createdAt,
    String? expiresAt,
  }) = _BoardingPassEntity;
}
