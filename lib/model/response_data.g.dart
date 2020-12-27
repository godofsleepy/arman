// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) {
  return ResponseData(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : News.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..success = json['success'] as bool
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
