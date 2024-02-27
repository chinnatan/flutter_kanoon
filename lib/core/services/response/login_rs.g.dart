// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_rs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRs _$LoginRsFromJson(Map<String, dynamic> json) => LoginRs(
      result: json['result'] == null
          ? null
          : UserInfo.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool
      ..message = json['message'] as String?;

Map<String, dynamic> _$LoginRsToJson(LoginRs instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result?.toJson(),
    };
