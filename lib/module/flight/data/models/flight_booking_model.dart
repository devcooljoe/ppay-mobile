import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/flight/data/models/flight_model.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';

part 'flight_booking_model.freezed.dart';
part 'flight_booking_model.g.dart';

@freezed
class FlightBookingModel with _$FlightBookingModel {
  const factory FlightBookingModel({
    required String bookingId,
    required String bookingReference,
    required String status,
    String? airline,
    String? airlineLogo,
    String? origin,
    String? destination,
    String? departureTime,
    String? arrivalTime,
    int? duration,
    String? cabinClass,
    required String totalAmount,
    required String currency,
    @Default([]) List<PassengerModel> passengers,
    @Default([]) List<FlightSegmentModel> outbound,
    @Default([]) List<FlightSegmentModel> inbound,
    @Default([]) List<TicketModel> tickets,
    required String createdAt,
  }) = _FlightBookingModel;

  const FlightBookingModel._();

  factory FlightBookingModel.fromJson(Map<String, dynamic> json) => _$FlightBookingModelFromJson(json);

  FlightBookingEntity toEntity() => FlightBookingEntity(
    bookingId: bookingId,
    bookingReference: bookingReference,
    status: status,
    airline: airline ?? '',
    airlineLogo: airlineLogo ?? '',
    origin: origin ?? '',
    destination: destination ?? '',
    departureTime: departureTime ?? '',
    arrivalTime: arrivalTime ?? '',
    duration: duration ?? 0,
    cabinClass: cabinClass ?? '',
    totalAmount: totalAmount,
    currency: currency,
    passengers: passengers.map((e) => e.toEntity()).toList(),
    outbound: outbound.map((e) => e.toEntity()).toList(),
    inbound: inbound.map((e) => e.toEntity()).toList(),
    tickets: tickets.map((e) => e.toEntity()).toList(),
    createdAt: createdAt,
  );
}

@freezed
class PassengerModel with _$PassengerModel {
  const factory PassengerModel({
    String? id,
    required String name,
    required String type,
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    String? gender,
    String? nationality,
    String? passportNumber,
  }) = _PassengerModel;

  const PassengerModel._();

  factory PassengerModel.fromJson(Map<String, dynamic> json) => _$PassengerModelFromJson(json);

  PassengerEntity toEntity() => PassengerEntity(
    id: id,
    name: name,
    type: type,
    firstName: firstName,
    lastName: lastName,
    dateOfBirth: dateOfBirth,
    gender: gender,
    nationality: nationality,
    passportNumber: passportNumber,
  );
}

@freezed
class TicketModel with _$TicketModel {
  const factory TicketModel({
    required String ticketNumber,
    required String passengerName,
    required String status,
    String? issuedAt,
  }) = _TicketModel;

  const TicketModel._();

  factory TicketModel.fromJson(Map<String, dynamic> json) => _$TicketModelFromJson(json);

  TicketEntity toEntity() => TicketEntity(
    ticketNumber: ticketNumber,
    passengerName: passengerName,
    status: status,
    issuedAt: issuedAt,
  );
}

@freezed
class BoardingPassModel with _$BoardingPassModel {
  const factory BoardingPassModel({
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
    required List<PassengerModel> passengers,
    required List<TicketModel> tickets,
    required List<FlightSegmentModel> outbound,
    required List<FlightSegmentModel> inbound,
    required String createdAt,
    String? expiresAt,
  }) = _BoardingPassModel;

  const BoardingPassModel._();

  factory BoardingPassModel.fromJson(Map<String, dynamic> json) => _$BoardingPassModelFromJson(json);

  BoardingPassEntity toEntity() => BoardingPassEntity(
    bookingReference: bookingReference,
    providerReference: providerReference,
    status: status,
    airline: airline,
    airlineLogo: airlineLogo,
    origin: origin,
    destination: destination,
    departureTime: departureTime,
    arrivalTime: arrivalTime,
    duration: duration,
    flightNumber: flightNumber,
    cabinClass: cabinClass,
    bookingClass: bookingClass,
    totalAmount: totalAmount,
    currency: currency,
    passengers: passengers.map((e) => e.toEntity()).toList(),
    tickets: tickets.map((e) => e.toEntity()).toList(),
    outbound: outbound.map((e) => e.toEntity()).toList(),
    inbound: inbound.map((e) => e.toEntity()).toList(),
    createdAt: createdAt,
    expiresAt: expiresAt,
  );
}
