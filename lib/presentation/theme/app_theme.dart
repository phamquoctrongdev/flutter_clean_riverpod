import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/presentation/theme/app_theme_extension.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(extensions: [
    _lightThemeExtension,
  ]);

  static final _lightThemeExtension = AppThemeExtension(colors: {
    AppPalette.mainColor: Colors.white,
    AppPalette.secondaryColor: const Color(0x330a9d8d),
    AppPalette.avatarBorderColor: Colors.green,
    AppPalette.primaryColor: Colors.white70,
    AppPalette.primaryTextColor: Colors.black,
    AppPalette.primaryBackground: Colors.white,
    AppPalette.secondaryBackground: const Color(0xffF5F5F5),
    AppPalette.secondaryButtonTitle: const Color(0xff0a9d8d),
    AppPalette.secondaryTextColor: const Color(0xff5F5F5F),
    AppPalette.primaryTextButtonColor: Colors.white,
    AppPalette.primaryTextFieldBackground: const Color(0xffFAFAFA),
    AppPalette.primaryTextDescriptionColor: Colors.black.withValues(
      alpha: 0.6,
    ),
    AppPalette.errorColor: Colors.red,
  });

  static final darkTheme = ThemeData.dark().copyWith(extensions: [
    _darkThemeExtension,
  ]);

  static final _darkThemeExtension = AppThemeExtension(colors: {
    AppPalette.mainColor: Colors.black,
    AppPalette.secondaryColor: Colors.white,
    AppPalette.avatarBorderColor: Colors.white,
    AppPalette.primaryColor: Colors.white24,
    AppPalette.primaryTextColor: Colors.white,
    AppPalette.primaryBackground: const Color(0xff28292C),
    AppPalette.secondaryBackground: const Color(0xff181A20),
    AppPalette.secondaryButtonTitle: Colors.black,
    AppPalette.secondaryTextColor: const Color(0xffEFEEEF),
    AppPalette.primaryTextButtonColor: Colors.white,
    AppPalette.primaryTextFieldBackground: const Color(0xff3D3D41),
    AppPalette.primaryTextDescriptionColor: Colors.white.withValues(alpha: 0.6),
    AppPalette.errorColor: Colors.red,
  });
}
