import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapinvest/core/models/scheme_details.dart';

class Repository {
  Repository();

  Future<SchemeDetails> getSchemeDetails(String scheme) async {
    return SchemeDetails(name: 'abc');
  }
}

final repoProvider = Provider((ref) {
  return Repository();
});
