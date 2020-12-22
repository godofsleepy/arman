import 'package:arman/data/local_provider.dart';
import 'package:arman/model/category.dart';
import 'package:arman/model/detail.dart';
import 'package:arman/model/respondata.dart';
import 'package:arman/model/responlogin.dart';
import 'package:arman/model/user_account.dart';

import 'api_provider.dart';

class DataRepository {
  final ApiProvider apiProvider = ApiProvider();
  final LocalProvider localProvider = LocalProvider();

  Future<ResponseData> fetchRecommendation(int page) =>
      apiProvider.getRecomendation(page);
  Future<ResponseCategory> fetchCategory() => apiProvider.getCategory();
  Future<ResponseDetail> fetchDetail(String id) => apiProvider.getDetail(id);
  Future<ResponseLogin> fetchLogin(
          String email, String access, String provider) =>
      apiProvider.postLogin(email, access, provider);
  Future<ResponseData> fetchSearch(String keyword) =>
      apiProvider.getSearching(keyword);
  Future<ResponseData> fetchContents() => apiProvider.getContents();

  Future<bool> saveLoginInfo(String name, String accessToken, String email,
          String image, String tokenResult, String refreshToken, int expire) =>
      localProvider.saveLoginInfo(
          name, accessToken, email, image, tokenResult, refreshToken, expire);
  Future<UserAccount> getLoginInfo() => localProvider.getLoginInfo();
  Future<bool> setLogout() => localProvider.setLogout();
}
