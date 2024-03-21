import '../core/design_system/strings.dart';

String? validateInvestmentAmount(String? value) {
  if (value == null || value.isEmpty) {
    return investmentAmountValidator;
  }
  return null;
}
