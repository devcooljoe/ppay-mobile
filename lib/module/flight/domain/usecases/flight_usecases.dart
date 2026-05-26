import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';
import 'package:ppay_mobile/module/flight/domain/repositories/flight_repository.dart';

@lazySingleton
class SearchFlightsUseCase {
  final FlightRepository _repository;
  SearchFlightsUseCase(this._repository);
  Future<Either<Failure, List<FlightEntity>>> call({
    required String from,
    required String to,
    required String departureDate,
    String? returnDate,
    required int adults,
    int? children,
    int? infants,
    required String cabin,
    required String tripType,
  }) => _repository.searchFlights(
    from: from,
    to: to,
    departureDate: departureDate,
    returnDate: returnDate,
    adults: adults,
    children: children,
    infants: infants,
    cabin: cabin,
    tripType: tripType,
  );
}

@lazySingleton
class ConfirmFlightUseCase {
  final FlightRepository _repository;
  ConfirmFlightUseCase(this._repository);
  Future<Either<Failure, FlightConfirmationEntity>> call(String offerId) =>
      _repository.confirmFlight(offerId);
}

@lazySingleton
class BookFlightUseCase {
  final FlightRepository _repository;
  BookFlightUseCase(this._repository);
  Future<Either<Failure, FlightBookingResponseEntity>> call({
    required String offerId,
    required List<Map<String, dynamic>> passengers,
  }) => _repository.bookFlight(offerId: offerId, passengers: passengers);
}

@lazySingleton
class GetFlightBookingsUseCase {
  final FlightRepository _repository;
  GetFlightBookingsUseCase(this._repository);
  Future<Either<Failure, List<FlightBookingEntity>>> call({String? status}) =>
      _repository.getBookings(status: status);
}

@lazySingleton
class GetBoardingPassUseCase {
  final FlightRepository _repository;
  GetBoardingPassUseCase(this._repository);
  Future<Either<Failure, BoardingPassEntity>> call(String bookingReference) =>
      _repository.getBoardingPass(bookingReference);
}

@lazySingleton
class CancelFlightUseCase {
  final FlightRepository _repository;
  CancelFlightUseCase(this._repository);
  Future<Either<Failure, void>> call(String bookingReference) =>
      _repository.cancelFlight(bookingReference);
}
