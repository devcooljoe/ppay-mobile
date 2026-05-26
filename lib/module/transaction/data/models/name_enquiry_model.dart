import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/name_enquiry_entity.dart';

part 'name_enquiry_model.freezed.dart';
part 'name_enquiry_model.g.dart';

@freezed
class NameEnquiryModel with _$NameEnquiryModel {
  const factory NameEnquiryModel({
    required String accountName,
  }) = _NameEnquiryModel;

  const NameEnquiryModel._();

  factory NameEnquiryModel.fromJson(Map<String, dynamic> json) => _$NameEnquiryModelFromJson(json);

  NameEnquiryEntity toEntity() => NameEnquiryEntity(accountName: accountName);
}
