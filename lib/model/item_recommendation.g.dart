// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemRecommendation _$ItemRecommendationFromJson(Map<String, dynamic> json) {
  return ItemRecommendation(
    id: json['id'] as int,
    content_type: json['content_type'] as String,
    title: json['title'] as String,
    content_date: json['content_date'] as String,
    description: json['description'] as String,
    thumbnail: json['thumbnail'] as String,
    source: json['source'] as String,
    source_logo: json['source_logo'] as String,
    read: json['read'] as bool,
    liked: json['liked'] as bool,
    bookmarked: json['bookmarked'] as bool,
  );
}

Map<String, dynamic> _$ItemRecommendationToJson(ItemRecommendation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content_type': instance.content_type,
      'content_date': instance.content_date,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'source': instance.source,
      'source_logo': instance.source_logo,
      'read': instance.read,
      'liked': instance.liked,
      'bookmarked': instance.bookmarked,
    };
