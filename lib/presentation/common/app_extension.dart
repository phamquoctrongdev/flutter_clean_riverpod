import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/presentation/ui/core/loading_mask.dart';

import '../../data/error/api_error.dart';
import '../../generated/locale_keys.g.dart';
import '../theme/theme_color.dart';

extension CustomThemeExtension on BuildContext {
  Color color(AppColor key) {
    final theme = Theme.of(this).extension<ThemeColor>();
    return theme?.colors?[key] ?? Colors.black;
  }

  bool get isDarkTheme {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }

  Future<T?> showError<T>(Object? error) async {
    if (error is ApiError) {
      return showAlertDialog(
        context: this,
        message: error.message,
        title: LocaleKeys.api_error_label.tr(),
      );
    }
    // TODO: Show more types of error here.
    return null;
  }

  void openLoadingMask() {
    findAncestorStateOfType<LoadingMaskState>()?.show();
  }

  void closeLoadingMask() {
    findAncestorStateOfType<LoadingMaskState>()?.close();
  }
}
