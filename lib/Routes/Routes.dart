import 'package:get/get.dart';
import 'package:techandlearn/View/LoginScreen/LoginScreen.dart';

import '../View/SplashScreen/SplashScreen.dart';

class Routes {
  static var splash = '/';
  static var home = '/home';

  static var login = '/signinemp';
  static var registration = '/registration';

  final routes = [
    GetPage(
        name: splash, page: () => SplashScreen(), transition: Transition.zoom),
    GetPage(
        name: login, page: () => LoginScreen(), transition: Transition.zoom),
  ];
}
