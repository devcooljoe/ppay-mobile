import 'package:flutter/material.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

/// Utility class for consistent transaction amount styling across the app.
/// Used by transaction history list, home page transactions, and transaction details.
class TransactionAmountUtils {
  TransactionAmountUtils._();

  /// Returns the appropriate color for a transaction amount based on status and type.
  /// - Failed/Pending: gray
  /// - Credit (money in): green
  /// - Debit (money out): red
  static Color getAmountColor(TransactionStatus status, bool isCredit) {
    if (status == TransactionStatus.failed) {
      return PPaymobileColors.svgIconColor;
    }
    if (status == TransactionStatus.pending) {
      return PPaymobileColors.svgIconColor;
    }
    return isCredit
        ? PPaymobileColors.buttonColor
        : PPaymobileColors.redTextfield;
  }

  /// Returns the sign prefix for a transaction amount.
  /// - Credit: '+'
  /// - Debit: '-'
  static String getAmountPrefix(bool isCredit) {
    return isCredit ? '+' : '-';
  }
}
