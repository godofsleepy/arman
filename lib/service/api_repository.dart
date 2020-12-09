import 'package:arman/model/category.dart';
import 'package:arman/model/detail.dart';
import 'package:arman/model/respondata.dart';

import 'api_provider.dart';

class ApiRepository {
  final ApiProvider apiProvider = ApiProvider();

  Future<ResponseData> fetchRecommendation() => apiProvider.getRecomendation();
  Future<ResponseCategory> fetchCategory() => apiProvider.getCategory();
  Future<ResponseDetail> fetchDetail(String id) => apiProvider.getDetail(id);
}
