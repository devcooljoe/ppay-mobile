import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';

enum BillType { airtime, data, electricity, tv, betting }

extension BillTypeLabel on BillType {
  String get label {
    switch (this) {
      case BillType.airtime:
        return 'Airtime';
      case BillType.data:
        return 'Data';
      case BillType.electricity:
        return 'Electricity';
      case BillType.tv:
        return 'TV Cable';
      case BillType.betting:
        return 'Betting';
    }
  }

  String get customerIdLabel {
    switch (this) {
      case BillType.airtime:
      case BillType.data:
        return 'Phone Number';
      case BillType.electricity:
        return 'Meter Number';
      case BillType.tv:
        return 'Smart Card Number';
      case BillType.betting:
        return 'User ID';
    }
  }

  String get customerIdHint {
    switch (this) {
      case BillType.airtime:
      case BillType.data:
        return 'Enter phone number';
      case BillType.electricity:
        return 'Enter meter number';
      case BillType.tv:
        return 'Enter smart card number';
      case BillType.betting:
        return 'Enter user ID';
    }
  }

  bool get requiresVerification {
    switch (this) {
      case BillType.airtime:
      case BillType.data:
        return false;
      case BillType.electricity:
      case BillType.tv:
      case BillType.betting:
        return true;
    }
  }
}

class BillConfirmArgs {
  final BillType billType;
  final BillerEntity biller;
  final BillItemEntity billItem;
  final String customerIdentifier;
  final String customerName;
  final String phoneNumber;
  final double amount;
  final String billerCategory;

  const BillConfirmArgs({
    required this.billType,
    required this.biller,
    required this.billItem,
    required this.customerIdentifier,
    required this.customerName,
    required this.phoneNumber,
    required this.amount,
    required this.billerCategory,
  });
}
