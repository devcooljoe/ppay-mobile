import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/kyc_document_type_entity.dart';

part 'kyc_document_type_model.freezed.dart';
part 'kyc_document_type_model.g.dart';

@freezed
class KycDocumentTypeModel with _$KycDocumentTypeModel {
  const factory KycDocumentTypeModel({
    @JsonKey(name: 'id_type') required String idType,
    required String name,
    required String country,
    @JsonKey(name: 'requires_dob') required bool requiresDob,
    @JsonKey(name: 'requires_name') required bool requiresName,
  }) = _KycDocumentTypeModel;

  const KycDocumentTypeModel._();

  factory KycDocumentTypeModel.fromJson(Map<String, dynamic> json) => _$KycDocumentTypeModelFromJson(json);

  KycDocumentTypeEntity toEntity() => KycDocumentTypeEntity(
    idType: idType,
    name: name,
    country: country,
    requiresDob: requiresDob,
    requiresName: requiresName,
  );
}
