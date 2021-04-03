import 'dart:convert';

import 'package:arman/model/response_detail.dart';
import 'package:arman/model/response_data.dart';
import 'package:arman/model/response_category.dart';
import 'package:arman/model/response_login.dart';
import 'package:arman/model/response_post.dart';
import 'package:arman/utils/utils.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio dio = Dio();

  final String baseUrl = 'https://app.arman.id';

  Future<ResponseData> getRecomendation(int page, String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response =
          await dio.get('$baseUrl/api/contents/recommendationsv2?page=$page');
      // print(response.data);
      return ResponseData.fromJson(response.data);
    } catch (e) {
      print("errorrecomendation $e");
      return ResponseData.withError(e.toString());
    }
  }

  Future<ResponseCategory> getCategory(String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.get('$baseUrl/api/contents/explore');

      return ResponseCategory.fromJson(response.data);
    } catch (e) {
      print("errorcategory ${e}");
      return ResponseCategory.withError(e.toString());
    }
  }

  Future<ResponseDetail> getDetail(String id, String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.get('$baseUrl/api/contents/$id');
      // print(response.data);
      return ResponseDetail.fromJson(response.data);
    } catch (e) {
      print(e);
      return ResponseDetail.withError(e.toString());
    }
  }

  Future<ResponseData> getSearching(
      String keyword, String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.get(
          '$baseUrl/api/contents/search?keyword=${keyword.replaceAll(" ", "%20")}');
      return ResponseData.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<ResponseLogin> postLogin(
      String email, String access, String provider) async {
    try {
      dio.interceptors.add(LoggingInterceptor());
      var params = {
        "grant_type": "social",
        "client_id": 3,
        "client_secret": "dSXefk8cq1fnfvptkpnLQtVQF5B3Zo711Mefmg67",
        "provider": provider,
        "email": email,
        "access_token": access,
        "platform": "Android",
      };

      final response =
          await dio.post('$baseUrl/oauth/token', data: jsonEncode(params));
      return ResponseLogin.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<ResponsePost> postLogout(String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.post('$baseUrl/api/users/logout');
      return ResponsePost.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<ResponsePost> postFollow(
      String type, String id, String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.post('$baseUrl/api/$type/$id/follow');
      return ResponsePost.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<ResponsePost> postUnfollow(
      String type, String id, String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.post('$baseUrl/api/$type/$id/unfollow');
      return ResponsePost.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<ResponseData> getNewsbySource(
      String sourceId, String page, String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio
          .get('$baseUrl/api/contents/?source_id=$sourceId&page=$page');
      return ResponseData.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<ResponseData> getContents(String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.get('$baseUrl/api/contents');
      return ResponseData.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ResponseData> getHistories(String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.get('$baseUrl/api/contents/histories');
      return ResponseData.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ResponseData> getLikes(String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.get('$baseUrl/api/contents/likes');
      return ResponseData.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ResponseData> getBookmarks(String authorization) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.get('$baseUrl/api/contents/bookmarks');
      return ResponseData.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ResponsePost> postLike(String authorization, String id) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.post('$baseUrl/api/contents/$id/like');
      return ResponsePost.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ResponsePost> postBookmark(String authorization, String id) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.post('$baseUrl/api/contents/$id/bookmark');
      return ResponsePost.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ResponsePost> postUnBookmark(String authorization, String id) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.post('$baseUrl/api/contents//$id/unbookmark');
      return ResponsePost.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ResponsePost> postUnlike(String authorization, String id) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $authorization";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.post('$baseUrl/api/contents/$id/unlike');
      return ResponsePost.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
  }
}

class LoggingInterceptor extends Interceptor {
  int _maxCharactersPerLine = 200;

  @override
  Future onRequest(RequestOptions options) {
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        "<-- ${response.statusCode} ${response.request.method} ${response.request.path}");
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      print(response.data);
    }
    print("<-- END HTTP");

    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print(
        "<-- ${err.message} ${(err.response?.request != null ? (err.response.request.baseUrl + err.response.request.path) : 'URL')}");
    print("${err.response != null ? err.response.data : 'Unknown Error'}");
    print("<-- End error");
    return super.onError(err);
  }
}
