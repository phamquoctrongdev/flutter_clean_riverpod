import 'package:flutter/material.dart';

import 'theme_color.dart';

class DarkTheme extends ThemeColor {
  @override
  Map<AppColor, Color>? get colors => {
        AppColor.mainColor: Colors.black,
        AppColor.secondaryColor: Colors.white,
        AppColor.avatarBorderColor: Colors.white,
        AppColor.primaryColor: Colors.white24,
        AppColor.primaryTextColor: Colors.white,
        AppColor.primaryBackground: const Color(0xff28292C),
        AppColor.secondaryBackground: const Color(0xff181A20),
        AppColor.secondaryButtonTitle: Colors.black,
        AppColor.secondaryTextColor: const Color(0xffEFEEEF),
        AppColor.primaryTextButtonColor: Colors.white,
        AppColor.primaryTextFieldBackground: const Color(0xff3D3D41),
        AppColor.primaryTextDescriptionColor: Colors.white.withValues(alpha: 0.6),
        AppColor.errorColor: Colors.red,
      };
}
