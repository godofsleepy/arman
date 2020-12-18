import 'package:arman/model/category.dart';
import 'package:arman/model/detail.dart';
import 'package:arman/model/respondata.dart';
import 'package:arman/model/responlogin.dart';
import 'package:arman/model/user_account.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_provider.dart';

class DataRepository {
  final ApiProvider apiProvider = ApiProvider();
  final SharedPreferences prefs;

  DataRepository({this.prefs});

  Future<ResponseData> fetchRecommendation(int page) =>
      apiProvider.getRecomendation(page);
  Future<ResponseCategory> fetchCategory() => apiProvider.getCategory();
  Future<ResponseDetail> fetchDetail(String id) => apiProvider.getDetail(id);
  Future<ResponseLogin> fetchLogin(
          String email, String access, String provider) =>
      apiProvider.postLogin(email, access, provider);

  Future<bool> saveLogin(String name, String accessToken, String email,
      String image, String tokenResult, String refreshToken, int expire) async {
    try {
      UserAccount userAccount = UserAccount(
        name: name,
        accessToken: accessToken,
        email: email,
        image: image,
        tokenResult: tokenResult,
        refreshToken: refreshToken,
        expire: expire,
      );

      await prefs.setString("user", userAccount.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserAccount> getLoginInfo() async {
    try {
      String user = await prefs.getString("user");
      print(user);
      return UserAccount.fromJson(user);
    } catch (e) {
      print(e);
    }
  }
}
