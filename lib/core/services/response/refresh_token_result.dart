import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_result.g.dart';

@JsonSerializable(explicitToJson: true)
class RefreshTokenResult {
  RefreshTokenResult({this.accessToken, this.refreshToken});

  factory RefreshTokenResult.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResultFromJson(json);

  final String? accessToken;
  final String? refreshToken;

  Map<String, dynamic> toJson() => _$RefreshTokenResultToJson(this);
}
