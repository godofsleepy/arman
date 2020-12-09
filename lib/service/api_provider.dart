import 'package:arman/model/detail.dart';
import 'package:arman/model/respondata.dart';
import 'package:arman/model/category.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio dio = Dio();
  final String baseUrl = 'https://app.arman.id';

  Future<ResponseData> getRecomendation() async {
    try {
      dio.options.headers["Authorization"] =
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMzg5ZjY2NWNjMzUwOTI0MjIzMzdiYjQ0YmE4MDQ1NTM0NjgyMmY4YTIxZTcyMTg5MDFlNzI3OTExODg4MWUyZDllMWQ5NGJmMTZlNTk5NTEiLCJpYXQiOjE2MDcyOTY0NTQsIm5iZiI6MTYwNzI5NjQ1NCwiZXhwIjoxNjM4ODMyNDU0LCJzdWIiOiIzMyIsInNjb3BlcyI6W119.lqotgp5v7fcWD90dFtiZyhFtv5xkBPBSj6ljFBUp0kzRElHOZ-s8HOTCQO8JOgTXSnxC57-Q0raqV2mDMrHOBuq7YsFWqhj42OQfHKDdrFUFE7Qz751pcGpThyN1pwmIplxRhWmBO2nN8QvW4b-ss9LqIT6VJ2L1CMYs9ZAlIwhuom4Jz3gbKqYXhzDgyJqQ7LKQenyb0zqmjekVNYgw6AaNQjWsz7jz73YhcG1EaZvQivvHDbz8BPvt3Ej-WMPDpJ114whnpy0eGugrxNAJT-5lV_plcmeGO4HpBUvHCmGianu-dLw81BTGwfIRWxdRof1sW5cXjnqIjdTC6T42PdnhKD4G5_zr-qHcs7P_xHn_Bk0lsw0wVwxZ4Rkc_KLYR-TkXZrNThqGwmV93liDl8_3lxeRkIax3Z1b8t6NSz4NpsUVDq8DSwem7_-1GZFrJ0Ds-5QYRCo2C2g77oKYeXF6V-cY1MZsb7ESUyzHyb1Ps58YkfFhllhO0IViiXvuhOq8sRP4G0S8TGrSdxJFXu7Bga2i3NEMkBRm_yTmZz7NBvSbcbaYOMSJHKqs2xbk87aMijS4q0hWUZIJxy7SXh9nMtkR0nu0ETUsmpQLh5ndDoHlCkA8qJLESmg3VgLT2wnqzy0eaNpYMnU5sTBWwvn6PBMDI9b-tRqnLYohuh8";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.get('$baseUrl/api/contents/recommendationsv2');
      return ResponseData.fromJson(response.data);
    } on DioError catch (e) {
      print("errorrecomendation ${e}");
      return ResponseData.withError(e.toString());
    } catch (e) {
      print("errorrecomendation ${e}");
      return ResponseData.withError(e);
    }
  }

  Future<ResponseCategory> getCategory() async {
    try {
      dio.options.headers["Authorization"] =
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMzg5ZjY2NWNjMzUwOTI0MjIzMzdiYjQ0YmE4MDQ1NTM0NjgyMmY4YTIxZTcyMTg5MDFlNzI3OTExODg4MWUyZDllMWQ5NGJmMTZlNTk5NTEiLCJpYXQiOjE2MDcyOTY0NTQsIm5iZiI6MTYwNzI5NjQ1NCwiZXhwIjoxNjM4ODMyNDU0LCJzdWIiOiIzMyIsInNjb3BlcyI6W119.lqotgp5v7fcWD90dFtiZyhFtv5xkBPBSj6ljFBUp0kzRElHOZ-s8HOTCQO8JOgTXSnxC57-Q0raqV2mDMrHOBuq7YsFWqhj42OQfHKDdrFUFE7Qz751pcGpThyN1pwmIplxRhWmBO2nN8QvW4b-ss9LqIT6VJ2L1CMYs9ZAlIwhuom4Jz3gbKqYXhzDgyJqQ7LKQenyb0zqmjekVNYgw6AaNQjWsz7jz73YhcG1EaZvQivvHDbz8BPvt3Ej-WMPDpJ114whnpy0eGugrxNAJT-5lV_plcmeGO4HpBUvHCmGianu-dLw81BTGwfIRWxdRof1sW5cXjnqIjdTC6T42PdnhKD4G5_zr-qHcs7P_xHn_Bk0lsw0wVwxZ4Rkc_KLYR-TkXZrNThqGwmV93liDl8_3lxeRkIax3Z1b8t6NSz4NpsUVDq8DSwem7_-1GZFrJ0Ds-5QYRCo2C2g77oKYeXF6V-cY1MZsb7ESUyzHyb1Ps58YkfFhllhO0IViiXvuhOq8sRP4G0S8TGrSdxJFXu7Bga2i3NEMkBRm_yTmZz7NBvSbcbaYOMSJHKqs2xbk87aMijS4q0hWUZIJxy7SXh9nMtkR0nu0ETUsmpQLh5ndDoHlCkA8qJLESmg3VgLT2wnqzy0eaNpYMnU5sTBWwvn6PBMDI9b-tRqnLYohuh8";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.get('$baseUrl/api/contents/explore');
      print(response.data);
      return ResponseCategory.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
      return ResponseCategory.withError(e.toString());
    } catch (e) {
      print("errorcategory ${e}");
      return ResponseCategory.withError(e);
    }
  }

  Future<ResponseDetail> getDetail(String id) async {
    try {
      dio.options.headers["Authorization"] =
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMzg5ZjY2NWNjMzUwOTI0MjIzMzdiYjQ0YmE4MDQ1NTM0NjgyMmY4YTIxZTcyMTg5MDFlNzI3OTExODg4MWUyZDllMWQ5NGJmMTZlNTk5NTEiLCJpYXQiOjE2MDcyOTY0NTQsIm5iZiI6MTYwNzI5NjQ1NCwiZXhwIjoxNjM4ODMyNDU0LCJzdWIiOiIzMyIsInNjb3BlcyI6W119.lqotgp5v7fcWD90dFtiZyhFtv5xkBPBSj6ljFBUp0kzRElHOZ-s8HOTCQO8JOgTXSnxC57-Q0raqV2mDMrHOBuq7YsFWqhj42OQfHKDdrFUFE7Qz751pcGpThyN1pwmIplxRhWmBO2nN8QvW4b-ss9LqIT6VJ2L1CMYs9ZAlIwhuom4Jz3gbKqYXhzDgyJqQ7LKQenyb0zqmjekVNYgw6AaNQjWsz7jz73YhcG1EaZvQivvHDbz8BPvt3Ej-WMPDpJ114whnpy0eGugrxNAJT-5lV_plcmeGO4HpBUvHCmGianu-dLw81BTGwfIRWxdRof1sW5cXjnqIjdTC6T42PdnhKD4G5_zr-qHcs7P_xHn_Bk0lsw0wVwxZ4Rkc_KLYR-TkXZrNThqGwmV93liDl8_3lxeRkIax3Z1b8t6NSz4NpsUVDq8DSwem7_-1GZFrJ0Ds-5QYRCo2C2g77oKYeXF6V-cY1MZsb7ESUyzHyb1Ps58YkfFhllhO0IViiXvuhOq8sRP4G0S8TGrSdxJFXu7Bga2i3NEMkBRm_yTmZz7NBvSbcbaYOMSJHKqs2xbk87aMijS4q0hWUZIJxy7SXh9nMtkR0nu0ETUsmpQLh5ndDoHlCkA8qJLESmg3VgLT2wnqzy0eaNpYMnU5sTBWwvn6PBMDI9b-tRqnLYohuh8";
      dio.options.headers["Client-Platform"] = "Android";

      final response = await dio.get('$baseUrl/api/contents/$id');
      print(response.data);
      return ResponseDetail.fromJson(response.data);
    } catch (e) {
      print(e);
      return ResponseDetail.withError(e);
    }
  }
}
