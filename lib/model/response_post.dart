
import 'package:json_annotation/json_annotation.dart';

part 'response_post.g.dart';

@JsonSerializable()
class ResponsePost {
  bool success;
  String message;

  ResponsePost({
    this.success,
    this.message,
  });

  factory ResponsePost.fromJson(Map<String, dynamic> json) =>
      _$ResponsePostFromJson(json);

  Map<String, dynamic> toJson() => _$ResponsePostToJson(this);

  @override
  String toString() => 'ResponsePost(success: $success, message: $message)';
}
