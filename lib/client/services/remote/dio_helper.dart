import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();
  final String baseUrl = 'https://test.kafiil.com';

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://test.kafiil.com/',
          receiveDataWhenStatusError: true,
          headers: {
            'Accept-Language': 'ar',
            'Accept': 'application/json',
          }),
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? contentType,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': contentType,
      'Authorization': token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? contentType,
    String? token,
  }) async {

    dio.options.headers = {
      'Content-Type': contentType,
      'Authorization': token,
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
