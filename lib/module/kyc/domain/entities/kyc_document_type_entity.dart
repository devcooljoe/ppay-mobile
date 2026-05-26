import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_document_type_entity.freezed.dart';

@freezed
class KycDocumentTypeEntity with _$KycDocumentTypeEntity {
  const factory KycDocumentTypeEntity({
    required String idType,
    required String name,
    required String country,
    required bool requiresDob,
    required bool requiresName,
  }) = _KycDocumentTypeEntity;
}
