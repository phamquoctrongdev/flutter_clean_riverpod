import 'package:dio/dio.dart';

abstract class ApiError {}

class InternetError extends ApiError {}

class RequestApiError extends ApiError {
  final DioException exception;

  RequestApiError(this.exception);
}

class ParseResponseError extends ApiError {
  final Object error;

  ParseResponseError(this.error);
}

class UnknownError extends ApiError {}
