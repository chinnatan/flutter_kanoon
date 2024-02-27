import 'package:json_annotation/json_annotation.dart';

part 'login_rq.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginRq {
  LoginRq({this.username, this.password});

  factory LoginRq.fromJson(Map<String, dynamic> json) =>
      _$LoginRqFromJson(json);

  String? username;
  String? password;

  Map<String, dynamic> toJson() => _$LoginRqToJson(this);
}
