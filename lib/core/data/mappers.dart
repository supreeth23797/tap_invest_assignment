import 'package:tapinvest/core/models/scheme_details.dart';
import 'package:tapinvest/core/network/models/network_scheme_details.dart';

extension SchemeDetailsMapper on NetworkSchemeDetails {
  SchemeDetails asModel() => SchemeDetails(name: name);
}
