import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AmountFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = _formatAsAmount(newValue.text);
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatAsAmount(String text) {
    text = text.replaceAll(RegExp('[^0-9.]'), '');

    int decimalIndex = text.indexOf('.');

    if (decimalIndex == -1) {
      return _formatWholeNumber(text);
    } else {
      String wholeNumber = text.substring(0, decimalIndex);
      String decimalPart = text.substring(decimalIndex + 1);
      return "${_formatWholeNumber(wholeNumber)}.${_formatDecimalPart(decimalPart)}";
    }
  }

  static String formatAmountWithCommas(double amount) {
    final format = NumberFormat("#,##0", "en_US");
    String formattedAmount = format.format(amount);
    return formattedAmount;
  }

  String _formatWholeNumber(String wholeNumber) {
    if (wholeNumber.isEmpty) {
      return '';
    }

    int length = wholeNumber.length;
    String formattedNumber = '';

    for (int i = 0; i < length; i++) {
      formattedNumber += wholeNumber[i];
      if (i < length - 1 && (length - 1 - i) % 3 == 0) {
        formattedNumber += ',';
      }
    }

    return formattedNumber;
  }

  String _formatDecimalPart(String decimalPart) {
    if (decimalPart.length > 2) {
      return decimalPart.substring(0, 2);
    }
    return decimalPart;
  }
}
