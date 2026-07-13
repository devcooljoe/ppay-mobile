import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_entity.freezed.dart';

@freezed
class FlightEntity with _$FlightEntity {
  const factory FlightEntity({
    required String id,
    required double amount,
    @Default([]) List<TravelerPriceEntity> travelersPrice,
    @Default('NGN') String currency,
    @Default(0) int totalDuration,
    @Default([]) List<FlightSegmentEntity> outbound,
    @Default([]) List<FlightSegmentEntity> inbound,
    @Default(0) int outboundStops,
    @Default(0) int inboundStops,
    @Default('') String source,
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
    @Default('economy') String cabinType,
    required int duration,
    @Default('') String equipmentType,
    @Default('') String operatingAirline,
    @Default('') String marketingAirline,
    required AirlineDetailsEntity airlineDetails,
    String? marriageGroup,
    @Default('') String bookingClass,
    @Default('') String baggage,
    @Default(false) bool overnight,
    int? layover,
  }) = _FlightSegmentEntity;
}

@freezed
class AirlineDetailsEntity with _$AirlineDetailsEntity {
  const factory AirlineDetailsEntity({
    @Default('') String code,
    @Default('') String name,
    @Default('') String logo,
  }) = _AirlineDetailsEntity;
}

@freezed
class FlightConfirmationEntity with _$FlightConfirmationEntity {
  const factory FlightConfirmationEntity({
    required String id,
    required double amount,
    @Default(0) int bookableSeats,
    @Default('NGN') String currency,
    @Default(false) bool documentRequired,
    @Default('') String expiresAt,
    @Default(false) bool priceChange,
    required String bookingId,
    required String bookingReference,
    @Default([]) List<FlightSegmentEntity> outbound,
    @Default([]) List<FlightSegmentEntity> inbound,
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
    @Default('') String airline,
    @Default('') String airlineLogo,
    @Default('') String origin,
    @Default('') String destination,
    @Default('') String departureTime,
    @Default('') String arrivalTime,
    @Default(0) int duration,
    @Default('') String cabinClass,
    required String totalAmount,
    required String currency,
    @Default([]) List<PassengerEntity> passengers,
    @Default([]) List<FlightSegmentEntity> outbound,
    @Default([]) List<FlightSegmentEntity> inbound,
    @Default([]) List<TicketEntity> tickets,
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
