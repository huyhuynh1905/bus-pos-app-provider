import 'package:json_annotation/json_annotation.dart';

part 'authenticate.g.dart';

@JsonSerializable()
class Authenticate {
  @JsonKey(name: 'accessToken')
  String? accessToken;

  @JsonKey(name: 'refreshToken')
  String? refreshToken;

  @JsonKey(name: 'expired')
  String? expired;

  @JsonKey(name: 'tokenType')
  String? tokenType;

  Authenticate(
    this.accessToken,
    this.refreshToken,
    this.expired,
    this.tokenType,
  );

  factory Authenticate.fromJson(Map<String, dynamic> json) => _$AuthenticateFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateToJson(this);
}
