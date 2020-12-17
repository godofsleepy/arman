import 'package:arman/model/category.dart';
import 'package:arman/model/detail.dart';
import 'package:arman/model/respondata.dart';
import 'package:arman/model/responlogin.dart';

import 'api_provider.dart';

class ApiRepository {
  final ApiProvider apiProvider = ApiProvider();

  Future<ResponseData> fetchRecommendation(int page) =>
      apiProvider.getRecomendation(page);
  Future<ResponseCategory> fetchCategory() => apiProvider.getCategory();
  Future<ResponseDetail> fetchDetail(String id) => apiProvider.getDetail(id);
  Future<ResponseLogin> fetchLogin(
          String email, String access, String provider) =>
      apiProvider.postLogin(email, access, provider);
}
