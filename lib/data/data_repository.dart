import 'package:arman/model/category.dart';
import 'package:arman/model/detail.dart';
import 'package:arman/model/respondata.dart';
import 'package:arman/model/responlogin.dart';
import 'package:arman/model/responpost.dart';
import 'package:arman/model/user_account.dart';
import 'package:arman/utils/utils.dart';

import 'local_provider.dart';
import 'api_provider.dart';

class DataRepository {
  SessionManager sessionManager = SessionManager();
  final ApiProvider apiProvider = ApiProvider();
  final LocalProvider localProvider = LocalProvider();

  Future<ResponseData> fetchRecommendation(int page) async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.getRecomendation(page, userAccount.tokenResult);
  }

  Future<ResponseCategory> fetchCategory() async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.getCategory(userAccount.tokenResult);
  }

  Future<ResponseDetail> fetchDetail(String id) async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.getDetail(id, userAccount.tokenResult);
  }

  Future<ResponseLogin> fetchLogin(
          String email, String access, String provider) =>
      apiProvider.postLogin(email, access, provider);

  Future<ResponseData> fetchSearch(String keyword) async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.getSearching(keyword, userAccount.tokenResult);
  }

  Future<ResponseData> fetchContents() async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.getContents(userAccount.tokenResult);
  }

  Future<ResponsePost> fetchLogout() async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.postLogout(userAccount.tokenResult);
  }

  Future<ResponseData> fetchHistories() async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.getHistories(userAccount.tokenResult);
  }
}
