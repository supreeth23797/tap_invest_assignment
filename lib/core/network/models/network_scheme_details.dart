import 'package:json_annotation/json_annotation.dart';

part 'network_scheme_details.g.dart';

@JsonSerializable(includeIfNull: false)
class NetworkSchemeDetails {
  final String name;
  final String details;
  final String highlights;
  final int minInvestment;
  final int tenure;
  final String tenureUnit;
  final double netYield;
  final double capRaisedPercentage;
  final double capRaised;
  final int totalDeals;
  final int activeDeals;
  final int maturedDeals;
  final double onTimePaymentPercentage;
  final String invoiceDiscountingContract;
  final String companyPitchDeck;
  final String logo;

  NetworkSchemeDetails(
      {this.name = '',
      this.details = '',
      this.highlights = '',
      this.minInvestment = -1,
      this.tenure = -1,
      this.tenureUnit = '',
      this.netYield = -1,
      this.capRaisedPercentage = -1,
      this.capRaised = -1,
      this.totalDeals = -1,
      this.activeDeals = -1,
      this.maturedDeals = -1,
      this.onTimePaymentPercentage = -1,
      this.invoiceDiscountingContract = '',
      this.companyPitchDeck = '',
      this.logo = ''});

  factory NetworkSchemeDetails.fromJson(Map<String, dynamic> json) =>
      _$NetworkSchemeDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkSchemeDetailsToJson(this);
}
