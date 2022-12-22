import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Routes/Routes.dart';
import '../Services/Database.dart';

class RegistrationController extends GetxController {
  final auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var f_nameController = TextEditingController();
  var contactController = TextEditingController();
  var nameController = TextEditingController();
  registerationauth() async {
    final newUser = await auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString());
    if (newUser != null) {
      addStudent();
    }
  }

  addStudent() {
    Database().addStudent(
        contact: contactController.text.toString(),
        f_name: f_nameController.text.toString(),
        password: passwordController.text.toString(),
        s_name: nameController.text.toString());
    Get.offAllNamed(Routes.home);
  }
}
