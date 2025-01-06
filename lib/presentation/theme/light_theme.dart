import 'package:flutter/material.dart';

import 'theme_color.dart';

class LightTheme extends ThemeColor {
  @override
  Map<AppColor, Color>? get colors => {
        AppColor.mainColor: Colors.green,
        AppColor.secondaryColor: const Color(0x330a9d8d),
        AppColor.avatarBorderColor: Colors.green,
        AppColor.primaryColor: Colors.white70,
        AppColor.primaryTextColor: Colors.black,
        AppColor.primaryBackground: Colors.white,
        AppColor.secondaryBackground: const Color(0xffF5F5F5),
        AppColor.secondaryButtonTitle: const Color(0xff0a9d8d),
        AppColor.secondaryTextColor: const Color(0xff5F5F5F),
        AppColor.primaryTextButtonColor: Colors.white,
        AppColor.primaryTextFieldBackground: const Color(0xffFAFAFA),
        AppColor.primaryTextDescriptionColor: Colors.black.withOpacity(0.6),
        AppColor.errorColor: Colors.red,
      };
}
