import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/flight/data/models/requests/flight_request.dart';
import 'package:ppay_mobile/module/flight/data/sources/flight_remote_datasource.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';

abstract class FlightRepository {
  Future<Either<Failure, List<FlightEntity>>> searchFlights({
    required String from,
    required String to,
    required String departureDate,
    String? returnDate,
    required int adults,
    int? children,
    int? infants,
    required String cabin,
    required String tripType,
  });
  Future<Either<Failure, FlightConfirmationEntity>> confirmFlight(String offerId);
  Future<Either<Failure, FlightBookingResponseEntity>> bookFlight({
    required String offerId,
    required List<Map<String, dynamic>> passengers,
  });
  Future<Either<Failure, List<FlightBookingEntity>>> getBookings({String? status});
  Future<Either<Failure, BoardingPassEntity>> getBoardingPass(String bookingReference);
  Future<Either<Failure, void>> cancelFlight(String bookingReference);
}

@LazySingleton(as: FlightRepository)
class FlightRepositoryImpl implements FlightRepository {
  final FlightRemoteDataSource _remoteDataSource;

  FlightRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<FlightEntity>>> searchFlights({
    required String from,
    required String to,
    required String departureDate,
    String? returnDate,
    required int adults,
    int? children,
    int? infants,
    required String cabin,
    required String tripType,
  }) async {
    try {
      final result = await _remoteDataSource.searchFlights(
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
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, FlightConfirmationEntity>> confirmFlight(String offerId) async {
    try {
      final result = await _remoteDataSource.confirmFlight(ConfirmFlightRequest(offerId: offerId));
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, FlightBookingResponseEntity>> bookFlight({
    required String offerId,
    required List<Map<String, dynamic>> passengers,
  }) async {
    try {
      final result = await _remoteDataSource.bookFlight(
        BookFlightRequest(
          offerId: offerId,
          passengers: passengers.map((e) => PassengerRequest(
            passengerType: e['passengerType'] as String,
            firstName: e['firstName'] as String,
            lastName: e['lastName'] as String,
            title: e['title'] as String,
            dob: e['dob'] as String,
            gender: e['gender'] as String,
            email: e['email'] as String,
            phoneNumber: e['phoneNumber'] as String,
            documents: e['documents'] == null
                ? null
                : PassengerDocumentRequest(
                    number: (e['documents'] as Map<String, dynamic>)['number'] as String,
                    issuingDate: (e['documents'] as Map<String, dynamic>)['issuingDate'] as String,
                    expiryDate: (e['documents'] as Map<String, dynamic>)['expiryDate'] as String,
                    issuingCountry: (e['documents'] as Map<String, dynamic>)['issuingCountry'] as String,
                    nationalityCountry: (e['documents'] as Map<String, dynamic>)['nationalityCountry'] as String,
                    documentType: (e['documents'] as Map<String, dynamic>)['documentType'] as String,
                  ),
          )).toList(),
        ),
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<FlightBookingEntity>>> getBookings({String? status}) async {
    try {
      final result = await _remoteDataSource.getBookings(status: status);
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, BoardingPassEntity>> getBoardingPass(String bookingReference) async {
    try {
      final result = await _remoteDataSource.getBoardingPass(bookingReference);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> cancelFlight(String bookingReference) async {
    try {
      await _remoteDataSource.cancelFlight(CancelFlightRequest(bookingReference: bookingReference));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
