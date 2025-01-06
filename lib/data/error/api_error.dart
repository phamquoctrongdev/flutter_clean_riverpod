import 'package:dio/dio.dart';
import 'package:flutter_clean_riverpod/data/error/internet_error.dart';

enum ApiErrorType {
  // Related API request issues, e.g., an incorrect endpoint or an incorrect method.
  requestError,
  // No internet connection.
  internetError,
  // Unrelated API request issues, e.g., an error occurs during the process of parsing JSON to an object.
  parsingError,
}

class ApiError {
  ApiError({
    required Object error,
  }) : _error = error;

  final Object _error;

  String get message {
    if (_error is DioException) {
      final responseJson = _error.response?.data as Map<String, dynamic>;
      if (responseJson['message'] == null) {
        throw StateError('[DioException.response.data["message"] is null');
      }

      /// TODO: Custom exception from response here.
      return responseJson['message'];
    } else {
      return _error.toString();
    }
  }

  int? get statusCode {
    if (_error is DioException) {
      return _error.response?.statusCode;
    }
    return -1;
  }

  DioException? get dioError {
    if (_error is DioException) {
      return _error;
    } else {
      return null;
    }
  }

  Error? get originalError {
    if (_error is Error) {
      return _error;
    } else {
      return null;
    }
  }

  ApiErrorType get type {
    switch (_error) {
      case DioException _:
        return ApiErrorType.requestError;
      case Error _:
        if (_error is InternetError) {
          return ApiErrorType.internetError;
        } else {
          return ApiErrorType.parsingError;
        }
      default:
        return ApiErrorType.requestError;
    }
  }
}
