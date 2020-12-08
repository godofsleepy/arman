import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

class Category {
  List<SourceWeb> sources;
  List<Topic> topics;
}

@JsonSerializable()
class SourceWeb {
  int id;
  String name;
  String logo;
  SourceWeb({
    this.id,
    this.name,
    this.logo,
  });

  factory SourceWeb.fromJson(Map<String, dynamic> json) =>
      _$SourceWebFromJson(json);

  Map<String, dynamic> toJson() => _$SourceWebToJson(this);

  @override
  String toString() => 'SourceWeb(id: $id, name: $name, logo: $logo)';
}

@JsonSerializable()
class Topic {
  int id;
  String name;

  Topic({
    this.id,
    this.name,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);

  @override
  String toString() => 'SourceWeb(id: $id, name: $name,)';
}
