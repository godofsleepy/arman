import 'package:json_annotation/json_annotation.dart';

part 'responlogin.g.dart';

@JsonSerializable()
class ResponseLogin {
  ResponseUser user;
  int expires_in;
  String access_token;
  String refresh_token;
  
  ResponseLogin({
    this.user,
    this.expires_in,
    this.access_token,
    this.refresh_token,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginToJson(this);    

  @override
  String toString() {
    return 'ResponseLogin(user: $user, expires_in: $expires_in, access_token: $access_token, refresh_token: $refresh_token)';
  }
}

@JsonSerializable()
class ResponseUser {
  String name;
  String email;

  ResponseUser({
    this.name,
    this.email,
  });

  factory ResponseUser.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseUserToJson(this);    

  @override
  String toString() => 'ResponseUser(name: $name, email: $email)';
}
