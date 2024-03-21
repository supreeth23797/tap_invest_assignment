import 'package:intl/intl.dart';

String getCompactReadableAmount(dynamic amount) {
  return NumberFormat.compact(locale: 'en_IN').format(amount);
}

dynamic getIndianFormattedAmount(dynamic amount) {
  return NumberFormat.simpleCurrency(
    locale: 'en_IN',
  ).format(amount);
}

String getFormattedFraction(dynamic value) {
  NumberFormat formatter = NumberFormat();
  formatter.minimumFractionDigits = 0;
  formatter.maximumFractionDigits = 2;
  return formatter.format(value);
}
