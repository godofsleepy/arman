import 'dart:convert';

class User {
  String name;
  String accessToken;
  String tokenResult;
  String refreshToken;
  String email;
  String provider;
  String image;

  User({
    this.name,
    this.accessToken,
    this.tokenResult,
    this.refreshToken,
    this.email,
    this.provider,
    this.image,
  });

  @override
  String toString() {
    return 'User(name: $name, accessToken: $accessToken, tokenResult: $tokenResult, refreshToken: $refreshToken, email: $email, provider: $provider, image: $image)';
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
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return User(
      name: map['name'],
      accessToken: map['accessToken'],
      tokenResult: map['tokenResult'],
      refreshToken: map['refreshToken'],
      email: map['email'],
      provider: map['provider'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

