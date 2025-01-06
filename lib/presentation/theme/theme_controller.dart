import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../service/shared_preferences_service.dart';
import '../common/app_constants.dart';

final themeProvider = AsyncNotifierProvider<ThemeController, ThemeMode>(
  () => ThemeController(GetIt.instance.get<SharedPreferencesService>()),
);

class ThemeController extends AsyncNotifier<ThemeMode> {
  final SharedPreferencesService preferencesService;

  ThemeController(this.preferencesService);

  @override
  Future<ThemeMode> build() async {
    return await _getStoredThemeMode();
  }

  Future<void> setTheme(ThemeMode theme) async {
    await _saveThemeMode(theme);
    state = AsyncData(theme);
  }

  Future<void> _saveThemeMode(ThemeMode theme) async {
    await preferencesService.saveString(AppConstants.themeModeKey, theme.name);
  }

  Future<ThemeMode> _getStoredThemeMode() async {
    final themeName = preferencesService.getString(AppConstants.themeModeKey);
    switch (themeName) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
