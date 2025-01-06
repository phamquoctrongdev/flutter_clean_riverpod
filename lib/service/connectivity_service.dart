import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  Future<bool> hasInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult.any((element) => [
          ConnectivityResult.mobile,
          ConnectivityResult.ethernet,
          ConnectivityResult.wifi
        ].contains(element));
  }
}
