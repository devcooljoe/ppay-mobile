import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/flight/data/models/flight_booking_model.dart';
import 'package:ppay_mobile/module/flight/data/models/flight_model.dart';
import 'package:ppay_mobile/module/flight/data/models/requests/flight_request.dart';
import 'package:ppay_mobile/module/flight/data/sources/flight_remote_datasource.dart';

@LazySingleton(as: FlightRemoteDataSource)
class FlightRemoteDataSourceImpl implements FlightRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  FlightRemoteDataSourceImpl(this._dio);

  @override
  Future<List<FlightModel>> searchFlights({
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
    final queryParams = <String, dynamic>{
      'from': from,
      'to': to,
      'departureDate': departureDate,
      'adults': adults,
      'cabin': cabin,
      'tripType': tripType,
    };
    if (returnDate != null) queryParams['returnDate'] = returnDate;
    if (children != null) queryParams['children'] = children;
    if (infants != null) queryParams['infants'] = infants;

    final response = await _dio.get('$_baseUrl/flights/search', queryParameters: queryParams);
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => FlightModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<FlightConfirmationModel> confirmFlight(ConfirmFlightRequest request) async {
    final response = await _dio.post('$_baseUrl/flights/confirm', data: request.toJson());
    final baseResponse = BaseResponse<FlightConfirmationModel>.fromJson(
      response.data,
      (data) => FlightConfirmationModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<FlightBookingResponseModel> bookFlight(BookFlightRequest request) async {
    final response = await _dio.post('$_baseUrl/flights/book', data: request.toJson());
    final baseResponse = BaseResponse<FlightBookingResponseModel>.fromJson(
      response.data,
      (data) => FlightBookingResponseModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<List<FlightBookingModel>> getBookings({String? status}) async {
    final queryParams = <String, dynamic>{};
    if (status != null) queryParams['status'] = status;

    final response = await _dio.get('$_baseUrl/flights/bookings', queryParameters: queryParams);
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => FlightBookingModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<BoardingPassModel> getBoardingPass(String bookingReference) async {
    final response = await _dio.get('$_baseUrl/flights/boarding-pass/$bookingReference');
    final baseResponse = BaseResponse<BoardingPassModel>.fromJson(
      response.data,
      (data) => BoardingPassModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<void> cancelFlight(CancelFlightRequest request) async {
    await _dio.post('$_baseUrl/flights/cancel', data: request.toJson());
  }
}
