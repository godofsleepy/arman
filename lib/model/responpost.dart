import 'dart:convert';

class ResponsePost {
  bool succees;
  String message;

  ResponsePost({
    this.succees,
    this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'succees': succees,
      'message': message,
    };
  }

  factory ResponsePost.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResponsePost(
      succees: map['succees'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponsePost.fromJson(String source) =>
      ResponsePost.fromMap(json.decode(source));

  @override
  String toString() => 'ResponsePost(succees: $succees, message: $message)';
}
