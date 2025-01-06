import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_riverpod/data/core/api_endpoint.dart';
import 'package:flutter_clean_riverpod/data/core/api_result.dart';
import 'package:flutter_clean_riverpod/data/error/internet_error.dart';
import 'package:flutter_clean_riverpod/service/connectivity_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../error/api_error.dart';
import 'header_interceptor.dart';

enum ApiMethod {
  get,
  post,
  put,
  patch,
  delete,
}

typedef ApiResponseDecoder<T> = T Function(Response response);

class ApiClient {
  final Dio dio;
  final ConnectivityService connectivityService;

  ApiClient(this.dio, this.connectivityService) {
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
    dio.options.baseUrl = APIEndpoint.baseUrl;
    dio.interceptors.add(HeaderInterceptor());
  }

  Future<ApiResult<T>> request<T>({
    required String endpoint,
    required ApiMethod method,
    required ApiResponseDecoder<T> decoder,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final hasInternet = await connectivityService.hasInternet();
      if (!hasInternet) {
        return ApiResult.failed(ApiError(error: InternetError()));
      }
      Response<dynamic> response;
      switch (method) {
        case ApiMethod.get:
          response = await dio.get(
            endpoint,
            options: options,
            queryParameters: queryParameters,
            data: data,
          );
          break;
        case ApiMethod.post:
          response = await dio.post(
            endpoint,
            queryParameters: queryParameters,
            data: data,
            options: options,
          );
          break;
        case ApiMethod.put:
          response = await dio.put(
            endpoint,
            options: options,
            queryParameters: queryParameters,
            data: data,
          );
          break;
        case ApiMethod.patch:
          response = await dio.patch(
            endpoint,
            options: options,
            queryParameters: queryParameters,
            data: data,
          );
          break;
        case ApiMethod.delete:
          response = await dio.delete(
            endpoint,
            options: options,
            queryParameters: queryParameters,
            data: data,
          );
          break;
      }
      final parsedResponse = decoder(response);
      return ApiResult.success(parsedResponse);
    } catch (e) {
      if (e is Error) {
        log(
          e.toString(),
          stackTrace: e.stackTrace,
          error: e,
        );
      }
      return ApiResult.failed(
        ApiError(error: e),
      );
    }
  }
}
