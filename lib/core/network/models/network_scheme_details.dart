import 'package:json_annotation/json_annotation.dart';

part 'network_scheme_details.g.dart';

@JsonSerializable(includeIfNull: false)
class NetworkSchemeDetails{
  final String name;

  NetworkSchemeDetails({this.name = ''});

  factory NetworkSchemeDetails.fromJson(Map<String, dynamic> json) =>
      _$NetworkSchemeDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkSchemeDetailsToJson(this);
}
