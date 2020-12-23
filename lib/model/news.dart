import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  int id;
  String title;
  String content_type;
  String content_date;
  String description;
  String thumbnail;
  String source;
  String source_logo;
  bool read;
  bool liked;
  bool bookmarked;

  News({
    this.id,
    this.content_type,
    this.title,
    this.content_date,
    this.description,
    this.thumbnail,
    this.source,
    this.source_logo,
    this.read,
    this.liked,
    this.bookmarked,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$newsToJson(this);
}
