// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlightBookingModel _$FlightBookingModelFromJson(Map<String, dynamic> json) {
  return _FlightBookingModel.fromJson(json);
}

/// @nodoc
mixin _$FlightBookingModel {
  String get bookingId => throw _privateConstructorUsedError;
  String get bookingReference => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get airline => throw _privateConstructorUsedError;
  String get airlineLogo => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  String get departureTime => throw _privateConstructorUsedError;
  String get arrivalTime => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get cabinClass => throw _privateConstructorUsedError;
  String get totalAmount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  List<PassengerModel> get passengers => throw _privateConstructorUsedError;
  List<FlightSegmentModel> get outbound => throw _privateConstructorUsedError;
  List<FlightSegmentModel> get inbound => throw _privateConstructorUsedError;
  List<TicketModel> get tickets => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightBookingModelCopyWith<FlightBookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightBookingModelCopyWith<$Res> {
  factory $FlightBookingModelCopyWith(
          FlightBookingModel value, $Res Function(FlightBookingModel) then) =
      _$FlightBookingModelCopyWithImpl<$Res, FlightBookingModel>;
  @useResult
  $Res call(
      {String bookingId,
      String bookingReference,
      String status,
      String airline,
      String airlineLogo,
      String origin,
      String destination,
      String departureTime,
      String arrivalTime,
      int duration,
      String cabinClass,
      String totalAmount,
      String currency,
      List<PassengerModel> passengers,
      List<FlightSegmentModel> outbound,
      List<FlightSegmentModel> inbound,
      List<TicketModel> tickets,
      String createdAt});
}

/// @nodoc
class _$FlightBookingModelCopyWithImpl<$Res, $Val extends FlightBookingModel>
    implements $FlightBookingModelCopyWith<$Res> {
  _$FlightBookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? bookingReference = null,
    Object? status = null,
    Object? airline = null,
    Object? airlineLogo = null,
    Object? origin = null,
    Object? destination = null,
    Object? departureTime = null,
    Object? arrivalTime = null,
    Object? duration = null,
    Object? cabinClass = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? passengers = null,
    Object? outbound = null,
    Object? inbound = null,
    Object? tickets = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      airline: null == airline
          ? _value.airline
          : airline // ignore: cast_nullable_to_non_nullable
              as String,
      airlineLogo: null == airlineLogo
          ? _value.airlineLogo
          : airlineLogo // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalTime: null == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      cabinClass: null == cabinClass
          ? _value.cabinClass
          : cabinClass // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      passengers: null == passengers
          ? _value.passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as List<PassengerModel>,
      outbound: null == outbound
          ? _value.outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
      inbound: null == inbound
          ? _value.inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlightBookingModelImplCopyWith<$Res>
    implements $FlightBookingModelCopyWith<$Res> {
  factory _$$FlightBookingModelImplCopyWith(_$FlightBookingModelImpl value,
          $Res Function(_$FlightBookingModelImpl) then) =
      __$$FlightBookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bookingId,
      String bookingReference,
      String status,
      String airline,
      String airlineLogo,
      String origin,
      String destination,
      String departureTime,
      String arrivalTime,
      int duration,
      String cabinClass,
      String totalAmount,
      String currency,
      List<PassengerModel> passengers,
      List<FlightSegmentModel> outbound,
      List<FlightSegmentModel> inbound,
      List<TicketModel> tickets,
      String createdAt});
}

/// @nodoc
class __$$FlightBookingModelImplCopyWithImpl<$Res>
    extends _$FlightBookingModelCopyWithImpl<$Res, _$FlightBookingModelImpl>
    implements _$$FlightBookingModelImplCopyWith<$Res> {
  __$$FlightBookingModelImplCopyWithImpl(_$FlightBookingModelImpl _value,
      $Res Function(_$FlightBookingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? bookingReference = null,
    Object? status = null,
    Object? airline = null,
    Object? airlineLogo = null,
    Object? origin = null,
    Object? destination = null,
    Object? departureTime = null,
    Object? arrivalTime = null,
    Object? duration = null,
    Object? cabinClass = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? passengers = null,
    Object? outbound = null,
    Object? inbound = null,
    Object? tickets = null,
    Object? createdAt = null,
  }) {
    return _then(_$FlightBookingModelImpl(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      airline: null == airline
          ? _value.airline
          : airline // ignore: cast_nullable_to_non_nullable
              as String,
      airlineLogo: null == airlineLogo
          ? _value.airlineLogo
          : airlineLogo // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalTime: null == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      cabinClass: null == cabinClass
          ? _value.cabinClass
          : cabinClass // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      passengers: null == passengers
          ? _value._passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as List<PassengerModel>,
      outbound: null == outbound
          ? _value._outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
      inbound: null == inbound
          ? _value._inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightBookingModelImpl extends _FlightBookingModel {
  const _$FlightBookingModelImpl(
      {required this.bookingId,
      required this.bookingReference,
      required this.status,
      required this.airline,
      required this.airlineLogo,
      required this.origin,
      required this.destination,
      required this.departureTime,
      required this.arrivalTime,
      required this.duration,
      required this.cabinClass,
      required this.totalAmount,
      required this.currency,
      required final List<PassengerModel> passengers,
      required final List<FlightSegmentModel> outbound,
      required final List<FlightSegmentModel> inbound,
      required final List<TicketModel> tickets,
      required this.createdAt})
      : _passengers = passengers,
        _outbound = outbound,
        _inbound = inbound,
        _tickets = tickets,
        super._();

  factory _$FlightBookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightBookingModelImplFromJson(json);

  @override
  final String bookingId;
  @override
  final String bookingReference;
  @override
  final String status;
  @override
  final String airline;
  @override
  final String airlineLogo;
  @override
  final String origin;
  @override
  final String destination;
  @override
  final String departureTime;
  @override
  final String arrivalTime;
  @override
  final int duration;
  @override
  final String cabinClass;
  @override
  final String totalAmount;
  @override
  final String currency;
  final List<PassengerModel> _passengers;
  @override
  List<PassengerModel> get passengers {
    if (_passengers is EqualUnmodifiableListView) return _passengers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_passengers);
  }

  final List<FlightSegmentModel> _outbound;
  @override
  List<FlightSegmentModel> get outbound {
    if (_outbound is EqualUnmodifiableListView) return _outbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outbound);
  }

  final List<FlightSegmentModel> _inbound;
  @override
  List<FlightSegmentModel> get inbound {
    if (_inbound is EqualUnmodifiableListView) return _inbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inbound);
  }

  final List<TicketModel> _tickets;
  @override
  List<TicketModel> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  final String createdAt;

  @override
  String toString() {
    return 'FlightBookingModel(bookingId: $bookingId, bookingReference: $bookingReference, status: $status, airline: $airline, airlineLogo: $airlineLogo, origin: $origin, destination: $destination, departureTime: $departureTime, arrivalTime: $arrivalTime, duration: $duration, cabinClass: $cabinClass, totalAmount: $totalAmount, currency: $currency, passengers: $passengers, outbound: $outbound, inbound: $inbound, tickets: $tickets, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightBookingModelImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.bookingReference, bookingReference) ||
                other.bookingReference == bookingReference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.airline, airline) || other.airline == airline) &&
            (identical(other.airlineLogo, airlineLogo) ||
                other.airlineLogo == airlineLogo) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.arrivalTime, arrivalTime) ||
                other.arrivalTime == arrivalTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.cabinClass, cabinClass) ||
                other.cabinClass == cabinClass) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._passengers, _passengers) &&
            const DeepCollectionEquality().equals(other._outbound, _outbound) &&
            const DeepCollectionEquality().equals(other._inbound, _inbound) &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingId,
      bookingReference,
      status,
      airline,
      airlineLogo,
      origin,
      destination,
      departureTime,
      arrivalTime,
      duration,
      cabinClass,
      totalAmount,
      currency,
      const DeepCollectionEquality().hash(_passengers),
      const DeepCollectionEquality().hash(_outbound),
      const DeepCollectionEquality().hash(_inbound),
      const DeepCollectionEquality().hash(_tickets),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightBookingModelImplCopyWith<_$FlightBookingModelImpl> get copyWith =>
      __$$FlightBookingModelImplCopyWithImpl<_$FlightBookingModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightBookingModelImplToJson(
      this,
    );
  }
}

abstract class _FlightBookingModel extends FlightBookingModel {
  const factory _FlightBookingModel(
      {required final String bookingId,
      required final String bookingReference,
      required final String status,
      required final String airline,
      required final String airlineLogo,
      required final String origin,
      required final String destination,
      required final String departureTime,
      required final String arrivalTime,
      required final int duration,
      required final String cabinClass,
      required final String totalAmount,
      required final String currency,
      required final List<PassengerModel> passengers,
      required final List<FlightSegmentModel> outbound,
      required final List<FlightSegmentModel> inbound,
      required final List<TicketModel> tickets,
      required final String createdAt}) = _$FlightBookingModelImpl;
  const _FlightBookingModel._() : super._();

  factory _FlightBookingModel.fromJson(Map<String, dynamic> json) =
      _$FlightBookingModelImpl.fromJson;

  @override
  String get bookingId;
  @override
  String get bookingReference;
  @override
  String get status;
  @override
  String get airline;
  @override
  String get airlineLogo;
  @override
  String get origin;
  @override
  String get destination;
  @override
  String get departureTime;
  @override
  String get arrivalTime;
  @override
  int get duration;
  @override
  String get cabinClass;
  @override
  String get totalAmount;
  @override
  String get currency;
  @override
  List<PassengerModel> get passengers;
  @override
  List<FlightSegmentModel> get outbound;
  @override
  List<FlightSegmentModel> get inbound;
  @override
  List<TicketModel> get tickets;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$FlightBookingModelImplCopyWith<_$FlightBookingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PassengerModel _$PassengerModelFromJson(Map<String, dynamic> json) {
  return _PassengerModel.fromJson(json);
}

/// @nodoc
mixin _$PassengerModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get nationality => throw _privateConstructorUsedError;
  String? get passportNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassengerModelCopyWith<PassengerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassengerModelCopyWith<$Res> {
  factory $PassengerModelCopyWith(
          PassengerModel value, $Res Function(PassengerModel) then) =
      _$PassengerModelCopyWithImpl<$Res, PassengerModel>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String type,
      String? firstName,
      String? lastName,
      String? dateOfBirth,
      String? gender,
      String? nationality,
      String? passportNumber});
}

/// @nodoc
class _$PassengerModelCopyWithImpl<$Res, $Val extends PassengerModel>
    implements $PassengerModelCopyWith<$Res> {
  _$PassengerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? type = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? nationality = freezed,
    Object? passportNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      passportNumber: freezed == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PassengerModelImplCopyWith<$Res>
    implements $PassengerModelCopyWith<$Res> {
  factory _$$PassengerModelImplCopyWith(_$PassengerModelImpl value,
          $Res Function(_$PassengerModelImpl) then) =
      __$$PassengerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String type,
      String? firstName,
      String? lastName,
      String? dateOfBirth,
      String? gender,
      String? nationality,
      String? passportNumber});
}

/// @nodoc
class __$$PassengerModelImplCopyWithImpl<$Res>
    extends _$PassengerModelCopyWithImpl<$Res, _$PassengerModelImpl>
    implements _$$PassengerModelImplCopyWith<$Res> {
  __$$PassengerModelImplCopyWithImpl(
      _$PassengerModelImpl _value, $Res Function(_$PassengerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? type = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? nationality = freezed,
    Object? passportNumber = freezed,
  }) {
    return _then(_$PassengerModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      passportNumber: freezed == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PassengerModelImpl extends _PassengerModel {
  const _$PassengerModelImpl(
      {this.id,
      required this.name,
      required this.type,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.nationality,
      this.passportNumber})
      : super._();

  factory _$PassengerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassengerModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? dateOfBirth;
  @override
  final String? gender;
  @override
  final String? nationality;
  @override
  final String? passportNumber;

  @override
  String toString() {
    return 'PassengerModel(id: $id, name: $name, type: $type, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, gender: $gender, nationality: $nationality, passportNumber: $passportNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassengerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.passportNumber, passportNumber) ||
                other.passportNumber == passportNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, firstName,
      lastName, dateOfBirth, gender, nationality, passportNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PassengerModelImplCopyWith<_$PassengerModelImpl> get copyWith =>
      __$$PassengerModelImplCopyWithImpl<_$PassengerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassengerModelImplToJson(
      this,
    );
  }
}

abstract class _PassengerModel extends PassengerModel {
  const factory _PassengerModel(
      {final String? id,
      required final String name,
      required final String type,
      final String? firstName,
      final String? lastName,
      final String? dateOfBirth,
      final String? gender,
      final String? nationality,
      final String? passportNumber}) = _$PassengerModelImpl;
  const _PassengerModel._() : super._();

  factory _PassengerModel.fromJson(Map<String, dynamic> json) =
      _$PassengerModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get dateOfBirth;
  @override
  String? get gender;
  @override
  String? get nationality;
  @override
  String? get passportNumber;
  @override
  @JsonKey(ignore: true)
  _$$PassengerModelImplCopyWith<_$PassengerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) {
  return _TicketModel.fromJson(json);
}

/// @nodoc
mixin _$TicketModel {
  String get ticketNumber => throw _privateConstructorUsedError;
  String get passengerName => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get issuedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketModelCopyWith<TicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketModelCopyWith<$Res> {
  factory $TicketModelCopyWith(
          TicketModel value, $Res Function(TicketModel) then) =
      _$TicketModelCopyWithImpl<$Res, TicketModel>;
  @useResult
  $Res call(
      {String ticketNumber,
      String passengerName,
      String status,
      String? issuedAt});
}

/// @nodoc
class _$TicketModelCopyWithImpl<$Res, $Val extends TicketModel>
    implements $TicketModelCopyWith<$Res> {
  _$TicketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketNumber = null,
    Object? passengerName = null,
    Object? status = null,
    Object? issuedAt = freezed,
  }) {
    return _then(_value.copyWith(
      ticketNumber: null == ticketNumber
          ? _value.ticketNumber
          : ticketNumber // ignore: cast_nullable_to_non_nullable
              as String,
      passengerName: null == passengerName
          ? _value.passengerName
          : passengerName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      issuedAt: freezed == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketModelImplCopyWith<$Res>
    implements $TicketModelCopyWith<$Res> {
  factory _$$TicketModelImplCopyWith(
          _$TicketModelImpl value, $Res Function(_$TicketModelImpl) then) =
      __$$TicketModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ticketNumber,
      String passengerName,
      String status,
      String? issuedAt});
}

/// @nodoc
class __$$TicketModelImplCopyWithImpl<$Res>
    extends _$TicketModelCopyWithImpl<$Res, _$TicketModelImpl>
    implements _$$TicketModelImplCopyWith<$Res> {
  __$$TicketModelImplCopyWithImpl(
      _$TicketModelImpl _value, $Res Function(_$TicketModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketNumber = null,
    Object? passengerName = null,
    Object? status = null,
    Object? issuedAt = freezed,
  }) {
    return _then(_$TicketModelImpl(
      ticketNumber: null == ticketNumber
          ? _value.ticketNumber
          : ticketNumber // ignore: cast_nullable_to_non_nullable
              as String,
      passengerName: null == passengerName
          ? _value.passengerName
          : passengerName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      issuedAt: freezed == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketModelImpl extends _TicketModel {
  const _$TicketModelImpl(
      {required this.ticketNumber,
      required this.passengerName,
      required this.status,
      this.issuedAt})
      : super._();

  factory _$TicketModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketModelImplFromJson(json);

  @override
  final String ticketNumber;
  @override
  final String passengerName;
  @override
  final String status;
  @override
  final String? issuedAt;

  @override
  String toString() {
    return 'TicketModel(ticketNumber: $ticketNumber, passengerName: $passengerName, status: $status, issuedAt: $issuedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketModelImpl &&
            (identical(other.ticketNumber, ticketNumber) ||
                other.ticketNumber == ticketNumber) &&
            (identical(other.passengerName, passengerName) ||
                other.passengerName == passengerName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ticketNumber, passengerName, status, issuedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketModelImplCopyWith<_$TicketModelImpl> get copyWith =>
      __$$TicketModelImplCopyWithImpl<_$TicketModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketModelImplToJson(
      this,
    );
  }
}

abstract class _TicketModel extends TicketModel {
  const factory _TicketModel(
      {required final String ticketNumber,
      required final String passengerName,
      required final String status,
      final String? issuedAt}) = _$TicketModelImpl;
  const _TicketModel._() : super._();

  factory _TicketModel.fromJson(Map<String, dynamic> json) =
      _$TicketModelImpl.fromJson;

  @override
  String get ticketNumber;
  @override
  String get passengerName;
  @override
  String get status;
  @override
  String? get issuedAt;
  @override
  @JsonKey(ignore: true)
  _$$TicketModelImplCopyWith<_$TicketModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BoardingPassModel _$BoardingPassModelFromJson(Map<String, dynamic> json) {
  return _BoardingPassModel.fromJson(json);
}

/// @nodoc
mixin _$BoardingPassModel {
  String get bookingReference => throw _privateConstructorUsedError;
  String get providerReference => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get airline => throw _privateConstructorUsedError;
  String get airlineLogo => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  String get departureTime => throw _privateConstructorUsedError;
  String get arrivalTime => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get flightNumber => throw _privateConstructorUsedError;
  String get cabinClass => throw _privateConstructorUsedError;
  String get bookingClass => throw _privateConstructorUsedError;
  String get totalAmount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  List<PassengerModel> get passengers => throw _privateConstructorUsedError;
  List<TicketModel> get tickets => throw _privateConstructorUsedError;
  List<FlightSegmentModel> get outbound => throw _privateConstructorUsedError;
  List<FlightSegmentModel> get inbound => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardingPassModelCopyWith<BoardingPassModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardingPassModelCopyWith<$Res> {
  factory $BoardingPassModelCopyWith(
          BoardingPassModel value, $Res Function(BoardingPassModel) then) =
      _$BoardingPassModelCopyWithImpl<$Res, BoardingPassModel>;
  @useResult
  $Res call(
      {String bookingReference,
      String providerReference,
      String status,
      String airline,
      String airlineLogo,
      String origin,
      String destination,
      String departureTime,
      String arrivalTime,
      int duration,
      String flightNumber,
      String cabinClass,
      String bookingClass,
      String totalAmount,
      String currency,
      List<PassengerModel> passengers,
      List<TicketModel> tickets,
      List<FlightSegmentModel> outbound,
      List<FlightSegmentModel> inbound,
      String createdAt,
      String? expiresAt});
}

/// @nodoc
class _$BoardingPassModelCopyWithImpl<$Res, $Val extends BoardingPassModel>
    implements $BoardingPassModelCopyWith<$Res> {
  _$BoardingPassModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingReference = null,
    Object? providerReference = null,
    Object? status = null,
    Object? airline = null,
    Object? airlineLogo = null,
    Object? origin = null,
    Object? destination = null,
    Object? departureTime = null,
    Object? arrivalTime = null,
    Object? duration = null,
    Object? flightNumber = null,
    Object? cabinClass = null,
    Object? bookingClass = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? passengers = null,
    Object? tickets = null,
    Object? outbound = null,
    Object? inbound = null,
    Object? createdAt = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      providerReference: null == providerReference
          ? _value.providerReference
          : providerReference // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      airline: null == airline
          ? _value.airline
          : airline // ignore: cast_nullable_to_non_nullable
              as String,
      airlineLogo: null == airlineLogo
          ? _value.airlineLogo
          : airlineLogo // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalTime: null == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      flightNumber: null == flightNumber
          ? _value.flightNumber
          : flightNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cabinClass: null == cabinClass
          ? _value.cabinClass
          : cabinClass // ignore: cast_nullable_to_non_nullable
              as String,
      bookingClass: null == bookingClass
          ? _value.bookingClass
          : bookingClass // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      passengers: null == passengers
          ? _value.passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as List<PassengerModel>,
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketModel>,
      outbound: null == outbound
          ? _value.outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
      inbound: null == inbound
          ? _value.inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardingPassModelImplCopyWith<$Res>
    implements $BoardingPassModelCopyWith<$Res> {
  factory _$$BoardingPassModelImplCopyWith(_$BoardingPassModelImpl value,
          $Res Function(_$BoardingPassModelImpl) then) =
      __$$BoardingPassModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bookingReference,
      String providerReference,
      String status,
      String airline,
      String airlineLogo,
      String origin,
      String destination,
      String departureTime,
      String arrivalTime,
      int duration,
      String flightNumber,
      String cabinClass,
      String bookingClass,
      String totalAmount,
      String currency,
      List<PassengerModel> passengers,
      List<TicketModel> tickets,
      List<FlightSegmentModel> outbound,
      List<FlightSegmentModel> inbound,
      String createdAt,
      String? expiresAt});
}

/// @nodoc
class __$$BoardingPassModelImplCopyWithImpl<$Res>
    extends _$BoardingPassModelCopyWithImpl<$Res, _$BoardingPassModelImpl>
    implements _$$BoardingPassModelImplCopyWith<$Res> {
  __$$BoardingPassModelImplCopyWithImpl(_$BoardingPassModelImpl _value,
      $Res Function(_$BoardingPassModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingReference = null,
    Object? providerReference = null,
    Object? status = null,
    Object? airline = null,
    Object? airlineLogo = null,
    Object? origin = null,
    Object? destination = null,
    Object? departureTime = null,
    Object? arrivalTime = null,
    Object? duration = null,
    Object? flightNumber = null,
    Object? cabinClass = null,
    Object? bookingClass = null,
    Object? totalAmount = null,
    Object? currency = null,
    Object? passengers = null,
    Object? tickets = null,
    Object? outbound = null,
    Object? inbound = null,
    Object? createdAt = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_$BoardingPassModelImpl(
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      providerReference: null == providerReference
          ? _value.providerReference
          : providerReference // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      airline: null == airline
          ? _value.airline
          : airline // ignore: cast_nullable_to_non_nullable
              as String,
      airlineLogo: null == airlineLogo
          ? _value.airlineLogo
          : airlineLogo // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalTime: null == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      flightNumber: null == flightNumber
          ? _value.flightNumber
          : flightNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cabinClass: null == cabinClass
          ? _value.cabinClass
          : cabinClass // ignore: cast_nullable_to_non_nullable
              as String,
      bookingClass: null == bookingClass
          ? _value.bookingClass
          : bookingClass // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      passengers: null == passengers
          ? _value._passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as List<PassengerModel>,
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketModel>,
      outbound: null == outbound
          ? _value._outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
      inbound: null == inbound
          ? _value._inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardingPassModelImpl extends _BoardingPassModel {
  const _$BoardingPassModelImpl(
      {required this.bookingReference,
      required this.providerReference,
      required this.status,
      required this.airline,
      required this.airlineLogo,
      required this.origin,
      required this.destination,
      required this.departureTime,
      required this.arrivalTime,
      required this.duration,
      required this.flightNumber,
      required this.cabinClass,
      required this.bookingClass,
      required this.totalAmount,
      required this.currency,
      required final List<PassengerModel> passengers,
      required final List<TicketModel> tickets,
      required final List<FlightSegmentModel> outbound,
      required final List<FlightSegmentModel> inbound,
      required this.createdAt,
      this.expiresAt})
      : _passengers = passengers,
        _tickets = tickets,
        _outbound = outbound,
        _inbound = inbound,
        super._();

  factory _$BoardingPassModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardingPassModelImplFromJson(json);

  @override
  final String bookingReference;
  @override
  final String providerReference;
  @override
  final String status;
  @override
  final String airline;
  @override
  final String airlineLogo;
  @override
  final String origin;
  @override
  final String destination;
  @override
  final String departureTime;
  @override
  final String arrivalTime;
  @override
  final int duration;
  @override
  final String flightNumber;
  @override
  final String cabinClass;
  @override
  final String bookingClass;
  @override
  final String totalAmount;
  @override
  final String currency;
  final List<PassengerModel> _passengers;
  @override
  List<PassengerModel> get passengers {
    if (_passengers is EqualUnmodifiableListView) return _passengers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_passengers);
  }

  final List<TicketModel> _tickets;
  @override
  List<TicketModel> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  final List<FlightSegmentModel> _outbound;
  @override
  List<FlightSegmentModel> get outbound {
    if (_outbound is EqualUnmodifiableListView) return _outbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outbound);
  }

  final List<FlightSegmentModel> _inbound;
  @override
  List<FlightSegmentModel> get inbound {
    if (_inbound is EqualUnmodifiableListView) return _inbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inbound);
  }

  @override
  final String createdAt;
  @override
  final String? expiresAt;

  @override
  String toString() {
    return 'BoardingPassModel(bookingReference: $bookingReference, providerReference: $providerReference, status: $status, airline: $airline, airlineLogo: $airlineLogo, origin: $origin, destination: $destination, departureTime: $departureTime, arrivalTime: $arrivalTime, duration: $duration, flightNumber: $flightNumber, cabinClass: $cabinClass, bookingClass: $bookingClass, totalAmount: $totalAmount, currency: $currency, passengers: $passengers, tickets: $tickets, outbound: $outbound, inbound: $inbound, createdAt: $createdAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardingPassModelImpl &&
            (identical(other.bookingReference, bookingReference) ||
                other.bookingReference == bookingReference) &&
            (identical(other.providerReference, providerReference) ||
                other.providerReference == providerReference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.airline, airline) || other.airline == airline) &&
            (identical(other.airlineLogo, airlineLogo) ||
                other.airlineLogo == airlineLogo) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.arrivalTime, arrivalTime) ||
                other.arrivalTime == arrivalTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.flightNumber, flightNumber) ||
                other.flightNumber == flightNumber) &&
            (identical(other.cabinClass, cabinClass) ||
                other.cabinClass == cabinClass) &&
            (identical(other.bookingClass, bookingClass) ||
                other.bookingClass == bookingClass) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._passengers, _passengers) &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            const DeepCollectionEquality().equals(other._outbound, _outbound) &&
            const DeepCollectionEquality().equals(other._inbound, _inbound) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        bookingReference,
        providerReference,
        status,
        airline,
        airlineLogo,
        origin,
        destination,
        departureTime,
        arrivalTime,
        duration,
        flightNumber,
        cabinClass,
        bookingClass,
        totalAmount,
        currency,
        const DeepCollectionEquality().hash(_passengers),
        const DeepCollectionEquality().hash(_tickets),
        const DeepCollectionEquality().hash(_outbound),
        const DeepCollectionEquality().hash(_inbound),
        createdAt,
        expiresAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardingPassModelImplCopyWith<_$BoardingPassModelImpl> get copyWith =>
      __$$BoardingPassModelImplCopyWithImpl<_$BoardingPassModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardingPassModelImplToJson(
      this,
    );
  }
}

abstract class _BoardingPassModel extends BoardingPassModel {
  const factory _BoardingPassModel(
      {required final String bookingReference,
      required final String providerReference,
      required final String status,
      required final String airline,
      required final String airlineLogo,
      required final String origin,
      required final String destination,
      required final String departureTime,
      required final String arrivalTime,
      required final int duration,
      required final String flightNumber,
      required final String cabinClass,
      required final String bookingClass,
      required final String totalAmount,
      required final String currency,
      required final List<PassengerModel> passengers,
      required final List<TicketModel> tickets,
      required final List<FlightSegmentModel> outbound,
      required final List<FlightSegmentModel> inbound,
      required final String createdAt,
      final String? expiresAt}) = _$BoardingPassModelImpl;
  const _BoardingPassModel._() : super._();

  factory _BoardingPassModel.fromJson(Map<String, dynamic> json) =
      _$BoardingPassModelImpl.fromJson;

  @override
  String get bookingReference;
  @override
  String get providerReference;
  @override
  String get status;
  @override
  String get airline;
  @override
  String get airlineLogo;
  @override
  String get origin;
  @override
  String get destination;
  @override
  String get departureTime;
  @override
  String get arrivalTime;
  @override
  int get duration;
  @override
  String get flightNumber;
  @override
  String get cabinClass;
  @override
  String get bookingClass;
  @override
  String get totalAmount;
  @override
  String get currency;
  @override
  List<PassengerModel> get passengers;
  @override
  List<TicketModel> get tickets;
  @override
  List<FlightSegmentModel> get outbound;
  @override
  List<FlightSegmentModel> get inbound;
  @override
  String get createdAt;
  @override
  String? get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$BoardingPassModelImplCopyWith<_$BoardingPassModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
