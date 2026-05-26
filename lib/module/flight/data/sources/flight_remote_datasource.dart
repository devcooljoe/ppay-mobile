import 'package:ppay_mobile/module/flight/data/models/flight_booking_model.dart';
import 'package:ppay_mobile/module/flight/data/models/flight_model.dart';
import 'package:ppay_mobile/module/flight/data/models/requests/flight_request.dart';

abstract class FlightRemoteDataSource {
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
  });
  Future<FlightConfirmationModel> confirmFlight(ConfirmFlightRequest request);
  Future<FlightBookingResponseModel> bookFlight(BookFlightRequest request);
  Future<List<FlightBookingModel>> getBookings({String? status});
  Future<BoardingPassModel> getBoardingPass(String bookingReference);
  Future<void> cancelFlight(CancelFlightRequest request);
}
