// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responlogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLogin _$ResponseLoginFromJson(Map<String, dynamic> json) {
  return ResponseLogin(
    user: json['user'] == null
        ? null
        : ResponseUser.fromJson(json['user'] as Map<String, dynamic>),
    expires_in: json['expires_in'] as int,
    access_token: json['access_token'] as String,
    refresh_token: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$ResponseLoginToJson(ResponseLogin instance) =>
    <String, dynamic>{
      'user': instance.user,
      'expires_in': instance.expires_in,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
    };

ResponseUser _$ResponseUserFromJson(Map<String, dynamic> json) {
  return ResponseUser(
    name: json['name'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$ResponseUserToJson(ResponseUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };
