import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable(explicitToJson: true)
class UserInfo {
  UserInfo(
      {this.id,
      this.username,
      this.fullname,
      this.token,
      this.refreshToken,
      this.storeId,
      this.storeName});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  final int? id;
  final String? username;
  final String? fullname;
  String? token;
  String? refreshToken;
  final int? storeId;
  final String? storeName;

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
