// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_scheme_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkSchemeDetails _$NetworkSchemeDetailsFromJson(
        Map<String, dynamic> json) =>
    NetworkSchemeDetails(
      name: json['name'] as String? ?? '',
      details: json['details'] as String? ?? '',
      highlights: json['highlights'] as String? ?? '',
      minInvestment: json['minInvestment'] as int? ?? -1,
      tenure: json['tenure'] as int? ?? -1,
      tenureUnit: json['tenureUnit'] as String? ?? '',
      netYield: (json['netYield'] as num?)?.toDouble() ?? -1,
      capRaisedPercentage:
          (json['capRaisedPercentage'] as num?)?.toDouble() ?? -1,
      capRaised: (json['capRaised'] as num?)?.toDouble() ?? -1,
      totalDeals: (json['totalDeals'] as num?)?.toDouble() ?? -1,
      activeDeals: (json['activeDeals'] as num?)?.toDouble() ?? -1,
      maturedDeals: (json['maturedDeals'] as num?)?.toDouble() ?? -1,
      onTimePaymentPercentage:
          (json['onTimePaymentPercentage'] as num?)?.toDouble() ?? -1,
      invoiceDiscountingContract:
          json['invoiceDiscountingContract'] as String? ?? '',
      companyPitchDeck: json['companyPitchDeck'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$NetworkSchemeDetailsToJson(
        NetworkSchemeDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      'highlights': instance.highlights,
      'minInvestment': instance.minInvestment,
      'tenure': instance.tenure,
      'tenureUnit': instance.tenureUnit,
      'netYield': instance.netYield,
      'capRaisedPercentage': instance.capRaisedPercentage,
      'capRaised': instance.capRaised,
      'totalDeals': instance.totalDeals,
      'activeDeals': instance.activeDeals,
      'maturedDeals': instance.maturedDeals,
      'onTimePaymentPercentage': instance.onTimePaymentPercentage,
      'invoiceDiscountingContract': instance.invoiceDiscountingContract,
      'companyPitchDeck': instance.companyPitchDeck,
      'logo': instance.logo,
    };
