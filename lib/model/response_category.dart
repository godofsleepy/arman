import 'package:json_annotation/json_annotation.dart';

part 'response_category.g.dart';

@JsonSerializable()
class ResponseCategory {
  bool success;
  Category data;
  String message;
  @JsonKey(ignore: true)
  String error;

  ResponseCategory({
    this.success,
    this.data,
    this.message,
  });

  ResponseCategory.withError(this.error);

  factory ResponseCategory.fromJson(Map<String, dynamic> json) =>
      _$ResponseCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseCategoryToJson(this);

  @override
  String toString() =>
      'ReponseCategory(success: $success, data: $data, message: $message)';
}

@JsonSerializable()
class Category {
  List<SourceWeb> sources;
  List<Topic> topics;
  Category({
    this.sources,
    this.topics,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  String toString() => 'Category(sources: $sources, topics: $topics)';
}

@JsonSerializable()
class SourceWeb {
  int id;
  String name;
  String logo;
  int has_interest;

  SourceWeb({
    this.id,
    this.name,
    this.logo,
    this.has_interest,
  });

  factory SourceWeb.fromJson(Map<String, dynamic> json) =>
      _$SourceWebFromJson(json);

  Map<String, dynamic> toJson() => _$SourceWebToJson(this);

  @override
  String toString() {
    return 'SourceWeb(id: $id, name: $name, logo: $logo, has_interest: $has_interest)';
  }
}

@JsonSerializable()
class Topic {
  int id;
  String name;
  int has_interest;

  Topic({this.id, this.name, this.has_interest});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);

  @override
  String toString() => 'SourceWeb(id: $id, name: $name,)';
}
