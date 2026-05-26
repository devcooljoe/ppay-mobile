// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FlightEntity {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  List<TravelerPriceEntity> get travelersPrice =>
      throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  int get totalDuration => throw _privateConstructorUsedError;
  List<FlightSegmentEntity> get outbound => throw _privateConstructorUsedError;
  List<FlightSegmentEntity> get inbound => throw _privateConstructorUsedError;
  int get outboundStops => throw _privateConstructorUsedError;
  int get inboundStops => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlightEntityCopyWith<FlightEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightEntityCopyWith<$Res> {
  factory $FlightEntityCopyWith(
          FlightEntity value, $Res Function(FlightEntity) then) =
      _$FlightEntityCopyWithImpl<$Res, FlightEntity>;
  @useResult
  $Res call(
      {String id,
      double amount,
      List<TravelerPriceEntity> travelersPrice,
      String currency,
      int totalDuration,
      List<FlightSegmentEntity> outbound,
      List<FlightSegmentEntity> inbound,
      int outboundStops,
      int inboundStops,
      String source});
}

/// @nodoc
class _$FlightEntityCopyWithImpl<$Res, $Val extends FlightEntity>
    implements $FlightEntityCopyWith<$Res> {
  _$FlightEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? travelersPrice = null,
    Object? currency = null,
    Object? totalDuration = null,
    Object? outbound = null,
    Object? inbound = null,
    Object? outboundStops = null,
    Object? inboundStops = null,
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      travelersPrice: null == travelersPrice
          ? _value.travelersPrice
          : travelersPrice // ignore: cast_nullable_to_non_nullable
              as List<TravelerPriceEntity>,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int,
      outbound: null == outbound
          ? _value.outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      inbound: null == inbound
          ? _value.inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      outboundStops: null == outboundStops
          ? _value.outboundStops
          : outboundStops // ignore: cast_nullable_to_non_nullable
              as int,
      inboundStops: null == inboundStops
          ? _value.inboundStops
          : inboundStops // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlightEntityImplCopyWith<$Res>
    implements $FlightEntityCopyWith<$Res> {
  factory _$$FlightEntityImplCopyWith(
          _$FlightEntityImpl value, $Res Function(_$FlightEntityImpl) then) =
      __$$FlightEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      List<TravelerPriceEntity> travelersPrice,
      String currency,
      int totalDuration,
      List<FlightSegmentEntity> outbound,
      List<FlightSegmentEntity> inbound,
      int outboundStops,
      int inboundStops,
      String source});
}

/// @nodoc
class __$$FlightEntityImplCopyWithImpl<$Res>
    extends _$FlightEntityCopyWithImpl<$Res, _$FlightEntityImpl>
    implements _$$FlightEntityImplCopyWith<$Res> {
  __$$FlightEntityImplCopyWithImpl(
      _$FlightEntityImpl _value, $Res Function(_$FlightEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? travelersPrice = null,
    Object? currency = null,
    Object? totalDuration = null,
    Object? outbound = null,
    Object? inbound = null,
    Object? outboundStops = null,
    Object? inboundStops = null,
    Object? source = null,
  }) {
    return _then(_$FlightEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      travelersPrice: null == travelersPrice
          ? _value._travelersPrice
          : travelersPrice // ignore: cast_nullable_to_non_nullable
              as List<TravelerPriceEntity>,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int,
      outbound: null == outbound
          ? _value._outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      inbound: null == inbound
          ? _value._inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      outboundStops: null == outboundStops
          ? _value.outboundStops
          : outboundStops // ignore: cast_nullable_to_non_nullable
              as int,
      inboundStops: null == inboundStops
          ? _value.inboundStops
          : inboundStops // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FlightEntityImpl implements _FlightEntity {
  const _$FlightEntityImpl(
      {required this.id,
      required this.amount,
      required final List<TravelerPriceEntity> travelersPrice,
      required this.currency,
      required this.totalDuration,
      required final List<FlightSegmentEntity> outbound,
      required final List<FlightSegmentEntity> inbound,
      required this.outboundStops,
      required this.inboundStops,
      required this.source})
      : _travelersPrice = travelersPrice,
        _outbound = outbound,
        _inbound = inbound;

  @override
  final String id;
  @override
  final double amount;
  final List<TravelerPriceEntity> _travelersPrice;
  @override
  List<TravelerPriceEntity> get travelersPrice {
    if (_travelersPrice is EqualUnmodifiableListView) return _travelersPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_travelersPrice);
  }

  @override
  final String currency;
  @override
  final int totalDuration;
  final List<FlightSegmentEntity> _outbound;
  @override
  List<FlightSegmentEntity> get outbound {
    if (_outbound is EqualUnmodifiableListView) return _outbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outbound);
  }

  final List<FlightSegmentEntity> _inbound;
  @override
  List<FlightSegmentEntity> get inbound {
    if (_inbound is EqualUnmodifiableListView) return _inbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inbound);
  }

  @override
  final int outboundStops;
  @override
  final int inboundStops;
  @override
  final String source;

  @override
  String toString() {
    return 'FlightEntity(id: $id, amount: $amount, travelersPrice: $travelersPrice, currency: $currency, totalDuration: $totalDuration, outbound: $outbound, inbound: $inbound, outboundStops: $outboundStops, inboundStops: $inboundStops, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality()
                .equals(other._travelersPrice, _travelersPrice) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            const DeepCollectionEquality().equals(other._outbound, _outbound) &&
            const DeepCollectionEquality().equals(other._inbound, _inbound) &&
            (identical(other.outboundStops, outboundStops) ||
                other.outboundStops == outboundStops) &&
            (identical(other.inboundStops, inboundStops) ||
                other.inboundStops == inboundStops) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      const DeepCollectionEquality().hash(_travelersPrice),
      currency,
      totalDuration,
      const DeepCollectionEquality().hash(_outbound),
      const DeepCollectionEquality().hash(_inbound),
      outboundStops,
      inboundStops,
      source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightEntityImplCopyWith<_$FlightEntityImpl> get copyWith =>
      __$$FlightEntityImplCopyWithImpl<_$FlightEntityImpl>(this, _$identity);
}

abstract class _FlightEntity implements FlightEntity {
  const factory _FlightEntity(
      {required final String id,
      required final double amount,
      required final List<TravelerPriceEntity> travelersPrice,
      required final String currency,
      required final int totalDuration,
      required final List<FlightSegmentEntity> outbound,
      required final List<FlightSegmentEntity> inbound,
      required final int outboundStops,
      required final int inboundStops,
      required final String source}) = _$FlightEntityImpl;

  @override
  String get id;
  @override
  double get amount;
  @override
  List<TravelerPriceEntity> get travelersPrice;
  @override
  String get currency;
  @override
  int get totalDuration;
  @override
  List<FlightSegmentEntity> get outbound;
  @override
  List<FlightSegmentEntity> get inbound;
  @override
  int get outboundStops;
  @override
  int get inboundStops;
  @override
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$FlightEntityImplCopyWith<_$FlightEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TravelerPriceEntity {
  double get adult => throw _privateConstructorUsedError;
  double get child => throw _privateConstructorUsedError;
  double get infant => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TravelerPriceEntityCopyWith<TravelerPriceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelerPriceEntityCopyWith<$Res> {
  factory $TravelerPriceEntityCopyWith(
          TravelerPriceEntity value, $Res Function(TravelerPriceEntity) then) =
      _$TravelerPriceEntityCopyWithImpl<$Res, TravelerPriceEntity>;
  @useResult
  $Res call({double adult, double child, double infant});
}

/// @nodoc
class _$TravelerPriceEntityCopyWithImpl<$Res, $Val extends TravelerPriceEntity>
    implements $TravelerPriceEntityCopyWith<$Res> {
  _$TravelerPriceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? child = null,
    Object? infant = null,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as double,
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as double,
      infant: null == infant
          ? _value.infant
          : infant // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelerPriceEntityImplCopyWith<$Res>
    implements $TravelerPriceEntityCopyWith<$Res> {
  factory _$$TravelerPriceEntityImplCopyWith(_$TravelerPriceEntityImpl value,
          $Res Function(_$TravelerPriceEntityImpl) then) =
      __$$TravelerPriceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double adult, double child, double infant});
}

/// @nodoc
class __$$TravelerPriceEntityImplCopyWithImpl<$Res>
    extends _$TravelerPriceEntityCopyWithImpl<$Res, _$TravelerPriceEntityImpl>
    implements _$$TravelerPriceEntityImplCopyWith<$Res> {
  __$$TravelerPriceEntityImplCopyWithImpl(_$TravelerPriceEntityImpl _value,
      $Res Function(_$TravelerPriceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? child = null,
    Object? infant = null,
  }) {
    return _then(_$TravelerPriceEntityImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as double,
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as double,
      infant: null == infant
          ? _value.infant
          : infant // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$TravelerPriceEntityImpl implements _TravelerPriceEntity {
  const _$TravelerPriceEntityImpl(
      {required this.adult, required this.child, required this.infant});

  @override
  final double adult;
  @override
  final double child;
  @override
  final double infant;

  @override
  String toString() {
    return 'TravelerPriceEntity(adult: $adult, child: $child, infant: $infant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelerPriceEntityImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.infant, infant) || other.infant == infant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, adult, child, infant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelerPriceEntityImplCopyWith<_$TravelerPriceEntityImpl> get copyWith =>
      __$$TravelerPriceEntityImplCopyWithImpl<_$TravelerPriceEntityImpl>(
          this, _$identity);
}

abstract class _TravelerPriceEntity implements TravelerPriceEntity {
  const factory _TravelerPriceEntity(
      {required final double adult,
      required final double child,
      required final double infant}) = _$TravelerPriceEntityImpl;

  @override
  double get adult;
  @override
  double get child;
  @override
  double get infant;
  @override
  @JsonKey(ignore: true)
  _$$TravelerPriceEntityImplCopyWith<_$TravelerPriceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FlightSegmentEntity {
  String get airportFrom => throw _privateConstructorUsedError;
  String get airportTo => throw _privateConstructorUsedError;
  String get departureTime => throw _privateConstructorUsedError;
  String get arrivalTime => throw _privateConstructorUsedError;
  String get flightNumber => throw _privateConstructorUsedError;
  String get cabinType => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get equipmentType => throw _privateConstructorUsedError;
  String get operatingAirline => throw _privateConstructorUsedError;
  String get marketingAirline => throw _privateConstructorUsedError;
  AirlineDetailsEntity get airlineDetails => throw _privateConstructorUsedError;
  String? get marriageGroup => throw _privateConstructorUsedError;
  String get bookingClass => throw _privateConstructorUsedError;
  String get baggage => throw _privateConstructorUsedError;
  bool get overnight => throw _privateConstructorUsedError;
  int? get layover => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlightSegmentEntityCopyWith<FlightSegmentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightSegmentEntityCopyWith<$Res> {
  factory $FlightSegmentEntityCopyWith(
          FlightSegmentEntity value, $Res Function(FlightSegmentEntity) then) =
      _$FlightSegmentEntityCopyWithImpl<$Res, FlightSegmentEntity>;
  @useResult
  $Res call(
      {String airportFrom,
      String airportTo,
      String departureTime,
      String arrivalTime,
      String flightNumber,
      String cabinType,
      int duration,
      String equipmentType,
      String operatingAirline,
      String marketingAirline,
      AirlineDetailsEntity airlineDetails,
      String? marriageGroup,
      String bookingClass,
      String baggage,
      bool overnight,
      int? layover});

  $AirlineDetailsEntityCopyWith<$Res> get airlineDetails;
}

/// @nodoc
class _$FlightSegmentEntityCopyWithImpl<$Res, $Val extends FlightSegmentEntity>
    implements $FlightSegmentEntityCopyWith<$Res> {
  _$FlightSegmentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airportFrom = null,
    Object? airportTo = null,
    Object? departureTime = null,
    Object? arrivalTime = null,
    Object? flightNumber = null,
    Object? cabinType = null,
    Object? duration = null,
    Object? equipmentType = null,
    Object? operatingAirline = null,
    Object? marketingAirline = null,
    Object? airlineDetails = null,
    Object? marriageGroup = freezed,
    Object? bookingClass = null,
    Object? baggage = null,
    Object? overnight = null,
    Object? layover = freezed,
  }) {
    return _then(_value.copyWith(
      airportFrom: null == airportFrom
          ? _value.airportFrom
          : airportFrom // ignore: cast_nullable_to_non_nullable
              as String,
      airportTo: null == airportTo
          ? _value.airportTo
          : airportTo // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalTime: null == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as String,
      flightNumber: null == flightNumber
          ? _value.flightNumber
          : flightNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cabinType: null == cabinType
          ? _value.cabinType
          : cabinType // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      equipmentType: null == equipmentType
          ? _value.equipmentType
          : equipmentType // ignore: cast_nullable_to_non_nullable
              as String,
      operatingAirline: null == operatingAirline
          ? _value.operatingAirline
          : operatingAirline // ignore: cast_nullable_to_non_nullable
              as String,
      marketingAirline: null == marketingAirline
          ? _value.marketingAirline
          : marketingAirline // ignore: cast_nullable_to_non_nullable
              as String,
      airlineDetails: null == airlineDetails
          ? _value.airlineDetails
          : airlineDetails // ignore: cast_nullable_to_non_nullable
              as AirlineDetailsEntity,
      marriageGroup: freezed == marriageGroup
          ? _value.marriageGroup
          : marriageGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingClass: null == bookingClass
          ? _value.bookingClass
          : bookingClass // ignore: cast_nullable_to_non_nullable
              as String,
      baggage: null == baggage
          ? _value.baggage
          : baggage // ignore: cast_nullable_to_non_nullable
              as String,
      overnight: null == overnight
          ? _value.overnight
          : overnight // ignore: cast_nullable_to_non_nullable
              as bool,
      layover: freezed == layover
          ? _value.layover
          : layover // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AirlineDetailsEntityCopyWith<$Res> get airlineDetails {
    return $AirlineDetailsEntityCopyWith<$Res>(_value.airlineDetails, (value) {
      return _then(_value.copyWith(airlineDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlightSegmentEntityImplCopyWith<$Res>
    implements $FlightSegmentEntityCopyWith<$Res> {
  factory _$$FlightSegmentEntityImplCopyWith(_$FlightSegmentEntityImpl value,
          $Res Function(_$FlightSegmentEntityImpl) then) =
      __$$FlightSegmentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String airportFrom,
      String airportTo,
      String departureTime,
      String arrivalTime,
      String flightNumber,
      String cabinType,
      int duration,
      String equipmentType,
      String operatingAirline,
      String marketingAirline,
      AirlineDetailsEntity airlineDetails,
      String? marriageGroup,
      String bookingClass,
      String baggage,
      bool overnight,
      int? layover});

  @override
  $AirlineDetailsEntityCopyWith<$Res> get airlineDetails;
}

/// @nodoc
class __$$FlightSegmentEntityImplCopyWithImpl<$Res>
    extends _$FlightSegmentEntityCopyWithImpl<$Res, _$FlightSegmentEntityImpl>
    implements _$$FlightSegmentEntityImplCopyWith<$Res> {
  __$$FlightSegmentEntityImplCopyWithImpl(_$FlightSegmentEntityImpl _value,
      $Res Function(_$FlightSegmentEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airportFrom = null,
    Object? airportTo = null,
    Object? departureTime = null,
    Object? arrivalTime = null,
    Object? flightNumber = null,
    Object? cabinType = null,
    Object? duration = null,
    Object? equipmentType = null,
    Object? operatingAirline = null,
    Object? marketingAirline = null,
    Object? airlineDetails = null,
    Object? marriageGroup = freezed,
    Object? bookingClass = null,
    Object? baggage = null,
    Object? overnight = null,
    Object? layover = freezed,
  }) {
    return _then(_$FlightSegmentEntityImpl(
      airportFrom: null == airportFrom
          ? _value.airportFrom
          : airportFrom // ignore: cast_nullable_to_non_nullable
              as String,
      airportTo: null == airportTo
          ? _value.airportTo
          : airportTo // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalTime: null == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as String,
      flightNumber: null == flightNumber
          ? _value.flightNumber
          : flightNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cabinType: null == cabinType
          ? _value.cabinType
          : cabinType // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      equipmentType: null == equipmentType
          ? _value.equipmentType
          : equipmentType // ignore: cast_nullable_to_non_nullable
              as String,
      operatingAirline: null == operatingAirline
          ? _value.operatingAirline
          : operatingAirline // ignore: cast_nullable_to_non_nullable
              as String,
      marketingAirline: null == marketingAirline
          ? _value.marketingAirline
          : marketingAirline // ignore: cast_nullable_to_non_nullable
              as String,
      airlineDetails: null == airlineDetails
          ? _value.airlineDetails
          : airlineDetails // ignore: cast_nullable_to_non_nullable
              as AirlineDetailsEntity,
      marriageGroup: freezed == marriageGroup
          ? _value.marriageGroup
          : marriageGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingClass: null == bookingClass
          ? _value.bookingClass
          : bookingClass // ignore: cast_nullable_to_non_nullable
              as String,
      baggage: null == baggage
          ? _value.baggage
          : baggage // ignore: cast_nullable_to_non_nullable
              as String,
      overnight: null == overnight
          ? _value.overnight
          : overnight // ignore: cast_nullable_to_non_nullable
              as bool,
      layover: freezed == layover
          ? _value.layover
          : layover // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FlightSegmentEntityImpl implements _FlightSegmentEntity {
  const _$FlightSegmentEntityImpl(
      {required this.airportFrom,
      required this.airportTo,
      required this.departureTime,
      required this.arrivalTime,
      required this.flightNumber,
      required this.cabinType,
      required this.duration,
      required this.equipmentType,
      required this.operatingAirline,
      required this.marketingAirline,
      required this.airlineDetails,
      this.marriageGroup,
      required this.bookingClass,
      required this.baggage,
      required this.overnight,
      this.layover});

  @override
  final String airportFrom;
  @override
  final String airportTo;
  @override
  final String departureTime;
  @override
  final String arrivalTime;
  @override
  final String flightNumber;
  @override
  final String cabinType;
  @override
  final int duration;
  @override
  final String equipmentType;
  @override
  final String operatingAirline;
  @override
  final String marketingAirline;
  @override
  final AirlineDetailsEntity airlineDetails;
  @override
  final String? marriageGroup;
  @override
  final String bookingClass;
  @override
  final String baggage;
  @override
  final bool overnight;
  @override
  final int? layover;

  @override
  String toString() {
    return 'FlightSegmentEntity(airportFrom: $airportFrom, airportTo: $airportTo, departureTime: $departureTime, arrivalTime: $arrivalTime, flightNumber: $flightNumber, cabinType: $cabinType, duration: $duration, equipmentType: $equipmentType, operatingAirline: $operatingAirline, marketingAirline: $marketingAirline, airlineDetails: $airlineDetails, marriageGroup: $marriageGroup, bookingClass: $bookingClass, baggage: $baggage, overnight: $overnight, layover: $layover)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightSegmentEntityImpl &&
            (identical(other.airportFrom, airportFrom) ||
                other.airportFrom == airportFrom) &&
            (identical(other.airportTo, airportTo) ||
                other.airportTo == airportTo) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.arrivalTime, arrivalTime) ||
                other.arrivalTime == arrivalTime) &&
            (identical(other.flightNumber, flightNumber) ||
                other.flightNumber == flightNumber) &&
            (identical(other.cabinType, cabinType) ||
                other.cabinType == cabinType) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.equipmentType, equipmentType) ||
                other.equipmentType == equipmentType) &&
            (identical(other.operatingAirline, operatingAirline) ||
                other.operatingAirline == operatingAirline) &&
            (identical(other.marketingAirline, marketingAirline) ||
                other.marketingAirline == marketingAirline) &&
            (identical(other.airlineDetails, airlineDetails) ||
                other.airlineDetails == airlineDetails) &&
            (identical(other.marriageGroup, marriageGroup) ||
                other.marriageGroup == marriageGroup) &&
            (identical(other.bookingClass, bookingClass) ||
                other.bookingClass == bookingClass) &&
            (identical(other.baggage, baggage) || other.baggage == baggage) &&
            (identical(other.overnight, overnight) ||
                other.overnight == overnight) &&
            (identical(other.layover, layover) || other.layover == layover));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      airportFrom,
      airportTo,
      departureTime,
      arrivalTime,
      flightNumber,
      cabinType,
      duration,
      equipmentType,
      operatingAirline,
      marketingAirline,
      airlineDetails,
      marriageGroup,
      bookingClass,
      baggage,
      overnight,
      layover);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightSegmentEntityImplCopyWith<_$FlightSegmentEntityImpl> get copyWith =>
      __$$FlightSegmentEntityImplCopyWithImpl<_$FlightSegmentEntityImpl>(
          this, _$identity);
}

abstract class _FlightSegmentEntity implements FlightSegmentEntity {
  const factory _FlightSegmentEntity(
      {required final String airportFrom,
      required final String airportTo,
      required final String departureTime,
      required final String arrivalTime,
      required final String flightNumber,
      required final String cabinType,
      required final int duration,
      required final String equipmentType,
      required final String operatingAirline,
      required final String marketingAirline,
      required final AirlineDetailsEntity airlineDetails,
      final String? marriageGroup,
      required final String bookingClass,
      required final String baggage,
      required final bool overnight,
      final int? layover}) = _$FlightSegmentEntityImpl;

  @override
  String get airportFrom;
  @override
  String get airportTo;
  @override
  String get departureTime;
  @override
  String get arrivalTime;
  @override
  String get flightNumber;
  @override
  String get cabinType;
  @override
  int get duration;
  @override
  String get equipmentType;
  @override
  String get operatingAirline;
  @override
  String get marketingAirline;
  @override
  AirlineDetailsEntity get airlineDetails;
  @override
  String? get marriageGroup;
  @override
  String get bookingClass;
  @override
  String get baggage;
  @override
  bool get overnight;
  @override
  int? get layover;
  @override
  @JsonKey(ignore: true)
  _$$FlightSegmentEntityImplCopyWith<_$FlightSegmentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AirlineDetailsEntity {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AirlineDetailsEntityCopyWith<AirlineDetailsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirlineDetailsEntityCopyWith<$Res> {
  factory $AirlineDetailsEntityCopyWith(AirlineDetailsEntity value,
          $Res Function(AirlineDetailsEntity) then) =
      _$AirlineDetailsEntityCopyWithImpl<$Res, AirlineDetailsEntity>;
  @useResult
  $Res call({String code, String name, String logo});
}

/// @nodoc
class _$AirlineDetailsEntityCopyWithImpl<$Res,
        $Val extends AirlineDetailsEntity>
    implements $AirlineDetailsEntityCopyWith<$Res> {
  _$AirlineDetailsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? logo = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AirlineDetailsEntityImplCopyWith<$Res>
    implements $AirlineDetailsEntityCopyWith<$Res> {
  factory _$$AirlineDetailsEntityImplCopyWith(_$AirlineDetailsEntityImpl value,
          $Res Function(_$AirlineDetailsEntityImpl) then) =
      __$$AirlineDetailsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String logo});
}

/// @nodoc
class __$$AirlineDetailsEntityImplCopyWithImpl<$Res>
    extends _$AirlineDetailsEntityCopyWithImpl<$Res, _$AirlineDetailsEntityImpl>
    implements _$$AirlineDetailsEntityImplCopyWith<$Res> {
  __$$AirlineDetailsEntityImplCopyWithImpl(_$AirlineDetailsEntityImpl _value,
      $Res Function(_$AirlineDetailsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? logo = null,
  }) {
    return _then(_$AirlineDetailsEntityImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AirlineDetailsEntityImpl implements _AirlineDetailsEntity {
  const _$AirlineDetailsEntityImpl(
      {required this.code, required this.name, required this.logo});

  @override
  final String code;
  @override
  final String name;
  @override
  final String logo;

  @override
  String toString() {
    return 'AirlineDetailsEntity(code: $code, name: $name, logo: $logo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirlineDetailsEntityImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, name, logo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AirlineDetailsEntityImplCopyWith<_$AirlineDetailsEntityImpl>
      get copyWith =>
          __$$AirlineDetailsEntityImplCopyWithImpl<_$AirlineDetailsEntityImpl>(
              this, _$identity);
}

abstract class _AirlineDetailsEntity implements AirlineDetailsEntity {
  const factory _AirlineDetailsEntity(
      {required final String code,
      required final String name,
      required final String logo}) = _$AirlineDetailsEntityImpl;

  @override
  String get code;
  @override
  String get name;
  @override
  String get logo;
  @override
  @JsonKey(ignore: true)
  _$$AirlineDetailsEntityImplCopyWith<_$AirlineDetailsEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FlightConfirmationEntity {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  int get bookableSeats => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  bool get documentRequired => throw _privateConstructorUsedError;
  String get expiresAt => throw _privateConstructorUsedError;
  bool get priceChange => throw _privateConstructorUsedError;
  String get bookingId => throw _privateConstructorUsedError;
  String get bookingReference => throw _privateConstructorUsedError;
  List<FlightSegmentEntity> get outbound => throw _privateConstructorUsedError;
  List<FlightSegmentEntity> get inbound => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlightConfirmationEntityCopyWith<FlightConfirmationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightConfirmationEntityCopyWith<$Res> {
  factory $FlightConfirmationEntityCopyWith(FlightConfirmationEntity value,
          $Res Function(FlightConfirmationEntity) then) =
      _$FlightConfirmationEntityCopyWithImpl<$Res, FlightConfirmationEntity>;
  @useResult
  $Res call(
      {String id,
      double amount,
      int bookableSeats,
      String currency,
      bool documentRequired,
      String expiresAt,
      bool priceChange,
      String bookingId,
      String bookingReference,
      List<FlightSegmentEntity> outbound,
      List<FlightSegmentEntity> inbound});
}

/// @nodoc
class _$FlightConfirmationEntityCopyWithImpl<$Res,
        $Val extends FlightConfirmationEntity>
    implements $FlightConfirmationEntityCopyWith<$Res> {
  _$FlightConfirmationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? bookableSeats = null,
    Object? currency = null,
    Object? documentRequired = null,
    Object? expiresAt = null,
    Object? priceChange = null,
    Object? bookingId = null,
    Object? bookingReference = null,
    Object? outbound = null,
    Object? inbound = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      bookableSeats: null == bookableSeats
          ? _value.bookableSeats
          : bookableSeats // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      documentRequired: null == documentRequired
          ? _value.documentRequired
          : documentRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
      priceChange: null == priceChange
          ? _value.priceChange
          : priceChange // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      outbound: null == outbound
          ? _value.outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      inbound: null == inbound
          ? _value.inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlightConfirmationEntityImplCopyWith<$Res>
    implements $FlightConfirmationEntityCopyWith<$Res> {
  factory _$$FlightConfirmationEntityImplCopyWith(
          _$FlightConfirmationEntityImpl value,
          $Res Function(_$FlightConfirmationEntityImpl) then) =
      __$$FlightConfirmationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      int bookableSeats,
      String currency,
      bool documentRequired,
      String expiresAt,
      bool priceChange,
      String bookingId,
      String bookingReference,
      List<FlightSegmentEntity> outbound,
      List<FlightSegmentEntity> inbound});
}

/// @nodoc
class __$$FlightConfirmationEntityImplCopyWithImpl<$Res>
    extends _$FlightConfirmationEntityCopyWithImpl<$Res,
        _$FlightConfirmationEntityImpl>
    implements _$$FlightConfirmationEntityImplCopyWith<$Res> {
  __$$FlightConfirmationEntityImplCopyWithImpl(
      _$FlightConfirmationEntityImpl _value,
      $Res Function(_$FlightConfirmationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? bookableSeats = null,
    Object? currency = null,
    Object? documentRequired = null,
    Object? expiresAt = null,
    Object? priceChange = null,
    Object? bookingId = null,
    Object? bookingReference = null,
    Object? outbound = null,
    Object? inbound = null,
  }) {
    return _then(_$FlightConfirmationEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      bookableSeats: null == bookableSeats
          ? _value.bookableSeats
          : bookableSeats // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      documentRequired: null == documentRequired
          ? _value.documentRequired
          : documentRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
      priceChange: null == priceChange
          ? _value.priceChange
          : priceChange // ignore: cast_nullable_to_non_nullable
              as bool,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      outbound: null == outbound
          ? _value._outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      inbound: null == inbound
          ? _value._inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
    ));
  }
}

/// @nodoc

class _$FlightConfirmationEntityImpl implements _FlightConfirmationEntity {
  const _$FlightConfirmationEntityImpl(
      {required this.id,
      required this.amount,
      required this.bookableSeats,
      required this.currency,
      required this.documentRequired,
      required this.expiresAt,
      required this.priceChange,
      required this.bookingId,
      required this.bookingReference,
      required final List<FlightSegmentEntity> outbound,
      required final List<FlightSegmentEntity> inbound})
      : _outbound = outbound,
        _inbound = inbound;

  @override
  final String id;
  @override
  final double amount;
  @override
  final int bookableSeats;
  @override
  final String currency;
  @override
  final bool documentRequired;
  @override
  final String expiresAt;
  @override
  final bool priceChange;
  @override
  final String bookingId;
  @override
  final String bookingReference;
  final List<FlightSegmentEntity> _outbound;
  @override
  List<FlightSegmentEntity> get outbound {
    if (_outbound is EqualUnmodifiableListView) return _outbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outbound);
  }

  final List<FlightSegmentEntity> _inbound;
  @override
  List<FlightSegmentEntity> get inbound {
    if (_inbound is EqualUnmodifiableListView) return _inbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inbound);
  }

  @override
  String toString() {
    return 'FlightConfirmationEntity(id: $id, amount: $amount, bookableSeats: $bookableSeats, currency: $currency, documentRequired: $documentRequired, expiresAt: $expiresAt, priceChange: $priceChange, bookingId: $bookingId, bookingReference: $bookingReference, outbound: $outbound, inbound: $inbound)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightConfirmationEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.bookableSeats, bookableSeats) ||
                other.bookableSeats == bookableSeats) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.documentRequired, documentRequired) ||
                other.documentRequired == documentRequired) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.priceChange, priceChange) ||
                other.priceChange == priceChange) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.bookingReference, bookingReference) ||
                other.bookingReference == bookingReference) &&
            const DeepCollectionEquality().equals(other._outbound, _outbound) &&
            const DeepCollectionEquality().equals(other._inbound, _inbound));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      bookableSeats,
      currency,
      documentRequired,
      expiresAt,
      priceChange,
      bookingId,
      bookingReference,
      const DeepCollectionEquality().hash(_outbound),
      const DeepCollectionEquality().hash(_inbound));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightConfirmationEntityImplCopyWith<_$FlightConfirmationEntityImpl>
      get copyWith => __$$FlightConfirmationEntityImplCopyWithImpl<
          _$FlightConfirmationEntityImpl>(this, _$identity);
}

abstract class _FlightConfirmationEntity implements FlightConfirmationEntity {
  const factory _FlightConfirmationEntity(
          {required final String id,
          required final double amount,
          required final int bookableSeats,
          required final String currency,
          required final bool documentRequired,
          required final String expiresAt,
          required final bool priceChange,
          required final String bookingId,
          required final String bookingReference,
          required final List<FlightSegmentEntity> outbound,
          required final List<FlightSegmentEntity> inbound}) =
      _$FlightConfirmationEntityImpl;

  @override
  String get id;
  @override
  double get amount;
  @override
  int get bookableSeats;
  @override
  String get currency;
  @override
  bool get documentRequired;
  @override
  String get expiresAt;
  @override
  bool get priceChange;
  @override
  String get bookingId;
  @override
  String get bookingReference;
  @override
  List<FlightSegmentEntity> get outbound;
  @override
  List<FlightSegmentEntity> get inbound;
  @override
  @JsonKey(ignore: true)
  _$$FlightConfirmationEntityImplCopyWith<_$FlightConfirmationEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FlightBookingResponseEntity {
  String get message => throw _privateConstructorUsedError;
  String get bookingReference => throw _privateConstructorUsedError;
  String get providerReference => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlightBookingResponseEntityCopyWith<FlightBookingResponseEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightBookingResponseEntityCopyWith<$Res> {
  factory $FlightBookingResponseEntityCopyWith(
          FlightBookingResponseEntity value,
          $Res Function(FlightBookingResponseEntity) then) =
      _$FlightBookingResponseEntityCopyWithImpl<$Res,
          FlightBookingResponseEntity>;
  @useResult
  $Res call(
      {String message, String bookingReference, String providerReference});
}

/// @nodoc
class _$FlightBookingResponseEntityCopyWithImpl<$Res,
        $Val extends FlightBookingResponseEntity>
    implements $FlightBookingResponseEntityCopyWith<$Res> {
  _$FlightBookingResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? bookingReference = null,
    Object? providerReference = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      providerReference: null == providerReference
          ? _value.providerReference
          : providerReference // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlightBookingResponseEntityImplCopyWith<$Res>
    implements $FlightBookingResponseEntityCopyWith<$Res> {
  factory _$$FlightBookingResponseEntityImplCopyWith(
          _$FlightBookingResponseEntityImpl value,
          $Res Function(_$FlightBookingResponseEntityImpl) then) =
      __$$FlightBookingResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, String bookingReference, String providerReference});
}

/// @nodoc
class __$$FlightBookingResponseEntityImplCopyWithImpl<$Res>
    extends _$FlightBookingResponseEntityCopyWithImpl<$Res,
        _$FlightBookingResponseEntityImpl>
    implements _$$FlightBookingResponseEntityImplCopyWith<$Res> {
  __$$FlightBookingResponseEntityImplCopyWithImpl(
      _$FlightBookingResponseEntityImpl _value,
      $Res Function(_$FlightBookingResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? bookingReference = null,
    Object? providerReference = null,
  }) {
    return _then(_$FlightBookingResponseEntityImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
      providerReference: null == providerReference
          ? _value.providerReference
          : providerReference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FlightBookingResponseEntityImpl
    implements _FlightBookingResponseEntity {
  const _$FlightBookingResponseEntityImpl(
      {required this.message,
      required this.bookingReference,
      required this.providerReference});

  @override
  final String message;
  @override
  final String bookingReference;
  @override
  final String providerReference;

  @override
  String toString() {
    return 'FlightBookingResponseEntity(message: $message, bookingReference: $bookingReference, providerReference: $providerReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightBookingResponseEntityImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.bookingReference, bookingReference) ||
                other.bookingReference == bookingReference) &&
            (identical(other.providerReference, providerReference) ||
                other.providerReference == providerReference));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, bookingReference, providerReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightBookingResponseEntityImplCopyWith<_$FlightBookingResponseEntityImpl>
      get copyWith => __$$FlightBookingResponseEntityImplCopyWithImpl<
          _$FlightBookingResponseEntityImpl>(this, _$identity);
}

abstract class _FlightBookingResponseEntity
    implements FlightBookingResponseEntity {
  const factory _FlightBookingResponseEntity(
          {required final String message,
          required final String bookingReference,
          required final String providerReference}) =
      _$FlightBookingResponseEntityImpl;

  @override
  String get message;
  @override
  String get bookingReference;
  @override
  String get providerReference;
  @override
  @JsonKey(ignore: true)
  _$$FlightBookingResponseEntityImplCopyWith<_$FlightBookingResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FlightBookingEntity {
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
  List<PassengerEntity> get passengers => throw _privateConstructorUsedError;
  List<FlightSegmentEntity> get outbound => throw _privateConstructorUsedError;
  List<FlightSegmentEntity> get inbound => throw _privateConstructorUsedError;
  List<TicketEntity> get tickets => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlightBookingEntityCopyWith<FlightBookingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightBookingEntityCopyWith<$Res> {
  factory $FlightBookingEntityCopyWith(
          FlightBookingEntity value, $Res Function(FlightBookingEntity) then) =
      _$FlightBookingEntityCopyWithImpl<$Res, FlightBookingEntity>;
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
      List<PassengerEntity> passengers,
      List<FlightSegmentEntity> outbound,
      List<FlightSegmentEntity> inbound,
      List<TicketEntity> tickets,
      String createdAt});
}

/// @nodoc
class _$FlightBookingEntityCopyWithImpl<$Res, $Val extends FlightBookingEntity>
    implements $FlightBookingEntityCopyWith<$Res> {
  _$FlightBookingEntityCopyWithImpl(this._value, this._then);

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
              as List<PassengerEntity>,
      outbound: null == outbound
          ? _value.outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      inbound: null == inbound
          ? _value.inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlightBookingEntityImplCopyWith<$Res>
    implements $FlightBookingEntityCopyWith<$Res> {
  factory _$$FlightBookingEntityImplCopyWith(_$FlightBookingEntityImpl value,
          $Res Function(_$FlightBookingEntityImpl) then) =
      __$$FlightBookingEntityImplCopyWithImpl<$Res>;
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
      List<PassengerEntity> passengers,
      List<FlightSegmentEntity> outbound,
      List<FlightSegmentEntity> inbound,
      List<TicketEntity> tickets,
      String createdAt});
}

/// @nodoc
class __$$FlightBookingEntityImplCopyWithImpl<$Res>
    extends _$FlightBookingEntityCopyWithImpl<$Res, _$FlightBookingEntityImpl>
    implements _$$FlightBookingEntityImplCopyWith<$Res> {
  __$$FlightBookingEntityImplCopyWithImpl(_$FlightBookingEntityImpl _value,
      $Res Function(_$FlightBookingEntityImpl) _then)
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
    return _then(_$FlightBookingEntityImpl(
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
              as List<PassengerEntity>,
      outbound: null == outbound
          ? _value._outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      inbound: null == inbound
          ? _value._inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FlightBookingEntityImpl implements _FlightBookingEntity {
  const _$FlightBookingEntityImpl(
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
      required final List<PassengerEntity> passengers,
      required final List<FlightSegmentEntity> outbound,
      required final List<FlightSegmentEntity> inbound,
      required final List<TicketEntity> tickets,
      required this.createdAt})
      : _passengers = passengers,
        _outbound = outbound,
        _inbound = inbound,
        _tickets = tickets;

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
  final List<PassengerEntity> _passengers;
  @override
  List<PassengerEntity> get passengers {
    if (_passengers is EqualUnmodifiableListView) return _passengers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_passengers);
  }

  final List<FlightSegmentEntity> _outbound;
  @override
  List<FlightSegmentEntity> get outbound {
    if (_outbound is EqualUnmodifiableListView) return _outbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outbound);
  }

  final List<FlightSegmentEntity> _inbound;
  @override
  List<FlightSegmentEntity> get inbound {
    if (_inbound is EqualUnmodifiableListView) return _inbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inbound);
  }

  final List<TicketEntity> _tickets;
  @override
  List<TicketEntity> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  final String createdAt;

  @override
  String toString() {
    return 'FlightBookingEntity(bookingId: $bookingId, bookingReference: $bookingReference, status: $status, airline: $airline, airlineLogo: $airlineLogo, origin: $origin, destination: $destination, departureTime: $departureTime, arrivalTime: $arrivalTime, duration: $duration, cabinClass: $cabinClass, totalAmount: $totalAmount, currency: $currency, passengers: $passengers, outbound: $outbound, inbound: $inbound, tickets: $tickets, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightBookingEntityImpl &&
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
  _$$FlightBookingEntityImplCopyWith<_$FlightBookingEntityImpl> get copyWith =>
      __$$FlightBookingEntityImplCopyWithImpl<_$FlightBookingEntityImpl>(
          this, _$identity);
}

abstract class _FlightBookingEntity implements FlightBookingEntity {
  const factory _FlightBookingEntity(
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
      required final List<PassengerEntity> passengers,
      required final List<FlightSegmentEntity> outbound,
      required final List<FlightSegmentEntity> inbound,
      required final List<TicketEntity> tickets,
      required final String createdAt}) = _$FlightBookingEntityImpl;

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
  List<PassengerEntity> get passengers;
  @override
  List<FlightSegmentEntity> get outbound;
  @override
  List<FlightSegmentEntity> get inbound;
  @override
  List<TicketEntity> get tickets;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$FlightBookingEntityImplCopyWith<_$FlightBookingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PassengerEntity {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get nationality => throw _privateConstructorUsedError;
  String? get passportNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PassengerEntityCopyWith<PassengerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassengerEntityCopyWith<$Res> {
  factory $PassengerEntityCopyWith(
          PassengerEntity value, $Res Function(PassengerEntity) then) =
      _$PassengerEntityCopyWithImpl<$Res, PassengerEntity>;
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
class _$PassengerEntityCopyWithImpl<$Res, $Val extends PassengerEntity>
    implements $PassengerEntityCopyWith<$Res> {
  _$PassengerEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$PassengerEntityImplCopyWith<$Res>
    implements $PassengerEntityCopyWith<$Res> {
  factory _$$PassengerEntityImplCopyWith(_$PassengerEntityImpl value,
          $Res Function(_$PassengerEntityImpl) then) =
      __$$PassengerEntityImplCopyWithImpl<$Res>;
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
class __$$PassengerEntityImplCopyWithImpl<$Res>
    extends _$PassengerEntityCopyWithImpl<$Res, _$PassengerEntityImpl>
    implements _$$PassengerEntityImplCopyWith<$Res> {
  __$$PassengerEntityImplCopyWithImpl(
      _$PassengerEntityImpl _value, $Res Function(_$PassengerEntityImpl) _then)
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
    return _then(_$PassengerEntityImpl(
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

class _$PassengerEntityImpl implements _PassengerEntity {
  const _$PassengerEntityImpl(
      {this.id,
      required this.name,
      required this.type,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.nationality,
      this.passportNumber});

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
    return 'PassengerEntity(id: $id, name: $name, type: $type, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, gender: $gender, nationality: $nationality, passportNumber: $passportNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassengerEntityImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, firstName,
      lastName, dateOfBirth, gender, nationality, passportNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PassengerEntityImplCopyWith<_$PassengerEntityImpl> get copyWith =>
      __$$PassengerEntityImplCopyWithImpl<_$PassengerEntityImpl>(
          this, _$identity);
}

abstract class _PassengerEntity implements PassengerEntity {
  const factory _PassengerEntity(
      {final String? id,
      required final String name,
      required final String type,
      final String? firstName,
      final String? lastName,
      final String? dateOfBirth,
      final String? gender,
      final String? nationality,
      final String? passportNumber}) = _$PassengerEntityImpl;

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
  _$$PassengerEntityImplCopyWith<_$PassengerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TicketEntity {
  String get ticketNumber => throw _privateConstructorUsedError;
  String get passengerName => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get issuedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketEntityCopyWith<TicketEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketEntityCopyWith<$Res> {
  factory $TicketEntityCopyWith(
          TicketEntity value, $Res Function(TicketEntity) then) =
      _$TicketEntityCopyWithImpl<$Res, TicketEntity>;
  @useResult
  $Res call(
      {String ticketNumber,
      String passengerName,
      String status,
      String? issuedAt});
}

/// @nodoc
class _$TicketEntityCopyWithImpl<$Res, $Val extends TicketEntity>
    implements $TicketEntityCopyWith<$Res> {
  _$TicketEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$TicketEntityImplCopyWith<$Res>
    implements $TicketEntityCopyWith<$Res> {
  factory _$$TicketEntityImplCopyWith(
          _$TicketEntityImpl value, $Res Function(_$TicketEntityImpl) then) =
      __$$TicketEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ticketNumber,
      String passengerName,
      String status,
      String? issuedAt});
}

/// @nodoc
class __$$TicketEntityImplCopyWithImpl<$Res>
    extends _$TicketEntityCopyWithImpl<$Res, _$TicketEntityImpl>
    implements _$$TicketEntityImplCopyWith<$Res> {
  __$$TicketEntityImplCopyWithImpl(
      _$TicketEntityImpl _value, $Res Function(_$TicketEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketNumber = null,
    Object? passengerName = null,
    Object? status = null,
    Object? issuedAt = freezed,
  }) {
    return _then(_$TicketEntityImpl(
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

class _$TicketEntityImpl implements _TicketEntity {
  const _$TicketEntityImpl(
      {required this.ticketNumber,
      required this.passengerName,
      required this.status,
      this.issuedAt});

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
    return 'TicketEntity(ticketNumber: $ticketNumber, passengerName: $passengerName, status: $status, issuedAt: $issuedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketEntityImpl &&
            (identical(other.ticketNumber, ticketNumber) ||
                other.ticketNumber == ticketNumber) &&
            (identical(other.passengerName, passengerName) ||
                other.passengerName == passengerName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ticketNumber, passengerName, status, issuedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketEntityImplCopyWith<_$TicketEntityImpl> get copyWith =>
      __$$TicketEntityImplCopyWithImpl<_$TicketEntityImpl>(this, _$identity);
}

abstract class _TicketEntity implements TicketEntity {
  const factory _TicketEntity(
      {required final String ticketNumber,
      required final String passengerName,
      required final String status,
      final String? issuedAt}) = _$TicketEntityImpl;

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
  _$$TicketEntityImplCopyWith<_$TicketEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BoardingPassEntity {
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
  List<PassengerEntity> get passengers => throw _privateConstructorUsedError;
  List<TicketEntity> get tickets => throw _privateConstructorUsedError;
  List<FlightSegmentEntity> get outbound => throw _privateConstructorUsedError;
  List<FlightSegmentEntity> get inbound => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get expiresAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoardingPassEntityCopyWith<BoardingPassEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardingPassEntityCopyWith<$Res> {
  factory $BoardingPassEntityCopyWith(
          BoardingPassEntity value, $Res Function(BoardingPassEntity) then) =
      _$BoardingPassEntityCopyWithImpl<$Res, BoardingPassEntity>;
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
      List<PassengerEntity> passengers,
      List<TicketEntity> tickets,
      List<FlightSegmentEntity> outbound,
      List<FlightSegmentEntity> inbound,
      String createdAt,
      String? expiresAt});
}

/// @nodoc
class _$BoardingPassEntityCopyWithImpl<$Res, $Val extends BoardingPassEntity>
    implements $BoardingPassEntityCopyWith<$Res> {
  _$BoardingPassEntityCopyWithImpl(this._value, this._then);

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
              as List<PassengerEntity>,
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      outbound: null == outbound
          ? _value.outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      inbound: null == inbound
          ? _value.inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
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
abstract class _$$BoardingPassEntityImplCopyWith<$Res>
    implements $BoardingPassEntityCopyWith<$Res> {
  factory _$$BoardingPassEntityImplCopyWith(_$BoardingPassEntityImpl value,
          $Res Function(_$BoardingPassEntityImpl) then) =
      __$$BoardingPassEntityImplCopyWithImpl<$Res>;
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
      List<PassengerEntity> passengers,
      List<TicketEntity> tickets,
      List<FlightSegmentEntity> outbound,
      List<FlightSegmentEntity> inbound,
      String createdAt,
      String? expiresAt});
}

/// @nodoc
class __$$BoardingPassEntityImplCopyWithImpl<$Res>
    extends _$BoardingPassEntityCopyWithImpl<$Res, _$BoardingPassEntityImpl>
    implements _$$BoardingPassEntityImplCopyWith<$Res> {
  __$$BoardingPassEntityImplCopyWithImpl(_$BoardingPassEntityImpl _value,
      $Res Function(_$BoardingPassEntityImpl) _then)
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
    return _then(_$BoardingPassEntityImpl(
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
              as List<PassengerEntity>,
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      outbound: null == outbound
          ? _value._outbound
          : outbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
      inbound: null == inbound
          ? _value._inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentEntity>,
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

class _$BoardingPassEntityImpl implements _BoardingPassEntity {
  const _$BoardingPassEntityImpl(
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
      required final List<PassengerEntity> passengers,
      required final List<TicketEntity> tickets,
      required final List<FlightSegmentEntity> outbound,
      required final List<FlightSegmentEntity> inbound,
      required this.createdAt,
      this.expiresAt})
      : _passengers = passengers,
        _tickets = tickets,
        _outbound = outbound,
        _inbound = inbound;

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
  final List<PassengerEntity> _passengers;
  @override
  List<PassengerEntity> get passengers {
    if (_passengers is EqualUnmodifiableListView) return _passengers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_passengers);
  }

  final List<TicketEntity> _tickets;
  @override
  List<TicketEntity> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  final List<FlightSegmentEntity> _outbound;
  @override
  List<FlightSegmentEntity> get outbound {
    if (_outbound is EqualUnmodifiableListView) return _outbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outbound);
  }

  final List<FlightSegmentEntity> _inbound;
  @override
  List<FlightSegmentEntity> get inbound {
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
    return 'BoardingPassEntity(bookingReference: $bookingReference, providerReference: $providerReference, status: $status, airline: $airline, airlineLogo: $airlineLogo, origin: $origin, destination: $destination, departureTime: $departureTime, arrivalTime: $arrivalTime, duration: $duration, flightNumber: $flightNumber, cabinClass: $cabinClass, bookingClass: $bookingClass, totalAmount: $totalAmount, currency: $currency, passengers: $passengers, tickets: $tickets, outbound: $outbound, inbound: $inbound, createdAt: $createdAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardingPassEntityImpl &&
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
  _$$BoardingPassEntityImplCopyWith<_$BoardingPassEntityImpl> get copyWith =>
      __$$BoardingPassEntityImplCopyWithImpl<_$BoardingPassEntityImpl>(
          this, _$identity);
}

abstract class _BoardingPassEntity implements BoardingPassEntity {
  const factory _BoardingPassEntity(
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
      required final List<PassengerEntity> passengers,
      required final List<TicketEntity> tickets,
      required final List<FlightSegmentEntity> outbound,
      required final List<FlightSegmentEntity> inbound,
      required final String createdAt,
      final String? expiresAt}) = _$BoardingPassEntityImpl;

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
  List<PassengerEntity> get passengers;
  @override
  List<TicketEntity> get tickets;
  @override
  List<FlightSegmentEntity> get outbound;
  @override
  List<FlightSegmentEntity> get inbound;
  @override
  String get createdAt;
  @override
  String? get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$BoardingPassEntityImplCopyWith<_$BoardingPassEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
