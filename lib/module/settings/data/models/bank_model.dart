import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_entity.dart';

part 'bank_model.freezed.dart';
part 'bank_model.g.dart';

@freezed
class BankModel with _$BankModel {
  const factory BankModel({
    @Default('') String bankName,
    @Default('') String bankCode,
    @Default('') String bankAvailability,
    @Default('') String bankStatus,
    @Default('') String bankLogo,
  }) = _BankModel;

  const BankModel._();

  factory BankModel.fromJson(Map<String, dynamic> json) => _$BankModelFromJson(json);

  BankEntity toEntity() => BankEntity(
    bankName: bankName,
    bankCode: bankCode,
    bankAvailability: bankAvailability,
    bankStatus: bankStatus,
    bankLogo: bankLogo,
  );
}
