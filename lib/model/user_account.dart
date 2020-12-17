import 'dart:convert';

class UserAccount {
  String name;
  String accessToken;
  String tokenResult;
  String refreshToken;
  String email;
  String provider;
  String image;
  int expire;

  UserAccount({
    this.name,
    this.accessToken,
    this.tokenResult,
    this.refreshToken,
    this.email,
    this.provider,
    this.image,
    this.expire,
  });

  @override
  String toString() {
    return 'UserAccount(name: $name, accessToken: $accessToken, tokenResult: $tokenResult, refreshToken: $refreshToken, email: $email, provider: $provider, image: $image, expire: $expire)';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'accessToken': accessToken,
      'tokenResult': tokenResult,
      'refreshToken': refreshToken,
      'email': email,
      'provider': provider,
      'image': image,
      'expire': expire,
    };
  }

  factory UserAccount.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserAccount(
      name: map['name'],
      accessToken: map['accessToken'],
      tokenResult: map['tokenResult'],
      refreshToken: map['refreshToken'],
      email: map['email'],
      provider: map['provider'],
      image: map['image'],
      expire: map['expire'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccount.fromJson(String source) => UserAccount.fromMap(json.decode(source));
}
