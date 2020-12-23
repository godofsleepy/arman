import 'package:arman/model/user_account.dart';
import 'package:hive/hive.dart';

class SessionManager {
  Future<bool> saveLoginInfo(String name, String accessToken, String email,
      String image, String tokenResult, String refreshToken, int expire) async {
    try {
      var box = await Hive.openBox('userBox');
      UserAccount userAccount = UserAccount(
        name: name,
        accessToken: accessToken,
        email: email,
        image: image,
        tokenResult: tokenResult,
        refreshToken: refreshToken,
        expire: expire,
      );
      box.add(userAccount);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserAccount> getLoginInfo() async {
    try {
      var box = await Hive.openBox('userBox');
      UserAccount userAccount = box.getAt(0);
      print(userAccount.toString());

      return userAccount;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> setLogout() async {
    try {
      var box = await Hive.openBox('userBox');
      box.deleteAt(0);
      await box.close();
      return true;
    } catch (e) {
      print(e);
    }
  }
}
