// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_rs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenRs _$RefreshTokenRsFromJson(Map<String, dynamic> json) =>
    RefreshTokenRs(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    )
      ..success = json['success'] as bool
      ..message = json['message'] as String?;

Map<String, dynamic> _$RefreshTokenRsToJson(RefreshTokenRs instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
