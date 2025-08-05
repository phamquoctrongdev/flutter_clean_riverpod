import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_riverpod/data/core/api_client.dart';
import 'package:flutter_clean_riverpod/data/core/api_endpoint.dart';
import 'package:flutter_clean_riverpod/data/core/header_interceptor.dart';
import 'package:flutter_clean_riverpod/data/repository/country/country_repository.dart';
import 'package:flutter_clean_riverpod/data/repository/country/country_repository_impl.dart';
import 'package:flutter_clean_riverpod/service/connectivity_service.dart';
import 'package:flutter_clean_riverpod/service/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppInitializer {
  AppInitializer._internal();

  static final _instance = AppInitializer._internal();

  static final getInstance = _instance;

  /// Ensure [ensureInitialized] function called once time.

  bool _isInitialized = false;

  Future<void> ensureInitialized() async {
    if (_isInitialized) {
      return;
    }
    WidgetsFlutterBinding.ensureInitialized();
    await _registerService();
    await _registerRepository();
    _isInitialized = true;
  }

  Future<void> _registerService() async {
    await GetIt.instance
        .registerSingleton(SharedPreferencesService())
        .ensureInitialized();
    GetIt.instance.registerSingleton(ConnectivityService());
  }

  Future<void> _registerRepository() async {
    final dio = _createDio();
    final connectivityService = GetIt.instance.get<ConnectivityService>();
    final apiClient = GetIt.instance.registerSingleton(
      ApiClient(dio, connectivityService),
    );
    GetIt.instance.registerFactory<CountryRepository>(
      () => CountryRepositoryImpl(apiClient),
    );
  }

  Dio _createDio() {
    final dio = Dio(BaseOptions(baseUrl: APIEndpoint.baseUrl));
    dio.interceptors.add(HeaderInterceptor());
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
