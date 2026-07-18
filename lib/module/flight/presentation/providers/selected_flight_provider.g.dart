// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_flight_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedFlightHash() => r'41cc5ce2cf3d68e85778249192362372f05a5708';

/// See also [SelectedFlight].
@ProviderFor(SelectedFlight)
final selectedFlightProvider =
    NotifierProvider<SelectedFlight, FlightEntity?>.internal(
  SelectedFlight.new,
  name: r'selectedFlightProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedFlightHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedFlight = Notifier<FlightEntity?>;
String _$selectedConfirmationHash() =>
    r'727429211dd09a3db5950a94e6b0339fd4981e0d';

/// See also [SelectedConfirmation].
@ProviderFor(SelectedConfirmation)
final selectedConfirmationProvider =
    NotifierProvider<SelectedConfirmation, FlightConfirmationEntity?>.internal(
  SelectedConfirmation.new,
  name: r'selectedConfirmationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedConfirmationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedConfirmation = Notifier<FlightConfirmationEntity?>;
String _$flightBookingResultHash() =>
    r'4e76a192edf12b9168f2e4d9d1cbdaf309b65e83';

/// See also [FlightBookingResult].
@ProviderFor(FlightBookingResult)
final flightBookingResultProvider = NotifierProvider<FlightBookingResult,
    FlightBookingResponseEntity?>.internal(
  FlightBookingResult.new,
  name: r'flightBookingResultProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flightBookingResultHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FlightBookingResult = Notifier<FlightBookingResponseEntity?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
