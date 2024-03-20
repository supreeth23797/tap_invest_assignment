import 'package:freezed_annotation/freezed_annotation.dart';

part 'scheme_details.freezed.dart';

@freezed
class SchemeDetails with _$SchemeDetails {
  const factory SchemeDetails({
    required String name1,
    required String name2,
    required String details,
    required String highlights,
    required int minInvestment,
    required int tenure,
    required String tenureUnit,
    required double netYield,
    required double capRaisedPercentage,
    required double capRaised,
    required int totalDeals,
    required int activeDeals,
    required int maturedDeals,
    required double onTimePaymentPercentage,
    required String invoiceDiscountingContract,
    required String companyPitchDeck,
    required String logo,
  }) = _SchemeDetails;
}
