import 'package:get/get.dart';
import 'package:techandlearn/View/CertificationScreen/CertificationScreen.dart';
import 'package:techandlearn/View/CourseDetailScreen/CourseDetailScreen.dart';
import 'package:techandlearn/View/LoginScreen/LoginScreen.dart';
import 'package:techandlearn/View/RegisterScreen/RegisterScreen.dart';
import 'package:techandlearn/View/RegistrationCourseScreen/RegistrationCourseScreen.dart';

import '../View/AboutScreen.dart';
import '../View/CourseVideo.dart';
import '../View/HomeScreen/HomeScreen.dart';
import '../View/SplashScreen/SplashScreen.dart';

class Routes {
  static var splash = '/';
  static var home = '/home';
  static var coursedetail = '/coursedetail';
  static var registrationcourse = '/registrationcourse';
  static var certification = '/certification';
  static var selectcourse = '/selectcourse';

  static var login = '/signin';
  static var coursevideo = '/coursevideo';
  static var registration = '/registration';
  static var aboutus = '/aboutus';

  final routes = [
    GetPage(
        name: splash, page: () => SplashScreen(), transition: Transition.zoom),
    GetPage(
        name: login,
        page: () => LoginScreen(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: registration,
        page: () => RegisterScreen(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: home,
        page: () => HomeScreen(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: coursedetail,
        page: () => CourseDetailScreen(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: registrationcourse,
        page: () => RegistrationCourseScreen(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: certification,
        page: () => CertificationScreen(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: selectcourse,
        page: () => CertificationScreen(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: aboutus,
        page: () => AboutScreen(),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: coursevideo,
        page: () => CourseVideo(),
        transition: Transition.leftToRightWithFade),
  ];
}
