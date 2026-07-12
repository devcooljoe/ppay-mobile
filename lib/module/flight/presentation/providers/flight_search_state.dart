import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flight_search_state.freezed.dart';
part 'flight_search_state.g.dart';

@freezed
class FlightSearchParams with _$FlightSearchParams {
  const factory FlightSearchParams({
    @Default('') String from,
    @Default('') String fromLabel,
    @Default('') String to,
    @Default('') String toLabel,
    @Default('') String departureDate,
    String? returnDate,
    @Default(1) int adults,
    @Default(0) int children,
    @Default(0) int infants,
    @Default('economy') String cabin,
    @Default('one_way') String tripType,
  }) = _FlightSearchParams;
}

@riverpod
class FlightSearchState extends _$FlightSearchState {
  @override
  FlightSearchParams build() => const FlightSearchParams();

  void update(FlightSearchParams params) => state = params;

  void setFrom(String code, String label) =>
      state = state.copyWith(from: code, fromLabel: label);

  void setTo(String code, String label) =>
      state = state.copyWith(to: code, toLabel: label);

  void setDepartureDate(String date) =>
      state = state.copyWith(departureDate: date);

  void setReturnDate(String? date) =>
      state = state.copyWith(returnDate: date);

  void setPassengers({int? adults, int? children, int? infants}) => state =
      state.copyWith(
        adults: adults ?? state.adults,
        children: children ?? state.children,
        infants: infants ?? state.infants,
      );

  void setCabin(String cabin) => state = state.copyWith(cabin: cabin);

  void setTripType(String tripType) =>
      state = state.copyWith(tripType: tripType);

  void swapLocations() => state = state.copyWith(
        from: state.to,
        fromLabel: state.toLabel,
        to: state.from,
        toLabel: state.fromLabel,
      );

  String get passengersLabel {
    final total = state.adults + state.children + state.infants;
    if (total == 1) return '01 Adult';
    return '$total Passengers';
  }

  String get cabinLabel {
    switch (state.cabin) {
      case 'premium_economy':
        return 'Premium Economy';
      case 'business':
        return 'Business';
      case 'first':
        return 'First Class';
      default:
        return 'Economy';
    }
  }
}
