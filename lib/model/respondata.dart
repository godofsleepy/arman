import 'package:json_annotation/json_annotation.dart';
import 'item_recommendation.dart';

part 'respondata.g.dart';

@JsonSerializable()
class ResponseData {
  bool success;
  List<ItemRecommendation> data;
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