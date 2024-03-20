// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_scheme_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkSchemeDetails _$NetworkSchemeDetailsFromJson(
        Map<String, dynamic> json) =>
    NetworkSchemeDetails(
      name1: json['name1'] as String? ?? '',
      name2: json['name2'] as String? ?? '',
      details: json['details'] as String? ?? '',
      highlights: json['highlights'] as String? ?? '',
      minInvestment: json['minInvestment'] as int? ?? -1,
      tenure: json['tenure'] as int? ?? -1,
      tenureUnit: json['tenureUnit'] as String? ?? '',
      netYield: (json['netYield'] as num?)?.toDouble() ?? -1,
      capRaisedPercentage:
          (json['capRaisedPercentage'] as num?)?.toDouble() ?? -1,
      capRaised: (json['capRaised'] as num?)?.toDouble() ?? -1,
      totalDeals: json['totalDeals'] as int? ?? -1,
      activeDeals: json['activeDeals'] as int? ?? -1,
      maturedDeals: json['maturedDeals'] as int? ?? -1,
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
      'name1': instance.name1,
      'name2': instance.name2,
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
