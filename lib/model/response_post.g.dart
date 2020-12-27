// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsePost _$ResponsePostFromJson(Map<String, dynamic> json) {
  return ResponsePost(
    success: json['success'] as bool,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ResponsePostToJson(ResponsePost instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
