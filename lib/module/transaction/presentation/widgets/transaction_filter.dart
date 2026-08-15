import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';

class TransactionFilter {
  final TransactionStatus? status;
  final TransactionType? type;
  final DateTime? dateFrom;
  final DateTime? dateTo;

  const TransactionFilter({
    this.status,
    this.type,
    this.dateFrom,
    this.dateTo,
  });

  bool get isEmpty =>
      status == null && type == null && dateFrom == null && dateTo == null;

  TransactionFilter copyWith({
    Object? status = _sentinel,
    Object? type = _sentinel,
    Object? dateFrom = _sentinel,
    Object? dateTo = _sentinel,
  }) {
    return TransactionFilter(
      status: status == _sentinel ? this.status : status as TransactionStatus?,
      type: type == _sentinel ? this.type : type as TransactionType?,
      dateFrom: dateFrom == _sentinel ? this.dateFrom : dateFrom as DateTime?,
      dateTo: dateTo == _sentinel ? this.dateTo : dateTo as DateTime?,
    );
  }
}

const _sentinel = Object();
