import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_endpoint.dart';
import 'auth_interceptor.dart';

class DioService {
  Dio initialize() {
    final dio = Dio(BaseOptions(baseUrl: APIEndpoint.baseUrl));
    dio.interceptors.add(AuthInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
    return dio;
  }
}