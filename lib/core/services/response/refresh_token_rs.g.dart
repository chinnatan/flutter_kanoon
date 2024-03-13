// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_rs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenRs _$RefreshTokenRsFromJson(Map<String, dynamic> json) =>
    RefreshTokenRs(
      result: json['result'] == null
          ? null
          : RefreshTokenResult.fromJson(json['result'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool
      ..message = json['message'] as String?;

Map<String, dynamic> _$RefreshTokenRsToJson(RefreshTokenRs instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result?.toJson(),
    };
