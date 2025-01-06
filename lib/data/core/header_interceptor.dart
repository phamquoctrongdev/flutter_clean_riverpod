import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['x-api-key'] = 'reqres-free-v1';
    super.onRequest(options, handler);
  }
}
