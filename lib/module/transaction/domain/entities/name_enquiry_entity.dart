import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_enquiry_entity.freezed.dart';

@freezed
class NameEnquiryEntity with _$NameEnquiryEntity {
  const factory NameEnquiryEntity({
    required String accountName,
  }) = _NameEnquiryEntity;
}
