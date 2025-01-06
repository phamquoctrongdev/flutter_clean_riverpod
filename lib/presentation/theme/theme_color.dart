import 'package:flutter/material.dart';

enum AppColor {
  mainColor,
  secondaryColor,
  avatarBorderColor,
  primaryTextColor,
  errorColor,
  primaryTextDescriptionColor,
  primaryColor,
  primaryBackground,
  secondaryBackground,
  secondaryButtonTitle,
  secondaryTextColor,
  primaryTextButtonColor,
  primaryTextFieldBackground,
}

class ThemeColor extends ThemeExtension<ThemeColor> {
  final Map<AppColor, Color>? colors;

  const ThemeColor({
    this.colors,
  });

  Color? getColor(AppColor key) {
    return colors?[key];
  }

  @override
  ThemeExtension<ThemeColor> copyWith({
    Map<AppColor, Color>? colors,
  }) {
    return ThemeColor(
      colors: colors ?? this.colors,
    );
  }

  @override
  ThemeExtension<ThemeColor> lerp(
      covariant ThemeExtension<ThemeColor>? other, double t) {
    if (other is! ThemeColor) return this;

    final Map<AppColor, Color> lColors = {};
    colors?.forEach((key, value) {
      lColors[key] = Color.lerp(value, other.colors?[key], t) ?? value;
    });

    return ThemeColor(colors: lColors);
  }
}
