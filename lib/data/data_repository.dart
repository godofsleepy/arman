import 'package:arman/model/response_category.dart';
import 'package:arman/model/response_detail.dart';
import 'package:arman/model/response_data.dart';
import 'package:arman/model/response_login.dart';
import 'package:arman/model/response_post.dart';
import 'package:arman/model/user_account.dart';
import 'package:arman/utils/utils.dart';

import 'local_provider.dart';
import 'api_provider.dart';

class DataRepository {
  SessionManager sessionManager = SessionManager();
  final ApiProvider apiProvider = ApiProvider();
  final LocalProvider localProvider = LocalProvider();

  Future<ResponseData> fetchRecommendation(int page) async {
    print("page : $page");
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

  Future<ResponseData> fetchBookmarks() async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.getBookmarks(userAccount.tokenResult);
  }

  Future<ResponseData> fetchLikes() async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.getLikes(userAccount.tokenResult);
  }

  Future<ResponsePost> fetchLike(String id) async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.postLike(userAccount.tokenResult, id);
  }

  Future<ResponsePost> fetchUnlike(String id) async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.postUnlike(userAccount.tokenResult, id);
  }

  Future<ResponseData> fetchNewsbySource(String sourceId, int page) async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.getNewsbySource(
        sourceId, page.toString(), userAccount.tokenResult);
  }

  Future<ResponsePost> fetchFollow(String type, String id) async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.postFollow(type, id, userAccount.tokenResult);
  }

  Future<ResponsePost> fetchUnfollow(String type, String id) async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.postUnfollow(type, id, userAccount.tokenResult);
  }

  Future<ResponsePost> fetchBookmark(String id) async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.postBookmark(userAccount.tokenResult, id);
  }

  Future<ResponsePost> fetchUnbookmark(String id) async {
    UserAccount userAccount = await sessionManager.getLoginInfo();
    return apiProvider.postUnBookmark(userAccount.tokenResult, id);
  }
}
