import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techandlearn/Services/BaseUrl.dart';

class LoginController extends GetxController {
  var rememberValue = false;
  final databaseRef = FirebaseDatabase.instance;
  final auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  getStudent() async {
    print('haris');
    // optionList.value.clear();
    await databaseRef.ref('Student').onValue.listen((DatabaseEvent event) {
      Map<String, dynamic>.from(event.snapshot.value as dynamic)
          .forEach((key, value) {
        BaseUrl.storage.write("name", value['s_name']);
        BaseUrl.storage.write("semester", value['semester']);
        update();
      });
    });
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getStudent();
  }

  valueCheckBox(newValue) {
    rememberValue = newValue!;

    update();
  }
}
