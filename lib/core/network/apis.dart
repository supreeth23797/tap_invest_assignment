import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapinvest/core/network/models/network_scheme_details.dart';

class APIs {
  //final DioClient _dioClient;
  APIs();

  Future<NetworkSchemeDetails> getSchemeDetails() async {
    /*APIRequestRepresentable apiRequestRepresentable = APIRequestRepresentable(
        endpoint: 'v1/banks-master', method: HTTPMethod.get);
    Response response = await _dioClient.request(apiRequestRepresentable);*/
    return NetworkSchemeDetails(name: 'abc');
  }
}

final apiProvider = Provider((ref) {
  return APIs();
});