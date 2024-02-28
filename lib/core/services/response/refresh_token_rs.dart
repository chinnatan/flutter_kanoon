import 'package:flutter_pos/core/services/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_rs.g.dart';

@JsonSerializable(explicitToJson: true)
class RefreshTokenRs extends BaseResponse {
  RefreshTokenRs({this.accessToken, this.refreshToken});

  factory RefreshTokenRs.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRsFromJson(json);

  final String? accessToken;
  final String? refreshToken;

  @override
  Map<String, dynamic> toJson() => _$RefreshTokenRsToJson(this);
}
