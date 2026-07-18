// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlightModel _$FlightModelFromJson(Map<String, dynamic> json) {
  return _FlightModel.fromJson(json);
}

/// @nodoc
mixin _$FlightModel {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  List<TravelerPriceModel> get travelersPrice =>
      throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  int get totalDuration => throw _privateConstructorUsedError;
  List<FlightSegmentModel> get outbound => throw _privateConstructorUsedError;
  List<FlightSegmentModel> get inbound => throw _privateConstructorUsedError;
  int get outboundStops => throw _privateConstructorUsedError;
  int get inboundStops => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightModelCopyWith<FlightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightModelCopyWith<$Res> {
  factory $FlightModelCopyWith(
          FlightModel value, $Res Function(FlightModel) then) =
      _$FlightModelCopyWithImpl<$Res, FlightModel>;
  @useResult
  $Res call(
      {String id,
      double amount,
      List<TravelerPriceModel> travelersPrice,
      String currency,
      int totalDuration,
      List<FlightSegmentModel> outbound,
      List<FlightSegmentModel> inbound,
      int outboundStops,
      int inboundStops,
      String source});
}

/// @nodoc
class _$FlightModelCopyWithImpl<$Res, $Val extends FlightModel>
    implements $FlightModelCopyWith<$Res> {
  _$FlightModelCopyWithImpl(this._value, this._then);

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
              as List<TravelerPriceModel>,
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
              as List<FlightSegmentModel>,
      inbound: null == inbound
          ? _value.inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
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
abstract class _$$FlightModelImplCopyWith<$Res>
    implements $FlightModelCopyWith<$Res> {
  factory _$$FlightModelImplCopyWith(
          _$FlightModelImpl value, $Res Function(_$FlightModelImpl) then) =
      __$$FlightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      List<TravelerPriceModel> travelersPrice,
      String currency,
      int totalDuration,
      List<FlightSegmentModel> outbound,
      List<FlightSegmentModel> inbound,
      int outboundStops,
      int inboundStops,
      String source});
}

/// @nodoc
class __$$FlightModelImplCopyWithImpl<$Res>
    extends _$FlightModelCopyWithImpl<$Res, _$FlightModelImpl>
    implements _$$FlightModelImplCopyWith<$Res> {
  __$$FlightModelImplCopyWithImpl(
      _$FlightModelImpl _value, $Res Function(_$FlightModelImpl) _then)
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
    return _then(_$FlightModelImpl(
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
              as List<TravelerPriceModel>,
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
              as List<FlightSegmentModel>,
      inbound: null == inbound
          ? _value._inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
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
@JsonSerializable()
class _$FlightModelImpl extends _FlightModel {
  const _$FlightModelImpl(
      {required this.id,
      required this.amount,
      final List<TravelerPriceModel> travelersPrice = const [],
      this.currency = 'NGN',
      this.totalDuration = 0,
      final List<FlightSegmentModel> outbound = const [],
      final List<FlightSegmentModel> inbound = const [],
      this.outboundStops = 0,
      this.inboundStops = 0,
      this.source = ''})
      : _travelersPrice = travelersPrice,
        _outbound = outbound,
        _inbound = inbound,
        super._();

  factory _$FlightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightModelImplFromJson(json);

  @override
  final String id;
  @override
  final double amount;
  final List<TravelerPriceModel> _travelersPrice;
  @override
  @JsonKey()
  List<TravelerPriceModel> get travelersPrice {
    if (_travelersPrice is EqualUnmodifiableListView) return _travelersPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_travelersPrice);
  }

  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final int totalDuration;
  final List<FlightSegmentModel> _outbound;
  @override
  @JsonKey()
  List<FlightSegmentModel> get outbound {
    if (_outbound is EqualUnmodifiableListView) return _outbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outbound);
  }

  final List<FlightSegmentModel> _inbound;
  @override
  @JsonKey()
  List<FlightSegmentModel> get inbound {
    if (_inbound is EqualUnmodifiableListView) return _inbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inbound);
  }

  @override
  @JsonKey()
  final int outboundStops;
  @override
  @JsonKey()
  final int inboundStops;
  @override
  @JsonKey()
  final String source;

  @override
  String toString() {
    return 'FlightModel(id: $id, amount: $amount, travelersPrice: $travelersPrice, currency: $currency, totalDuration: $totalDuration, outbound: $outbound, inbound: $inbound, outboundStops: $outboundStops, inboundStops: $inboundStops, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightModelImpl &&
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

  @JsonKey(ignore: true)
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
  _$$FlightModelImplCopyWith<_$FlightModelImpl> get copyWith =>
      __$$FlightModelImplCopyWithImpl<_$FlightModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightModelImplToJson(
      this,
    );
  }
}

abstract class _FlightModel extends FlightModel {
  const factory _FlightModel(
      {required final String id,
      required final double amount,
      final List<TravelerPriceModel> travelersPrice,
      final String currency,
      final int totalDuration,
      final List<FlightSegmentModel> outbound,
      final List<FlightSegmentModel> inbound,
      final int outboundStops,
      final int inboundStops,
      final String source}) = _$FlightModelImpl;
  const _FlightModel._() : super._();

  factory _FlightModel.fromJson(Map<String, dynamic> json) =
      _$FlightModelImpl.fromJson;

  @override
  String get id;
  @override
  double get amount;
  @override
  List<TravelerPriceModel> get travelersPrice;
  @override
  String get currency;
  @override
  int get totalDuration;
  @override
  List<FlightSegmentModel> get outbound;
  @override
  List<FlightSegmentModel> get inbound;
  @override
  int get outboundStops;
  @override
  int get inboundStops;
  @override
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$FlightModelImplCopyWith<_$FlightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TravelerPriceModel _$TravelerPriceModelFromJson(Map<String, dynamic> json) {
  return _TravelerPriceModel.fromJson(json);
}

/// @nodoc
mixin _$TravelerPriceModel {
  double get adult => throw _privateConstructorUsedError;
  double get child => throw _privateConstructorUsedError;
  double get infant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TravelerPriceModelCopyWith<TravelerPriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelerPriceModelCopyWith<$Res> {
  factory $TravelerPriceModelCopyWith(
          TravelerPriceModel value, $Res Function(TravelerPriceModel) then) =
      _$TravelerPriceModelCopyWithImpl<$Res, TravelerPriceModel>;
  @useResult
  $Res call({double adult, double child, double infant});
}

/// @nodoc
class _$TravelerPriceModelCopyWithImpl<$Res, $Val extends TravelerPriceModel>
    implements $TravelerPriceModelCopyWith<$Res> {
  _$TravelerPriceModelCopyWithImpl(this._value, this._then);

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
abstract class _$$TravelerPriceModelImplCopyWith<$Res>
    implements $TravelerPriceModelCopyWith<$Res> {
  factory _$$TravelerPriceModelImplCopyWith(_$TravelerPriceModelImpl value,
          $Res Function(_$TravelerPriceModelImpl) then) =
      __$$TravelerPriceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double adult, double child, double infant});
}

/// @nodoc
class __$$TravelerPriceModelImplCopyWithImpl<$Res>
    extends _$TravelerPriceModelCopyWithImpl<$Res, _$TravelerPriceModelImpl>
    implements _$$TravelerPriceModelImplCopyWith<$Res> {
  __$$TravelerPriceModelImplCopyWithImpl(_$TravelerPriceModelImpl _value,
      $Res Function(_$TravelerPriceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? child = null,
    Object? infant = null,
  }) {
    return _then(_$TravelerPriceModelImpl(
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
@JsonSerializable()
class _$TravelerPriceModelImpl extends _TravelerPriceModel {
  const _$TravelerPriceModelImpl(
      {this.adult = 0.0, this.child = 0.0, this.infant = 0.0})
      : super._();

  factory _$TravelerPriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelerPriceModelImplFromJson(json);

  @override
  @JsonKey()
  final double adult;
  @override
  @JsonKey()
  final double child;
  @override
  @JsonKey()
  final double infant;

  @override
  String toString() {
    return 'TravelerPriceModel(adult: $adult, child: $child, infant: $infant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelerPriceModelImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.infant, infant) || other.infant == infant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, adult, child, infant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelerPriceModelImplCopyWith<_$TravelerPriceModelImpl> get copyWith =>
      __$$TravelerPriceModelImplCopyWithImpl<_$TravelerPriceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelerPriceModelImplToJson(
      this,
    );
  }
}

abstract class _TravelerPriceModel extends TravelerPriceModel {
  const factory _TravelerPriceModel(
      {final double adult,
      final double child,
      final double infant}) = _$TravelerPriceModelImpl;
  const _TravelerPriceModel._() : super._();

  factory _TravelerPriceModel.fromJson(Map<String, dynamic> json) =
      _$TravelerPriceModelImpl.fromJson;

  @override
  double get adult;
  @override
  double get child;
  @override
  double get infant;
  @override
  @JsonKey(ignore: true)
  _$$TravelerPriceModelImplCopyWith<_$TravelerPriceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlightSegmentModel _$FlightSegmentModelFromJson(Map<String, dynamic> json) {
  return _FlightSegmentModel.fromJson(json);
}

/// @nodoc
mixin _$FlightSegmentModel {
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
  AirlineDetailsModel get airlineDetails => throw _privateConstructorUsedError;
  String? get marriageGroup => throw _privateConstructorUsedError;
  String get bookingClass => throw _privateConstructorUsedError;
  String get baggage => throw _privateConstructorUsedError;
  bool get overnight => throw _privateConstructorUsedError;
  int? get layover => throw _privateConstructorUsedError;
  bool get refundable => throw _privateConstructorUsedError;
  List<String> get fareRules => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightSegmentModelCopyWith<FlightSegmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightSegmentModelCopyWith<$Res> {
  factory $FlightSegmentModelCopyWith(
          FlightSegmentModel value, $Res Function(FlightSegmentModel) then) =
      _$FlightSegmentModelCopyWithImpl<$Res, FlightSegmentModel>;
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
      AirlineDetailsModel airlineDetails,
      String? marriageGroup,
      String bookingClass,
      String baggage,
      bool overnight,
      int? layover,
      bool refundable,
      List<String> fareRules});

  $AirlineDetailsModelCopyWith<$Res> get airlineDetails;
}

/// @nodoc
class _$FlightSegmentModelCopyWithImpl<$Res, $Val extends FlightSegmentModel>
    implements $FlightSegmentModelCopyWith<$Res> {
  _$FlightSegmentModelCopyWithImpl(this._value, this._then);

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
    Object? refundable = null,
    Object? fareRules = null,
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
              as AirlineDetailsModel,
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
      refundable: null == refundable
          ? _value.refundable
          : refundable // ignore: cast_nullable_to_non_nullable
              as bool,
      fareRules: null == fareRules
          ? _value.fareRules
          : fareRules // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AirlineDetailsModelCopyWith<$Res> get airlineDetails {
    return $AirlineDetailsModelCopyWith<$Res>(_value.airlineDetails, (value) {
      return _then(_value.copyWith(airlineDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlightSegmentModelImplCopyWith<$Res>
    implements $FlightSegmentModelCopyWith<$Res> {
  factory _$$FlightSegmentModelImplCopyWith(_$FlightSegmentModelImpl value,
          $Res Function(_$FlightSegmentModelImpl) then) =
      __$$FlightSegmentModelImplCopyWithImpl<$Res>;
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
      AirlineDetailsModel airlineDetails,
      String? marriageGroup,
      String bookingClass,
      String baggage,
      bool overnight,
      int? layover,
      bool refundable,
      List<String> fareRules});

  @override
  $AirlineDetailsModelCopyWith<$Res> get airlineDetails;
}

/// @nodoc
class __$$FlightSegmentModelImplCopyWithImpl<$Res>
    extends _$FlightSegmentModelCopyWithImpl<$Res, _$FlightSegmentModelImpl>
    implements _$$FlightSegmentModelImplCopyWith<$Res> {
  __$$FlightSegmentModelImplCopyWithImpl(_$FlightSegmentModelImpl _value,
      $Res Function(_$FlightSegmentModelImpl) _then)
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
    Object? refundable = null,
    Object? fareRules = null,
  }) {
    return _then(_$FlightSegmentModelImpl(
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
              as AirlineDetailsModel,
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
      refundable: null == refundable
          ? _value.refundable
          : refundable // ignore: cast_nullable_to_non_nullable
              as bool,
      fareRules: null == fareRules
          ? _value._fareRules
          : fareRules // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightSegmentModelImpl extends _FlightSegmentModel {
  const _$FlightSegmentModelImpl(
      {required this.airportFrom,
      required this.airportTo,
      required this.departureTime,
      required this.arrivalTime,
      required this.flightNumber,
      this.cabinType = 'economy',
      this.duration = 0,
      this.equipmentType = '',
      this.operatingAirline = '',
      this.marketingAirline = '',
      required this.airlineDetails,
      this.marriageGroup,
      this.bookingClass = '',
      this.baggage = '',
      this.overnight = false,
      this.layover,
      this.refundable = false,
      final List<String> fareRules = const []})
      : _fareRules = fareRules,
        super._();

  factory _$FlightSegmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightSegmentModelImplFromJson(json);

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
  @JsonKey()
  final String cabinType;
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final String equipmentType;
  @override
  @JsonKey()
  final String operatingAirline;
  @override
  @JsonKey()
  final String marketingAirline;
  @override
  final AirlineDetailsModel airlineDetails;
  @override
  final String? marriageGroup;
  @override
  @JsonKey()
  final String bookingClass;
  @override
  @JsonKey()
  final String baggage;
  @override
  @JsonKey()
  final bool overnight;
  @override
  final int? layover;
  @override
  @JsonKey()
  final bool refundable;
  final List<String> _fareRules;
  @override
  @JsonKey()
  List<String> get fareRules {
    if (_fareRules is EqualUnmodifiableListView) return _fareRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fareRules);
  }

  @override
  String toString() {
    return 'FlightSegmentModel(airportFrom: $airportFrom, airportTo: $airportTo, departureTime: $departureTime, arrivalTime: $arrivalTime, flightNumber: $flightNumber, cabinType: $cabinType, duration: $duration, equipmentType: $equipmentType, operatingAirline: $operatingAirline, marketingAirline: $marketingAirline, airlineDetails: $airlineDetails, marriageGroup: $marriageGroup, bookingClass: $bookingClass, baggage: $baggage, overnight: $overnight, layover: $layover, refundable: $refundable, fareRules: $fareRules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightSegmentModelImpl &&
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
            (identical(other.layover, layover) || other.layover == layover) &&
            (identical(other.refundable, refundable) ||
                other.refundable == refundable) &&
            const DeepCollectionEquality()
                .equals(other._fareRules, _fareRules));
  }

  @JsonKey(ignore: true)
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
      layover,
      refundable,
      const DeepCollectionEquality().hash(_fareRules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightSegmentModelImplCopyWith<_$FlightSegmentModelImpl> get copyWith =>
      __$$FlightSegmentModelImplCopyWithImpl<_$FlightSegmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightSegmentModelImplToJson(
      this,
    );
  }
}

abstract class _FlightSegmentModel extends FlightSegmentModel {
  const factory _FlightSegmentModel(
      {required final String airportFrom,
      required final String airportTo,
      required final String departureTime,
      required final String arrivalTime,
      required final String flightNumber,
      final String cabinType,
      final int duration,
      final String equipmentType,
      final String operatingAirline,
      final String marketingAirline,
      required final AirlineDetailsModel airlineDetails,
      final String? marriageGroup,
      final String bookingClass,
      final String baggage,
      final bool overnight,
      final int? layover,
      final bool refundable,
      final List<String> fareRules}) = _$FlightSegmentModelImpl;
  const _FlightSegmentModel._() : super._();

  factory _FlightSegmentModel.fromJson(Map<String, dynamic> json) =
      _$FlightSegmentModelImpl.fromJson;

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
  AirlineDetailsModel get airlineDetails;
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
  bool get refundable;
  @override
  List<String> get fareRules;
  @override
  @JsonKey(ignore: true)
  _$$FlightSegmentModelImplCopyWith<_$FlightSegmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AirlineDetailsModel _$AirlineDetailsModelFromJson(Map<String, dynamic> json) {
  return _AirlineDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$AirlineDetailsModel {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AirlineDetailsModelCopyWith<AirlineDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirlineDetailsModelCopyWith<$Res> {
  factory $AirlineDetailsModelCopyWith(
          AirlineDetailsModel value, $Res Function(AirlineDetailsModel) then) =
      _$AirlineDetailsModelCopyWithImpl<$Res, AirlineDetailsModel>;
  @useResult
  $Res call({String code, String name, String logo});
}

/// @nodoc
class _$AirlineDetailsModelCopyWithImpl<$Res, $Val extends AirlineDetailsModel>
    implements $AirlineDetailsModelCopyWith<$Res> {
  _$AirlineDetailsModelCopyWithImpl(this._value, this._then);

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
abstract class _$$AirlineDetailsModelImplCopyWith<$Res>
    implements $AirlineDetailsModelCopyWith<$Res> {
  factory _$$AirlineDetailsModelImplCopyWith(_$AirlineDetailsModelImpl value,
          $Res Function(_$AirlineDetailsModelImpl) then) =
      __$$AirlineDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String logo});
}

/// @nodoc
class __$$AirlineDetailsModelImplCopyWithImpl<$Res>
    extends _$AirlineDetailsModelCopyWithImpl<$Res, _$AirlineDetailsModelImpl>
    implements _$$AirlineDetailsModelImplCopyWith<$Res> {
  __$$AirlineDetailsModelImplCopyWithImpl(_$AirlineDetailsModelImpl _value,
      $Res Function(_$AirlineDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? logo = null,
  }) {
    return _then(_$AirlineDetailsModelImpl(
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
@JsonSerializable()
class _$AirlineDetailsModelImpl extends _AirlineDetailsModel {
  const _$AirlineDetailsModelImpl(
      {this.code = '', this.name = '', this.logo = ''})
      : super._();

  factory _$AirlineDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirlineDetailsModelImplFromJson(json);

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String logo;

  @override
  String toString() {
    return 'AirlineDetailsModel(code: $code, name: $name, logo: $logo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirlineDetailsModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, logo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AirlineDetailsModelImplCopyWith<_$AirlineDetailsModelImpl> get copyWith =>
      __$$AirlineDetailsModelImplCopyWithImpl<_$AirlineDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AirlineDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _AirlineDetailsModel extends AirlineDetailsModel {
  const factory _AirlineDetailsModel(
      {final String code,
      final String name,
      final String logo}) = _$AirlineDetailsModelImpl;
  const _AirlineDetailsModel._() : super._();

  factory _AirlineDetailsModel.fromJson(Map<String, dynamic> json) =
      _$AirlineDetailsModelImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get logo;
  @override
  @JsonKey(ignore: true)
  _$$AirlineDetailsModelImplCopyWith<_$AirlineDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlightConfirmationModel _$FlightConfirmationModelFromJson(
    Map<String, dynamic> json) {
  return _FlightConfirmationModel.fromJson(json);
}

/// @nodoc
mixin _$FlightConfirmationModel {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  int get bookableSeats => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  bool get documentRequired => throw _privateConstructorUsedError;
  String? get expiresAt => throw _privateConstructorUsedError;
  bool get priceChange => throw _privateConstructorUsedError;
  String get bookingId => throw _privateConstructorUsedError;
  String get bookingReference => throw _privateConstructorUsedError;
  List<FlightSegmentModel> get outbound => throw _privateConstructorUsedError;
  List<FlightSegmentModel> get inbound => throw _privateConstructorUsedError;
  int get outboundStops => throw _privateConstructorUsedError;
  int get inboundStops => throw _privateConstructorUsedError;
  int get totalDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightConfirmationModelCopyWith<FlightConfirmationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightConfirmationModelCopyWith<$Res> {
  factory $FlightConfirmationModelCopyWith(FlightConfirmationModel value,
          $Res Function(FlightConfirmationModel) then) =
      _$FlightConfirmationModelCopyWithImpl<$Res, FlightConfirmationModel>;
  @useResult
  $Res call(
      {String id,
      double amount,
      int bookableSeats,
      String currency,
      bool documentRequired,
      String? expiresAt,
      bool priceChange,
      String bookingId,
      String bookingReference,
      List<FlightSegmentModel> outbound,
      List<FlightSegmentModel> inbound,
      int outboundStops,
      int inboundStops,
      int totalDuration});
}

/// @nodoc
class _$FlightConfirmationModelCopyWithImpl<$Res,
        $Val extends FlightConfirmationModel>
    implements $FlightConfirmationModelCopyWith<$Res> {
  _$FlightConfirmationModelCopyWithImpl(this._value, this._then);

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
    Object? expiresAt = freezed,
    Object? priceChange = null,
    Object? bookingId = null,
    Object? bookingReference = null,
    Object? outbound = null,
    Object? inbound = null,
    Object? outboundStops = null,
    Object? inboundStops = null,
    Object? totalDuration = null,
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
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<FlightSegmentModel>,
      inbound: null == inbound
          ? _value.inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
      outboundStops: null == outboundStops
          ? _value.outboundStops
          : outboundStops // ignore: cast_nullable_to_non_nullable
              as int,
      inboundStops: null == inboundStops
          ? _value.inboundStops
          : inboundStops // ignore: cast_nullable_to_non_nullable
              as int,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlightConfirmationModelImplCopyWith<$Res>
    implements $FlightConfirmationModelCopyWith<$Res> {
  factory _$$FlightConfirmationModelImplCopyWith(
          _$FlightConfirmationModelImpl value,
          $Res Function(_$FlightConfirmationModelImpl) then) =
      __$$FlightConfirmationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      int bookableSeats,
      String currency,
      bool documentRequired,
      String? expiresAt,
      bool priceChange,
      String bookingId,
      String bookingReference,
      List<FlightSegmentModel> outbound,
      List<FlightSegmentModel> inbound,
      int outboundStops,
      int inboundStops,
      int totalDuration});
}

/// @nodoc
class __$$FlightConfirmationModelImplCopyWithImpl<$Res>
    extends _$FlightConfirmationModelCopyWithImpl<$Res,
        _$FlightConfirmationModelImpl>
    implements _$$FlightConfirmationModelImplCopyWith<$Res> {
  __$$FlightConfirmationModelImplCopyWithImpl(
      _$FlightConfirmationModelImpl _value,
      $Res Function(_$FlightConfirmationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? bookableSeats = null,
    Object? currency = null,
    Object? documentRequired = null,
    Object? expiresAt = freezed,
    Object? priceChange = null,
    Object? bookingId = null,
    Object? bookingReference = null,
    Object? outbound = null,
    Object? inbound = null,
    Object? outboundStops = null,
    Object? inboundStops = null,
    Object? totalDuration = null,
  }) {
    return _then(_$FlightConfirmationModelImpl(
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
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<FlightSegmentModel>,
      inbound: null == inbound
          ? _value._inbound
          : inbound // ignore: cast_nullable_to_non_nullable
              as List<FlightSegmentModel>,
      outboundStops: null == outboundStops
          ? _value.outboundStops
          : outboundStops // ignore: cast_nullable_to_non_nullable
              as int,
      inboundStops: null == inboundStops
          ? _value.inboundStops
          : inboundStops // ignore: cast_nullable_to_non_nullable
              as int,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightConfirmationModelImpl extends _FlightConfirmationModel {
  const _$FlightConfirmationModelImpl(
      {required this.id,
      required this.amount,
      this.bookableSeats = 0,
      this.currency = 'NGN',
      this.documentRequired = false,
      this.expiresAt,
      this.priceChange = false,
      required this.bookingId,
      required this.bookingReference,
      final List<FlightSegmentModel> outbound = const [],
      final List<FlightSegmentModel> inbound = const [],
      this.outboundStops = 0,
      this.inboundStops = 0,
      this.totalDuration = 0})
      : _outbound = outbound,
        _inbound = inbound,
        super._();

  factory _$FlightConfirmationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightConfirmationModelImplFromJson(json);

  @override
  final String id;
  @override
  final double amount;
  @override
  @JsonKey()
  final int bookableSeats;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final bool documentRequired;
  @override
  final String? expiresAt;
  @override
  @JsonKey()
  final bool priceChange;
  @override
  final String bookingId;
  @override
  final String bookingReference;
  final List<FlightSegmentModel> _outbound;
  @override
  @JsonKey()
  List<FlightSegmentModel> get outbound {
    if (_outbound is EqualUnmodifiableListView) return _outbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outbound);
  }

  final List<FlightSegmentModel> _inbound;
  @override
  @JsonKey()
  List<FlightSegmentModel> get inbound {
    if (_inbound is EqualUnmodifiableListView) return _inbound;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inbound);
  }

  @override
  @JsonKey()
  final int outboundStops;
  @override
  @JsonKey()
  final int inboundStops;
  @override
  @JsonKey()
  final int totalDuration;

  @override
  String toString() {
    return 'FlightConfirmationModel(id: $id, amount: $amount, bookableSeats: $bookableSeats, currency: $currency, documentRequired: $documentRequired, expiresAt: $expiresAt, priceChange: $priceChange, bookingId: $bookingId, bookingReference: $bookingReference, outbound: $outbound, inbound: $inbound, outboundStops: $outboundStops, inboundStops: $inboundStops, totalDuration: $totalDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightConfirmationModelImpl &&
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
            const DeepCollectionEquality().equals(other._inbound, _inbound) &&
            (identical(other.outboundStops, outboundStops) ||
                other.outboundStops == outboundStops) &&
            (identical(other.inboundStops, inboundStops) ||
                other.inboundStops == inboundStops) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration));
  }

  @JsonKey(ignore: true)
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
      const DeepCollectionEquality().hash(_inbound),
      outboundStops,
      inboundStops,
      totalDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightConfirmationModelImplCopyWith<_$FlightConfirmationModelImpl>
      get copyWith => __$$FlightConfirmationModelImplCopyWithImpl<
          _$FlightConfirmationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightConfirmationModelImplToJson(
      this,
    );
  }
}

abstract class _FlightConfirmationModel extends FlightConfirmationModel {
  const factory _FlightConfirmationModel(
      {required final String id,
      required final double amount,
      final int bookableSeats,
      final String currency,
      final bool documentRequired,
      final String? expiresAt,
      final bool priceChange,
      required final String bookingId,
      required final String bookingReference,
      final List<FlightSegmentModel> outbound,
      final List<FlightSegmentModel> inbound,
      final int outboundStops,
      final int inboundStops,
      final int totalDuration}) = _$FlightConfirmationModelImpl;
  const _FlightConfirmationModel._() : super._();

  factory _FlightConfirmationModel.fromJson(Map<String, dynamic> json) =
      _$FlightConfirmationModelImpl.fromJson;

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
  String? get expiresAt;
  @override
  bool get priceChange;
  @override
  String get bookingId;
  @override
  String get bookingReference;
  @override
  List<FlightSegmentModel> get outbound;
  @override
  List<FlightSegmentModel> get inbound;
  @override
  int get outboundStops;
  @override
  int get inboundStops;
  @override
  int get totalDuration;
  @override
  @JsonKey(ignore: true)
  _$$FlightConfirmationModelImplCopyWith<_$FlightConfirmationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FlightBookingResponseModel _$FlightBookingResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FlightBookingResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FlightBookingResponseModel {
  String get message => throw _privateConstructorUsedError;
  String get bookingReference => throw _privateConstructorUsedError;
  String get providerReference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightBookingResponseModelCopyWith<FlightBookingResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightBookingResponseModelCopyWith<$Res> {
  factory $FlightBookingResponseModelCopyWith(FlightBookingResponseModel value,
          $Res Function(FlightBookingResponseModel) then) =
      _$FlightBookingResponseModelCopyWithImpl<$Res,
          FlightBookingResponseModel>;
  @useResult
  $Res call(
      {String message, String bookingReference, String providerReference});
}

/// @nodoc
class _$FlightBookingResponseModelCopyWithImpl<$Res,
        $Val extends FlightBookingResponseModel>
    implements $FlightBookingResponseModelCopyWith<$Res> {
  _$FlightBookingResponseModelCopyWithImpl(this._value, this._then);

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
abstract class _$$FlightBookingResponseModelImplCopyWith<$Res>
    implements $FlightBookingResponseModelCopyWith<$Res> {
  factory _$$FlightBookingResponseModelImplCopyWith(
          _$FlightBookingResponseModelImpl value,
          $Res Function(_$FlightBookingResponseModelImpl) then) =
      __$$FlightBookingResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, String bookingReference, String providerReference});
}

/// @nodoc
class __$$FlightBookingResponseModelImplCopyWithImpl<$Res>
    extends _$FlightBookingResponseModelCopyWithImpl<$Res,
        _$FlightBookingResponseModelImpl>
    implements _$$FlightBookingResponseModelImplCopyWith<$Res> {
  __$$FlightBookingResponseModelImplCopyWithImpl(
      _$FlightBookingResponseModelImpl _value,
      $Res Function(_$FlightBookingResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? bookingReference = null,
    Object? providerReference = null,
  }) {
    return _then(_$FlightBookingResponseModelImpl(
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
@JsonSerializable()
class _$FlightBookingResponseModelImpl extends _FlightBookingResponseModel {
  const _$FlightBookingResponseModelImpl(
      {required this.message,
      required this.bookingReference,
      required this.providerReference})
      : super._();

  factory _$FlightBookingResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FlightBookingResponseModelImplFromJson(json);

  @override
  final String message;
  @override
  final String bookingReference;
  @override
  final String providerReference;

  @override
  String toString() {
    return 'FlightBookingResponseModel(message: $message, bookingReference: $bookingReference, providerReference: $providerReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightBookingResponseModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.bookingReference, bookingReference) ||
                other.bookingReference == bookingReference) &&
            (identical(other.providerReference, providerReference) ||
                other.providerReference == providerReference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, bookingReference, providerReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightBookingResponseModelImplCopyWith<_$FlightBookingResponseModelImpl>
      get copyWith => __$$FlightBookingResponseModelImplCopyWithImpl<
          _$FlightBookingResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightBookingResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FlightBookingResponseModel extends FlightBookingResponseModel {
  const factory _FlightBookingResponseModel(
          {required final String message,
          required final String bookingReference,
          required final String providerReference}) =
      _$FlightBookingResponseModelImpl;
  const _FlightBookingResponseModel._() : super._();

  factory _FlightBookingResponseModel.fromJson(Map<String, dynamic> json) =
      _$FlightBookingResponseModelImpl.fromJson;

  @override
  String get message;
  @override
  String get bookingReference;
  @override
  String get providerReference;
  @override
  @JsonKey(ignore: true)
  _$$FlightBookingResponseModelImplCopyWith<_$FlightBookingResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
