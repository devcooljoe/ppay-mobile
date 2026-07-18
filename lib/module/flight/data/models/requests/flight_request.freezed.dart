// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfirmFlightRequest _$ConfirmFlightRequestFromJson(Map<String, dynamic> json) {
  return _ConfirmFlightRequest.fromJson(json);
}

/// @nodoc
mixin _$ConfirmFlightRequest {
  String get offerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfirmFlightRequestCopyWith<ConfirmFlightRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmFlightRequestCopyWith<$Res> {
  factory $ConfirmFlightRequestCopyWith(ConfirmFlightRequest value,
          $Res Function(ConfirmFlightRequest) then) =
      _$ConfirmFlightRequestCopyWithImpl<$Res, ConfirmFlightRequest>;
  @useResult
  $Res call({String offerId});
}

/// @nodoc
class _$ConfirmFlightRequestCopyWithImpl<$Res,
        $Val extends ConfirmFlightRequest>
    implements $ConfirmFlightRequestCopyWith<$Res> {
  _$ConfirmFlightRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerId = null,
  }) {
    return _then(_value.copyWith(
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfirmFlightRequestImplCopyWith<$Res>
    implements $ConfirmFlightRequestCopyWith<$Res> {
  factory _$$ConfirmFlightRequestImplCopyWith(_$ConfirmFlightRequestImpl value,
          $Res Function(_$ConfirmFlightRequestImpl) then) =
      __$$ConfirmFlightRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String offerId});
}

/// @nodoc
class __$$ConfirmFlightRequestImplCopyWithImpl<$Res>
    extends _$ConfirmFlightRequestCopyWithImpl<$Res, _$ConfirmFlightRequestImpl>
    implements _$$ConfirmFlightRequestImplCopyWith<$Res> {
  __$$ConfirmFlightRequestImplCopyWithImpl(_$ConfirmFlightRequestImpl _value,
      $Res Function(_$ConfirmFlightRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerId = null,
  }) {
    return _then(_$ConfirmFlightRequestImpl(
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfirmFlightRequestImpl implements _ConfirmFlightRequest {
  const _$ConfirmFlightRequestImpl({required this.offerId});

  factory _$ConfirmFlightRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfirmFlightRequestImplFromJson(json);

  @override
  final String offerId;

  @override
  String toString() {
    return 'ConfirmFlightRequest(offerId: $offerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmFlightRequestImpl &&
            (identical(other.offerId, offerId) || other.offerId == offerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, offerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmFlightRequestImplCopyWith<_$ConfirmFlightRequestImpl>
      get copyWith =>
          __$$ConfirmFlightRequestImplCopyWithImpl<_$ConfirmFlightRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmFlightRequestImplToJson(
      this,
    );
  }
}

abstract class _ConfirmFlightRequest implements ConfirmFlightRequest {
  const factory _ConfirmFlightRequest({required final String offerId}) =
      _$ConfirmFlightRequestImpl;

  factory _ConfirmFlightRequest.fromJson(Map<String, dynamic> json) =
      _$ConfirmFlightRequestImpl.fromJson;

  @override
  String get offerId;
  @override
  @JsonKey(ignore: true)
  _$$ConfirmFlightRequestImplCopyWith<_$ConfirmFlightRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BookFlightRequest _$BookFlightRequestFromJson(Map<String, dynamic> json) {
  return _BookFlightRequest.fromJson(json);
}

/// @nodoc
mixin _$BookFlightRequest {
  String get offerId => throw _privateConstructorUsedError;
  List<PassengerRequest> get passengers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookFlightRequestCopyWith<BookFlightRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookFlightRequestCopyWith<$Res> {
  factory $BookFlightRequestCopyWith(
          BookFlightRequest value, $Res Function(BookFlightRequest) then) =
      _$BookFlightRequestCopyWithImpl<$Res, BookFlightRequest>;
  @useResult
  $Res call({String offerId, List<PassengerRequest> passengers});
}

/// @nodoc
class _$BookFlightRequestCopyWithImpl<$Res, $Val extends BookFlightRequest>
    implements $BookFlightRequestCopyWith<$Res> {
  _$BookFlightRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerId = null,
    Object? passengers = null,
  }) {
    return _then(_value.copyWith(
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as String,
      passengers: null == passengers
          ? _value.passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as List<PassengerRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookFlightRequestImplCopyWith<$Res>
    implements $BookFlightRequestCopyWith<$Res> {
  factory _$$BookFlightRequestImplCopyWith(_$BookFlightRequestImpl value,
          $Res Function(_$BookFlightRequestImpl) then) =
      __$$BookFlightRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String offerId, List<PassengerRequest> passengers});
}

/// @nodoc
class __$$BookFlightRequestImplCopyWithImpl<$Res>
    extends _$BookFlightRequestCopyWithImpl<$Res, _$BookFlightRequestImpl>
    implements _$$BookFlightRequestImplCopyWith<$Res> {
  __$$BookFlightRequestImplCopyWithImpl(_$BookFlightRequestImpl _value,
      $Res Function(_$BookFlightRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerId = null,
    Object? passengers = null,
  }) {
    return _then(_$BookFlightRequestImpl(
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as String,
      passengers: null == passengers
          ? _value._passengers
          : passengers // ignore: cast_nullable_to_non_nullable
              as List<PassengerRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookFlightRequestImpl implements _BookFlightRequest {
  const _$BookFlightRequestImpl(
      {required this.offerId, required final List<PassengerRequest> passengers})
      : _passengers = passengers;

  factory _$BookFlightRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookFlightRequestImplFromJson(json);

  @override
  final String offerId;
  final List<PassengerRequest> _passengers;
  @override
  List<PassengerRequest> get passengers {
    if (_passengers is EqualUnmodifiableListView) return _passengers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_passengers);
  }

  @override
  String toString() {
    return 'BookFlightRequest(offerId: $offerId, passengers: $passengers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookFlightRequestImpl &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            const DeepCollectionEquality()
                .equals(other._passengers, _passengers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, offerId, const DeepCollectionEquality().hash(_passengers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookFlightRequestImplCopyWith<_$BookFlightRequestImpl> get copyWith =>
      __$$BookFlightRequestImplCopyWithImpl<_$BookFlightRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookFlightRequestImplToJson(
      this,
    );
  }
}

abstract class _BookFlightRequest implements BookFlightRequest {
  const factory _BookFlightRequest(
          {required final String offerId,
          required final List<PassengerRequest> passengers}) =
      _$BookFlightRequestImpl;

  factory _BookFlightRequest.fromJson(Map<String, dynamic> json) =
      _$BookFlightRequestImpl.fromJson;

  @override
  String get offerId;
  @override
  List<PassengerRequest> get passengers;
  @override
  @JsonKey(ignore: true)
  _$$BookFlightRequestImplCopyWith<_$BookFlightRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PassengerRequest _$PassengerRequestFromJson(Map<String, dynamic> json) {
  return _PassengerRequest.fromJson(json);
}

/// @nodoc
mixin _$PassengerRequest {
  String get passengerType => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  PassengerDocumentRequest? get documents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassengerRequestCopyWith<PassengerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassengerRequestCopyWith<$Res> {
  factory $PassengerRequestCopyWith(
          PassengerRequest value, $Res Function(PassengerRequest) then) =
      _$PassengerRequestCopyWithImpl<$Res, PassengerRequest>;
  @useResult
  $Res call(
      {String passengerType,
      String firstName,
      String lastName,
      String title,
      String dob,
      String gender,
      String email,
      String phoneNumber,
      PassengerDocumentRequest? documents});

  $PassengerDocumentRequestCopyWith<$Res>? get documents;
}

/// @nodoc
class _$PassengerRequestCopyWithImpl<$Res, $Val extends PassengerRequest>
    implements $PassengerRequestCopyWith<$Res> {
  _$PassengerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passengerType = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? title = null,
    Object? dob = null,
    Object? gender = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? documents = freezed,
  }) {
    return _then(_value.copyWith(
      passengerType: null == passengerType
          ? _value.passengerType
          : passengerType // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as PassengerDocumentRequest?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PassengerDocumentRequestCopyWith<$Res>? get documents {
    if (_value.documents == null) {
      return null;
    }

    return $PassengerDocumentRequestCopyWith<$Res>(_value.documents!, (value) {
      return _then(_value.copyWith(documents: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PassengerRequestImplCopyWith<$Res>
    implements $PassengerRequestCopyWith<$Res> {
  factory _$$PassengerRequestImplCopyWith(_$PassengerRequestImpl value,
          $Res Function(_$PassengerRequestImpl) then) =
      __$$PassengerRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String passengerType,
      String firstName,
      String lastName,
      String title,
      String dob,
      String gender,
      String email,
      String phoneNumber,
      PassengerDocumentRequest? documents});

  @override
  $PassengerDocumentRequestCopyWith<$Res>? get documents;
}

/// @nodoc
class __$$PassengerRequestImplCopyWithImpl<$Res>
    extends _$PassengerRequestCopyWithImpl<$Res, _$PassengerRequestImpl>
    implements _$$PassengerRequestImplCopyWith<$Res> {
  __$$PassengerRequestImplCopyWithImpl(_$PassengerRequestImpl _value,
      $Res Function(_$PassengerRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passengerType = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? title = null,
    Object? dob = null,
    Object? gender = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? documents = freezed,
  }) {
    return _then(_$PassengerRequestImpl(
      passengerType: null == passengerType
          ? _value.passengerType
          : passengerType // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as PassengerDocumentRequest?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PassengerRequestImpl implements _PassengerRequest {
  const _$PassengerRequestImpl(
      {required this.passengerType,
      required this.firstName,
      required this.lastName,
      required this.title,
      required this.dob,
      required this.gender,
      required this.email,
      required this.phoneNumber,
      this.documents});

  factory _$PassengerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassengerRequestImplFromJson(json);

  @override
  final String passengerType;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String title;
  @override
  final String dob;
  @override
  final String gender;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final PassengerDocumentRequest? documents;

  @override
  String toString() {
    return 'PassengerRequest(passengerType: $passengerType, firstName: $firstName, lastName: $lastName, title: $title, dob: $dob, gender: $gender, email: $email, phoneNumber: $phoneNumber, documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassengerRequestImpl &&
            (identical(other.passengerType, passengerType) ||
                other.passengerType == passengerType) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.documents, documents) ||
                other.documents == documents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, passengerType, firstName,
      lastName, title, dob, gender, email, phoneNumber, documents);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PassengerRequestImplCopyWith<_$PassengerRequestImpl> get copyWith =>
      __$$PassengerRequestImplCopyWithImpl<_$PassengerRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassengerRequestImplToJson(
      this,
    );
  }
}

abstract class _PassengerRequest implements PassengerRequest {
  const factory _PassengerRequest(
      {required final String passengerType,
      required final String firstName,
      required final String lastName,
      required final String title,
      required final String dob,
      required final String gender,
      required final String email,
      required final String phoneNumber,
      final PassengerDocumentRequest? documents}) = _$PassengerRequestImpl;

  factory _PassengerRequest.fromJson(Map<String, dynamic> json) =
      _$PassengerRequestImpl.fromJson;

  @override
  String get passengerType;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get title;
  @override
  String get dob;
  @override
  String get gender;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  PassengerDocumentRequest? get documents;
  @override
  @JsonKey(ignore: true)
  _$$PassengerRequestImplCopyWith<_$PassengerRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PassengerDocumentRequest _$PassengerDocumentRequestFromJson(
    Map<String, dynamic> json) {
  return _PassengerDocumentRequest.fromJson(json);
}

/// @nodoc
mixin _$PassengerDocumentRequest {
  String get number => throw _privateConstructorUsedError;
  String get issuingDate => throw _privateConstructorUsedError;
  String get expiryDate => throw _privateConstructorUsedError;
  String get issuingCountry => throw _privateConstructorUsedError;
  String get nationalityCountry => throw _privateConstructorUsedError;
  String get documentType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassengerDocumentRequestCopyWith<PassengerDocumentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassengerDocumentRequestCopyWith<$Res> {
  factory $PassengerDocumentRequestCopyWith(PassengerDocumentRequest value,
          $Res Function(PassengerDocumentRequest) then) =
      _$PassengerDocumentRequestCopyWithImpl<$Res, PassengerDocumentRequest>;
  @useResult
  $Res call(
      {String number,
      String issuingDate,
      String expiryDate,
      String issuingCountry,
      String nationalityCountry,
      String documentType});
}

/// @nodoc
class _$PassengerDocumentRequestCopyWithImpl<$Res,
        $Val extends PassengerDocumentRequest>
    implements $PassengerDocumentRequestCopyWith<$Res> {
  _$PassengerDocumentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? issuingDate = null,
    Object? expiryDate = null,
    Object? issuingCountry = null,
    Object? nationalityCountry = null,
    Object? documentType = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      issuingDate: null == issuingDate
          ? _value.issuingDate
          : issuingDate // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      issuingCountry: null == issuingCountry
          ? _value.issuingCountry
          : issuingCountry // ignore: cast_nullable_to_non_nullable
              as String,
      nationalityCountry: null == nationalityCountry
          ? _value.nationalityCountry
          : nationalityCountry // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PassengerDocumentRequestImplCopyWith<$Res>
    implements $PassengerDocumentRequestCopyWith<$Res> {
  factory _$$PassengerDocumentRequestImplCopyWith(
          _$PassengerDocumentRequestImpl value,
          $Res Function(_$PassengerDocumentRequestImpl) then) =
      __$$PassengerDocumentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String number,
      String issuingDate,
      String expiryDate,
      String issuingCountry,
      String nationalityCountry,
      String documentType});
}

/// @nodoc
class __$$PassengerDocumentRequestImplCopyWithImpl<$Res>
    extends _$PassengerDocumentRequestCopyWithImpl<$Res,
        _$PassengerDocumentRequestImpl>
    implements _$$PassengerDocumentRequestImplCopyWith<$Res> {
  __$$PassengerDocumentRequestImplCopyWithImpl(
      _$PassengerDocumentRequestImpl _value,
      $Res Function(_$PassengerDocumentRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? issuingDate = null,
    Object? expiryDate = null,
    Object? issuingCountry = null,
    Object? nationalityCountry = null,
    Object? documentType = null,
  }) {
    return _then(_$PassengerDocumentRequestImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      issuingDate: null == issuingDate
          ? _value.issuingDate
          : issuingDate // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      issuingCountry: null == issuingCountry
          ? _value.issuingCountry
          : issuingCountry // ignore: cast_nullable_to_non_nullable
              as String,
      nationalityCountry: null == nationalityCountry
          ? _value.nationalityCountry
          : nationalityCountry // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PassengerDocumentRequestImpl implements _PassengerDocumentRequest {
  const _$PassengerDocumentRequestImpl(
      {required this.number,
      required this.issuingDate,
      required this.expiryDate,
      required this.issuingCountry,
      required this.nationalityCountry,
      required this.documentType});

  factory _$PassengerDocumentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassengerDocumentRequestImplFromJson(json);

  @override
  final String number;
  @override
  final String issuingDate;
  @override
  final String expiryDate;
  @override
  final String issuingCountry;
  @override
  final String nationalityCountry;
  @override
  final String documentType;

  @override
  String toString() {
    return 'PassengerDocumentRequest(number: $number, issuingDate: $issuingDate, expiryDate: $expiryDate, issuingCountry: $issuingCountry, nationalityCountry: $nationalityCountry, documentType: $documentType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassengerDocumentRequestImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.issuingDate, issuingDate) ||
                other.issuingDate == issuingDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.issuingCountry, issuingCountry) ||
                other.issuingCountry == issuingCountry) &&
            (identical(other.nationalityCountry, nationalityCountry) ||
                other.nationalityCountry == nationalityCountry) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number, issuingDate, expiryDate,
      issuingCountry, nationalityCountry, documentType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PassengerDocumentRequestImplCopyWith<_$PassengerDocumentRequestImpl>
      get copyWith => __$$PassengerDocumentRequestImplCopyWithImpl<
          _$PassengerDocumentRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassengerDocumentRequestImplToJson(
      this,
    );
  }
}

abstract class _PassengerDocumentRequest implements PassengerDocumentRequest {
  const factory _PassengerDocumentRequest(
      {required final String number,
      required final String issuingDate,
      required final String expiryDate,
      required final String issuingCountry,
      required final String nationalityCountry,
      required final String documentType}) = _$PassengerDocumentRequestImpl;

  factory _PassengerDocumentRequest.fromJson(Map<String, dynamic> json) =
      _$PassengerDocumentRequestImpl.fromJson;

  @override
  String get number;
  @override
  String get issuingDate;
  @override
  String get expiryDate;
  @override
  String get issuingCountry;
  @override
  String get nationalityCountry;
  @override
  String get documentType;
  @override
  @JsonKey(ignore: true)
  _$$PassengerDocumentRequestImplCopyWith<_$PassengerDocumentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CancelFlightRequest _$CancelFlightRequestFromJson(Map<String, dynamic> json) {
  return _CancelFlightRequest.fromJson(json);
}

/// @nodoc
mixin _$CancelFlightRequest {
  String get bookingReference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CancelFlightRequestCopyWith<CancelFlightRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelFlightRequestCopyWith<$Res> {
  factory $CancelFlightRequestCopyWith(
          CancelFlightRequest value, $Res Function(CancelFlightRequest) then) =
      _$CancelFlightRequestCopyWithImpl<$Res, CancelFlightRequest>;
  @useResult
  $Res call({String bookingReference});
}

/// @nodoc
class _$CancelFlightRequestCopyWithImpl<$Res, $Val extends CancelFlightRequest>
    implements $CancelFlightRequestCopyWith<$Res> {
  _$CancelFlightRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingReference = null,
  }) {
    return _then(_value.copyWith(
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CancelFlightRequestImplCopyWith<$Res>
    implements $CancelFlightRequestCopyWith<$Res> {
  factory _$$CancelFlightRequestImplCopyWith(_$CancelFlightRequestImpl value,
          $Res Function(_$CancelFlightRequestImpl) then) =
      __$$CancelFlightRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bookingReference});
}

/// @nodoc
class __$$CancelFlightRequestImplCopyWithImpl<$Res>
    extends _$CancelFlightRequestCopyWithImpl<$Res, _$CancelFlightRequestImpl>
    implements _$$CancelFlightRequestImplCopyWith<$Res> {
  __$$CancelFlightRequestImplCopyWithImpl(_$CancelFlightRequestImpl _value,
      $Res Function(_$CancelFlightRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingReference = null,
  }) {
    return _then(_$CancelFlightRequestImpl(
      bookingReference: null == bookingReference
          ? _value.bookingReference
          : bookingReference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelFlightRequestImpl implements _CancelFlightRequest {
  const _$CancelFlightRequestImpl({required this.bookingReference});

  factory _$CancelFlightRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelFlightRequestImplFromJson(json);

  @override
  final String bookingReference;

  @override
  String toString() {
    return 'CancelFlightRequest(bookingReference: $bookingReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelFlightRequestImpl &&
            (identical(other.bookingReference, bookingReference) ||
                other.bookingReference == bookingReference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookingReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelFlightRequestImplCopyWith<_$CancelFlightRequestImpl> get copyWith =>
      __$$CancelFlightRequestImplCopyWithImpl<_$CancelFlightRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelFlightRequestImplToJson(
      this,
    );
  }
}

abstract class _CancelFlightRequest implements CancelFlightRequest {
  const factory _CancelFlightRequest({required final String bookingReference}) =
      _$CancelFlightRequestImpl;

  factory _CancelFlightRequest.fromJson(Map<String, dynamic> json) =
      _$CancelFlightRequestImpl.fromJson;

  @override
  String get bookingReference;
  @override
  @JsonKey(ignore: true)
  _$$CancelFlightRequestImplCopyWith<_$CancelFlightRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
