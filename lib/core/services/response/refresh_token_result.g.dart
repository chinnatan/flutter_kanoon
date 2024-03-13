// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenResult _$RefreshTokenResultFromJson(Map<String, dynamic> json) =>
    RefreshTokenResult(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$RefreshTokenResultToJson(RefreshTokenResult instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
