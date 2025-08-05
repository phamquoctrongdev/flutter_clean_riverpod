import 'package:flutter/material.dart';

enum AppPalette {
  mainColor,
  secondaryColor,
  primaryTextColor,
  errorColor,
  primaryColor,
  primaryBackground,
  secondaryBackground,
  primaryTextFieldBackground,
  secondaryButtonTitle,
}

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Map<AppPalette, Color> colors;

  const AppThemeExtension({required this.colors});

  Color getColor(AppPalette key) {
    assert(colors[key] != null);
    return colors[key]!;
  }

  @override
  ThemeExtension<AppThemeExtension> copyWith({Map<AppPalette, Color>? colors}) {
    return AppThemeExtension(colors: colors ?? this.colors);
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;

    final mergedColors = <AppPalette, Color>{};
    final allKeys = {...colors.keys, ...other.colors.keys};

    for (final key in allKeys) {
      final a = colors[key];
      final b = other.colors[key];
      mergedColors[key] = Color.lerp(a, b, t) ?? a ?? b!;
    }

    return AppThemeExtension(colors: mergedColors);
  }
}
