// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as int?,
      username: json['username'] as String?,
      fullname: json['fullname'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      storeId: json['storeId'] as int?,
      storeName: json['storeName'] as String?,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullname': instance.fullname,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'storeId': instance.storeId,
      'storeName': instance.storeName,
    };
