import 'package:freezed_annotation/freezed_annotation.dart';

part 'scheme_details.freezed.dart';

@freezed
class SchemeDetails with _$SchemeDetails {
  const factory SchemeDetails({
    required String name,
  }) = _SchemeDetails;
}
