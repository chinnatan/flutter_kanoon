import 'package:dio/dio.dart';
import 'package:flutter_pos/app/app_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static Dio createDio() {
    var dio = Dio(BaseOptions(headers: {
      "Accept": "application/json",
      // "Authorization": 'Bearer $accessToken'
    }));
    dio.options.baseUrl = AppConfig.instance.baseURL;
    dio.options.connectTimeout = const Duration(minutes: 5);
    dio.options.receiveTimeout = const Duration(minutes: 3);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: true,
    ));
    // dio.interceptors.add(AwesomeDioInterceptor());
    return dio;
  }
}
