import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';

part 'selected_flight_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedFlight extends _$SelectedFlight {
  @override
  FlightEntity? build() => null;

  void select(FlightEntity flight) => state = flight;
  void clear() => state = null;
}

@Riverpod(keepAlive: true)
class SelectedConfirmation extends _$SelectedConfirmation {
  @override
  FlightConfirmationEntity? build() => null;

  void set(FlightConfirmationEntity confirmation) => state = confirmation;
  void clear() => state = null;
}

@Riverpod(keepAlive: true)
class FlightBookingResult extends _$FlightBookingResult {
  @override
  FlightBookingResponseEntity? build() => null;

  void set(FlightBookingResponseEntity result) => state = result;
  void clear() => state = null;
}
