import 'package:arman/model/respondata.dart';

import 'api_provider.dart';

class ApiRepository {
  final ApiProvider apiProvider = ApiProvider();

  Future<ResponseData> fetchRecommendation() => apiProvider.getRecomendation();
}
