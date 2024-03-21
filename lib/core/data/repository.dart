import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapinvest/core/data/mappers.dart';
import 'package:tapinvest/core/models/scheme_details.dart';
import 'package:tapinvest/core/network/models/network_scheme_details.dart';

import '../network/apis.dart';

class Repository {
  Repository(this.apis);

  final APIs apis;

  Future<SchemeDetails> getSchemeDetails(String scheme) async {
    NetworkSchemeDetails networkSchemeDetails =
        await apis.getSchemeDetails(scheme);
    return networkSchemeDetails.asModel();
  }

  Future<int> makePurchase(double amount) async {
    int resourceId = await apis.makePurchase(amount);
    return resourceId;
  }
}

final repoProvider = Provider((ref) {
  final apis = ref.read(apiProvider);
  return Repository(apis);
});
