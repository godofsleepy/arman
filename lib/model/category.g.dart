// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceWeb _$SourceWebFromJson(Map<String, dynamic> json) {
  return SourceWeb(
    id: json['id'] as int,
    name: json['name'] as String,
    logo: json['logo'] as String,
  );
}

Map<String, dynamic> _$SourceWebToJson(SourceWeb instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return Topic(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
