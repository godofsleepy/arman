import 'package:json_annotation/json_annotation.dart';

part 'item_recommendation.g.dart';

@JsonSerializable()
class ItemRecommendation {
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

  ItemRecommendation({
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

  factory ItemRecommendation.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  String toString() {
    return 'Item(id: $id,)';
  }
}