import 'package:bba/shared/constants.dart';
import 'package:dio/dio.dart';

Dio dio({String? token}) {
  Dio dio = Dio();

  dio.options.baseUrl = "${Constants.baseURL}/api";
  dio.options.headers['Accept'] = "application/json";
  dio.options.headers['Content-Type'] = "application/json";

  if (token != null) {
    dio.options.headers['Authorization'] = "Bearer $token";
  }

  return dio;
}
