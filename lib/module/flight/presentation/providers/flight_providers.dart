import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';
import 'package:ppay_mobile/module/flight/domain/usecases/flight_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flight_providers.g.dart';

@riverpod
class SearchFlights extends _$SearchFlights {
  @override
  AsyncValue<List<FlightEntity>?> build() => const AsyncValue.data(null);

  Future<void> call({
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
    state = const AsyncValue.loading();
    final result = await getIt<SearchFlightsUseCase>()(
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
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (flights) => AsyncValue.data(flights),
    );
  }
}

@riverpod
class ConfirmFlight extends _$ConfirmFlight {
  @override
  AsyncValue<FlightConfirmationEntity?> build() => const AsyncValue.data(null);

  Future<void> call(String offerId) async {
    state = const AsyncValue.loading();
    final result = await getIt<ConfirmFlightUseCase>()(offerId);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (confirmation) => AsyncValue.data(confirmation),
    );
  }
}

@riverpod
class BookFlight extends _$BookFlight {
  @override
  AsyncValue<FlightBookingResponseEntity?> build() => const AsyncValue.data(null);

  Future<void> call({
    required String offerId,
    required List<Map<String, dynamic>> passengers,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<BookFlightUseCase>()(
      offerId: offerId,
      passengers: passengers,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (booking) => AsyncValue.data(booking),
    );
  }
}

@riverpod
class GetFlightBookings extends _$GetFlightBookings {
  @override
  AsyncValue<List<FlightBookingEntity>?> build() => const AsyncValue.data(null);

  Future<void> call({String? status}) async {
    state = const AsyncValue.loading();
    final result = await getIt<GetFlightBookingsUseCase>()(status: status);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (bookings) => AsyncValue.data(bookings),
    );
  }
}

@riverpod
class GetBoardingPass extends _$GetBoardingPass {
  @override
  AsyncValue<BoardingPassEntity?> build() => const AsyncValue.data(null);

  Future<void> call(String bookingReference) async {
    state = const AsyncValue.loading();
    final result = await getIt<GetBoardingPassUseCase>()(bookingReference);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (boardingPass) => AsyncValue.data(boardingPass),
    );
  }
}

@riverpod
class CancelFlight extends _$CancelFlight {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call(String bookingReference) async {
    state = const AsyncValue.loading();
    final result = await getIt<CancelFlightUseCase>()(bookingReference);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}
