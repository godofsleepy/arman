import 'package:hive/hive.dart';

part 'user_account.g.dart';

@HiveType(typeId: 0)
class UserAccount extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String accessToken;
  @HiveField(2)
  String tokenResult;
  @HiveField(3)
  String refreshToken;
  @HiveField(4)
  String email;
  @HiveField(5)
  String provider;
  @HiveField(6)
  String image;
  @HiveField(7)
  int expire;
  @HiveField(8)
  String providerExpire;

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
    return 'UserAccount(name: $name, accessToken: $accessToken, tokenResult: $tokenResult, refreshToken: $refreshToken, email: $email, provider: $provider, image: $image, expire: $expire, providerExpire: $providerExpire)';
  }
}
