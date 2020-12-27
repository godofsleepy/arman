// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseCategory _$ResponseCategoryFromJson(Map<String, dynamic> json) {
  return ResponseCategory(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : Category.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ResponseCategoryToJson(ResponseCategory instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    sources: (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : SourceWeb.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    topics: (json['topics'] as List)
        ?.map(
            (e) => e == null ? null : Topic.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'sources': instance.sources,
      'topics': instance.topics,
    };

SourceWeb _$SourceWebFromJson(Map<String, dynamic> json) {
  return SourceWeb(
    id: json['id'] as int,
    name: json['name'] as String,
    logo: json['logo'] as String,
    has_interest: json['has_interest'] as int,
  );
}

Map<String, dynamic> _$SourceWebToJson(SourceWeb instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'has_interest': instance.has_interest,
    };

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return Topic(
    id: json['id'] as int,
    name: json['name'] as String,
    has_interest: json['has_interest'] as int,
  );
}

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'has_interest': instance.has_interest,
    };
