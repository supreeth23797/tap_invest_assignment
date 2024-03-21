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
