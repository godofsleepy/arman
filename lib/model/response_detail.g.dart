// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDetail _$ResponseDetailFromJson(Map<String, dynamic> json) {
  return ResponseDetail(
    success: json['success'] as bool,
    data: json['data'] == null
        ? null
        : Detail.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ResponseDetailToJson(ResponseDetail instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return Detail(
    id: json['id'] as int,
    content_type: json['content_type'] as String,
    content_date: json['content_date'] as String,
    thumbnail: json['thumbnail'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
    source: json['source'] as String,
    source_logo: json['source_logo'] as String,
    read: json['read'] as bool,
    liked: json['liked'] as bool,
    bookmarked: json['bookmarked'] as bool,
    related_articles: (json['related_articles'] as List)
        ?.map((e) => e == null
            ? null
            : RelatedArticle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'id': instance.id,
      'content_type': instance.content_type,
      'content_date': instance.content_date,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'content': instance.content,
      'source': instance.source,
      'source_logo': instance.source_logo,
      'read': instance.read,
      'liked': instance.liked,
      'bookmarked': instance.bookmarked,
      'related_articles': instance.related_articles,
    };

RelatedArticle _$RelatedArticleFromJson(Map<String, dynamic> json) {
  return RelatedArticle(
    id: json['id'] as int,
    content_type: json['content_type'] as String,
    title: json['title'] as String,
    thumbnail: json['thumbnail'] as String,
    source: json['source'] as String,
    read: json['read'] as bool,
  );
}

Map<String, dynamic> _$RelatedArticleToJson(RelatedArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content_type': instance.content_type,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'source': instance.source,
      'read': instance.read,
    };
