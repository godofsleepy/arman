import 'package:arman/model/user_account.dart';
import 'package:arman/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalProvider {
  SharedPreferences sharedPreferences;

  Future<bool> saveLoginInfo(String name, String accessToken, String email,
      String image, String tokenResult, String refreshToken, int expire) async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      UserAccount userAccount = UserAccount(
        name: name,
        accessToken: accessToken,
        email: email,
        image: image,
        tokenResult: tokenResult,
        refreshToken: refreshToken,
        expire: expire,
      );
      SessionManager sessionManager = SessionManager();
      sessionManager.setAuthToken(tokenResult);
      await sharedPreferences.setString("user", userAccount.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserAccount> getLoginInfo() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      String user = await sharedPreferences.getString("user");
      print(user);
      return UserAccount.fromJson(user);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> setLogout() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      return await sharedPreferences.clear();
    } catch (e) {
      print(e);
    }
  }
}
