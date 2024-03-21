import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

String getCompactReadableAmount(dynamic amount) {
  return NumberFormat.compact(locale: 'en_IN').format(amount);
}

String getIndianFormattedAmount(dynamic amount, {bool hideCurrency = false}) {
  return NumberFormat.currency(
      symbol: hideCurrency ? '' : CURRENCY,
      locale: 'en_IN',
      decimalDigits: 0)
      .format(amount);
}

String getFormattedFraction(dynamic value) {
  NumberFormat formatter = NumberFormat();
  formatter.minimumFractionDigits = 0;
  formatter.maximumFractionDigits = 2;
  return formatter.format(value);
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    double value = double.parse(newValue.text);
    String newText = getIndianFormattedAmount(value, hideCurrency: true);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

double getNumberFromString(String value) {
  return double.parse(value.replaceAll(',', ''));
}
