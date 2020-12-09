import 'package:json_annotation/json_annotation.dart';

part 'detail.g.dart';

@JsonSerializable()
class ResponseDetail {
  bool success;
  ItemDetail data;
  String message;
  @JsonKey(ignore: true)
  String error;

  ResponseDetail({
    this.success,
    this.data,
    this.message,
  });

  ResponseDetail.withError(this.error);

  factory ResponseDetail.fromJson(Map<String, dynamic> json) =>
      _$ResponseDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDetailToJson(this);

  @override
  String toString() =>
      'ResponseDetail(success: $success, data: $data, message: $message)';
}

@JsonSerializable()
class ItemDetail {
  int id;
  String content_type;
  String content_date;
  String thumbnail;
  String title;
  String content;
  String source;
  String source_logo;
  bool read;
  bool liked;
  bool bookmarked;
  List<RelatedArtic> related_articles;

  ItemDetail({
    this.id,
    this.content_type,
    this.content_date,
    this.thumbnail,
    this.title,
    this.content,
    this.source,
    this.source_logo,
    this.read,
    this.liked,
    this.bookmarked,
    this.related_articles,
  });

  factory ItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDetailToJson(this);

  @override
  String toString() {
    return 'ItemDetail(id: $id, content_type: $content_type, content_date: $content_date, thumbnail: $thumbnail, title: $title, content: $content, source: $source, source_logo: $source_logo, read: $read, liked: $liked, bookmarked: $bookmarked, related_articles: $related_articles)';
  }
}

@JsonSerializable()
class RelatedArtic {
  int id;
  String content_type;
  String title;
  String thumbnail;
  String source;
  bool read;

  RelatedArtic({
    this.id,
    this.content_type,
    this.title,
    this.thumbnail,
    this.source,
    this.read,
  });

  factory RelatedArtic.fromJson(Map<String, dynamic> json) =>
      _$RelatedArticFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedArticToJson(this);

  @override
  String toString() {
    return 'RelatedArtic(id: $id, content_type: $content_type, title: $title, thumbnail: $thumbnail, source: $source, read: $read)';
  }
}
