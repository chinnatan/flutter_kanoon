import 'package:flutter_pos/core/services/response/base_response.dart';
import 'package:flutter_pos/ui/views/login/model/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_rs.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginRs extends BaseResponse {

  LoginRs({required this.result});

  factory LoginRs.fromJson(Map<String, dynamic> json) =>  _$LoginRsFromJson(json);

  final UserInfo? result;

  Map<String, dynamic> toJson() => _$LoginRsToJson(this);

}