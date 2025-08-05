

class AppRoutes {
  static final homeRoute = Route(path: '/home');
  static final searchRoute = Route(path: '/search');
  static final favourite = Route(path: '/favourite');
  static final setting = Route(path: '/setting');
  static final detailSetting = Route(
    path: '/setting/detail_setting',
    nestedPath: 'detail_setting',
  );
}

class Route {
  final String? nestedPath;
  final String path;

  Route({required this.path, this.nestedPath});
}
