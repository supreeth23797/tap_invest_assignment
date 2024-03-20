import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapinvest/core/data/repository.dart';
import 'package:tapinvest/core/models/scheme_details.dart';

final getSchemeDetailsProvider = FutureProvider.autoDispose
    .family<SchemeDetails, String>((ref, scheme) async {
  final schemeDetails = await ref.read(repoProvider).getSchemeDetails(scheme);
  return schemeDetails;
});
