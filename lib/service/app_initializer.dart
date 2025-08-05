import 'package:flutter/widgets.dart';
import 'package:flutter_clean_riverpod/data/core/api_client.dart';
import 'package:flutter_clean_riverpod/data/core/dio_service.dart';
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
    final dio = GetIt.instance.registerSingleton(DioService()).initialize();
    final connectivity = GetIt.instance.get<ConnectivityService>();
    final apiClient = GetIt.instance.registerSingleton(
      ApiClient(dio, connectivity),
    );
    GetIt.instance.registerFactory<CountryRepository>(
      () => CountryRepositoryImpl(apiClient),
    );
  }
}
