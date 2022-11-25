import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Routes/Routes.dart';
import '../Services/BaseUrl.dart';

class SplashController extends GetxController {


  FirebaseMessaging? _firebaseMessaging;


  @override
  void onInit() {
    super.onInit();

    this._registerOnFirebase();
    this.getMessage();
    if (Platform.isAndroid) {
      permissions();
    }
    checks();
    update();
  }

  _registerOnFirebase() async {
    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging!.subscribeToTopic('all');
    await _firebaseMessaging!
        .getToken()
        .then((var token) => BaseUrl.fcm_token = token.toString());
    print(BaseUrl.fcm_token.toString());
  }

  void getMessage() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    print(settings);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        Get.snackbar(" ${notification.title.toString()}",
            "${notification.body.toString()}");
      }

      print('Message clicked!');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      print('Message clicked!');
      if (notification != null) {
        Get.snackbar(
          "${notification.title.toString().trim()}",
          "${notification.body.toString().trim()}",
        );
      }
    });
  }

  permissions() async {
    if (await Permission.location.request().isGranted) {
      update();
    } else {
      permissions();
    }
    if (await Permission.camera.request().isGranted) {
      update();
    } else {
      permissions();
    }
    if (await Permission.storage.request().isGranted) {
      update();
    } else {
      permissions();
    }
  }

  checks() {
    Future.delayed(new Duration(milliseconds: 2000), () {
      Get.offAllNamed(Routes.login);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
