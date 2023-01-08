// @dart=2.9
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Routes/Routes.dart';
import 'Services/BaseUrl.dart';
import 'View/addcourse.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message,
    {BuildContext context}) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  ///FIREBASE INITIALIZATION
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;
  // Stripe.publishableKey = BaseUrl.publishKey;
  // await Stripe.instance.applySettings();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAeELaViOLEJHwdYRmhaYFKqjq1rrnQ2i4',
          appId: '1:660776089340:android:0c16f839c1b3d33211c979',
          messagingSenderId: '660776089340',
          projectId: 'techlearn-e15a3'));
  // NotificationSettings settings =
  //     await FirebaseMessaging.instance.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: true,
  //   provisional: true,
  //   sound: true,
  // );
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await FirebaseMessaging.instance
  //     .setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );
  await Firebase.initializeApp();
  // else {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   GestureBinding.instance?.resamplingEnabled = true;
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp();
  //
  //   NotificationSettings settings =
  //       await FirebaseMessaging.instance.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: true,
  //     provisional: true,
  //     sound: true,
  //   );
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //   await FirebaseMessaging.instance
  //       .setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //   );
  // }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  ///STATE MANAGEMENT
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.full,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.native,
      title: 'Tech and Learn',
      transitionDuration: Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      // home: AddCourse(),
      initialRoute: Routes.splash,
      getPages: Routes().routes,
    );
  }
}
