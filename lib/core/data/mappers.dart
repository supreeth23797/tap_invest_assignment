import 'package:tapinvest/core/models/scheme_details.dart';
import 'package:tapinvest/core/network/models/network_scheme_details.dart';

extension SchemeDetailsMapper on NetworkSchemeDetails {
  SchemeDetails asModel() => SchemeDetails(
        name: name,
        details: details,
        highlights: highlights,
        tenure: tenure,
        tenureUnit: tenureUnit,
        maturedDeals: maturedDeals,
        activeDeals: activeDeals,
        totalDeals: totalDeals,
        logo: logo,
        onTimePaymentPercentage: onTimePaymentPercentage,
        capRaised: capRaised,
        capRaisedPercentage: capRaisedPercentage,
        companyPitchDeck: companyPitchDeck,
        invoiceDiscountingContract: invoiceDiscountingContract,
        netYield: netYield,
        minInvestment: minInvestment,
      );
}
