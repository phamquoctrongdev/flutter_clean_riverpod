import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_riverpod/data/core/api_client.dart';
import 'package:flutter_clean_riverpod/data/repository/country/country_repository.dart';
import 'package:flutter_clean_riverpod/data/repository/country/country_repository_impl.dart';
import 'package:flutter_clean_riverpod/service/connectivity_service.dart';
import 'package:flutter_clean_riverpod/service/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';

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
    await _dependenciesInitialize();
    _isInitialized = true;
  }

  Future<void> _dependenciesInitialize() async {
    await GetIt.instance
        .registerSingleton(SharedPreferencesService())
        .ensureInitialized();
    final connectivityService =
        GetIt.instance.registerSingleton(ConnectivityService());
    final apiClient = GetIt.instance.registerSingleton(
      ApiClient(
        Dio(),
        connectivityService,
      ),
    );
    GetIt.instance.registerFactory<CountryRepository>(
      () => CountryRepositoryImpl(apiClient),
    );
  }
}
