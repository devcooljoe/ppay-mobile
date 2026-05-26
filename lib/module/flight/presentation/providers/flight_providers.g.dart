// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchFlightsHash() => r'06fb7a7577ea6e0329b46fcfa1c99cca8310bcb4';

/// See also [SearchFlights].
@ProviderFor(SearchFlights)
final searchFlightsProvider = AutoDisposeNotifierProvider<SearchFlights,
    AsyncValue<List<FlightEntity>?>>.internal(
  SearchFlights.new,
  name: r'searchFlightsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchFlightsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchFlights = AutoDisposeNotifier<AsyncValue<List<FlightEntity>?>>;
String _$confirmFlightHash() => r'7e27080383d6edaa47eb53f56e27694cfbd603ff';

/// See also [ConfirmFlight].
@ProviderFor(ConfirmFlight)
final confirmFlightProvider = AutoDisposeNotifierProvider<ConfirmFlight,
    AsyncValue<FlightConfirmationEntity?>>.internal(
  ConfirmFlight.new,
  name: r'confirmFlightProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$confirmFlightHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfirmFlight
    = AutoDisposeNotifier<AsyncValue<FlightConfirmationEntity?>>;
String _$bookFlightHash() => r'6d8d30bd37fce8d1f1ee08e55810a311b1f83f7c';

/// See also [BookFlight].
@ProviderFor(BookFlight)
final bookFlightProvider = AutoDisposeNotifierProvider<BookFlight,
    AsyncValue<FlightBookingResponseEntity?>>.internal(
  BookFlight.new,
  name: r'bookFlightProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bookFlightHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BookFlight
    = AutoDisposeNotifier<AsyncValue<FlightBookingResponseEntity?>>;
String _$getFlightBookingsHash() => r'8543870ee9e860fd8ead720acb67da81edc19451';

/// See also [GetFlightBookings].
@ProviderFor(GetFlightBookings)
final getFlightBookingsProvider = AutoDisposeNotifierProvider<GetFlightBookings,
    AsyncValue<List<FlightBookingEntity>?>>.internal(
  GetFlightBookings.new,
  name: r'getFlightBookingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFlightBookingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetFlightBookings
    = AutoDisposeNotifier<AsyncValue<List<FlightBookingEntity>?>>;
String _$getBoardingPassHash() => r'3188294c250818b0d69dc1074467b5ac3e4c301a';

/// See also [GetBoardingPass].
@ProviderFor(GetBoardingPass)
final getBoardingPassProvider = AutoDisposeNotifierProvider<GetBoardingPass,
    AsyncValue<BoardingPassEntity?>>.internal(
  GetBoardingPass.new,
  name: r'getBoardingPassProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getBoardingPassHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetBoardingPass
    = AutoDisposeNotifier<AsyncValue<BoardingPassEntity?>>;
String _$cancelFlightHash() => r'b14e96b2df7a23bd4bb75873832b60cdca0c25a7';

/// See also [CancelFlight].
@ProviderFor(CancelFlight)
final cancelFlightProvider =
    AutoDisposeNotifierProvider<CancelFlight, AsyncValue<void>>.internal(
  CancelFlight.new,
  name: r'cancelFlightProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cancelFlightHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CancelFlight = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
