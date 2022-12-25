import 'package:get/get.dart';
import 'package:techandlearn/View/CertificationScreen/CertificationScreen.dart';
import 'package:techandlearn/View/CurrentCourseScreen/CurrentCourseScreen.dart';
import 'package:techandlearn/View/LoginScreen/LoginScreen.dart';
import 'package:techandlearn/View/RegisterScreen/RegisterScreen.dart';
import 'package:techandlearn/View/RegistraterCourseScreen/RegistraterCourseScreen.dart';
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
  static var registratercourse = '/registratercourse';
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
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: registration,
        page: () => RegisterScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: home,
        page: () => HomeScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: coursedetail,
        page: () => CurrentCourseScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: registrationcourse,
        page: () => RegistrationCourseScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: certification,
        page: () => CertificationScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: selectcourse,
        page: () => CertificationScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: aboutus,
        page: () => AboutScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: coursevideo,
        page: () => CourseVideo(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: registratercourse,
        page: () => RegistraterCourseScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
  ];
}
