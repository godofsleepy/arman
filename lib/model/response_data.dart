import 'package:json_annotation/json_annotation.dart';
import 'news.dart';

part 'response_data.g.dart';

@JsonSerializable()
class ResponseData {
  bool success;
  List<News> data;
  String message;
  @JsonKey(ignore: true)
  String error;

  ResponseData(this.data);

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  ResponseData.withError(this.error);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);

  @override
  String toString() {
    return 'Recommendation{data: $data}';
  }
}