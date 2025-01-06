import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart';

enum AppBottomNavigationTab {
  feed,
  search,
  favourite,
  setting,
}

extension AppBottomNavigationTabExt on AppBottomNavigationTab {
  String get title {
    switch (this) {
      case AppBottomNavigationTab.feed:
        return LocaleKeys.home_tab_feed.tr();
      case AppBottomNavigationTab.search:
        return LocaleKeys.home_tab_search.tr();
      case AppBottomNavigationTab.favourite:
        return LocaleKeys.home_tab_favourite.tr();
      case AppBottomNavigationTab.setting:
        return LocaleKeys.home_tab_setting.tr();
    }
  }

  Widget get icon {
    switch (this) {
      case AppBottomNavigationTab.feed:
        return Icon(Icons.home_outlined);
      case AppBottomNavigationTab.search:
        return Icon(Icons.search_outlined);
      case AppBottomNavigationTab.favourite:
        return Icon(Icons.favorite_outline_rounded);
      case AppBottomNavigationTab.setting:
        return Icon(Icons.settings_outlined);
    }
  }
}
