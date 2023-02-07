import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Routes/Routes.dart';
import '../Services/Database.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class RegistrationController extends GetxController {
  final auth = FirebaseAuth.instance;
  var Loading = false.obs;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordVisible = true.obs;
  var confirmPasswordVisible = true.obs;
  var c_passwordController = TextEditingController();
  var f_nameController = TextEditingController();
  var contactController = TextEditingController();
  var nameController = TextEditingController();

  SpeechToText speechToText = SpeechToText();
  var speechEnabled = false.obs;
  var textField = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initSpeech();
  }

  void initSpeech() async {
    speechEnabled.value = await speechToText.initialize();
    update();
  }

  void startListening() async {
    print('haris');
    await speechToText.listen(onResult: onSpeechResult);
    update();
  }

  void stopListening() async {
    print('haris1');
    await speechToText.stop();
    update();
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    // update();
    if (textField.value == 'name') {
      speechToText.isListening
          ? nameController.text = result.recognizedWords
          : speechEnabled.value
              ? 'Tap the microphone to start listening...'
              : 'Speech not available';
    } else if (textField.value == 'fname') {
      speechToText.isListening
          ? f_nameController.text = result.recognizedWords
          : speechEnabled.value
              ? 'Tap the microphone to start listening...'
              : 'Speech not available';
    } else if (textField.value == 'number') {
      // result.recognizedWords.isNum;
      speechToText.isListening
          ? contactController.text = result.recognizedWords
          : speechEnabled.value
              ? 'Tap the microphone to start listening...'
              : 'Speech not available';
    } else if (textField.value == 'email') {
      speechToText.isListening
          ? emailController.text = result.recognizedWords.removeAllWhitespace
          : speechEnabled.value
              ? 'Tap the microphone to start listening...'
              : 'Speech not available';
    }
    print(result.recognizedWords);
    update();
  }

  valueCheck(value) {
    print(speechToText.isNotListening);
    if (speechToText.isNotListening) {
      speechEnabled.value = false;
      update();
    } else {
      speechEnabled.value = true;
      update();
    }
    textField.value = value;
    speechToText.isNotListening ? startListening() : stopListening();
    update();
  }

  registerationauth() async {
    if (passwordController.text == c_passwordController.text) {
      if (c_passwordController.text.length >= 8) {
        Loading.value = true;
        update();
        final newUser = await auth.createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString());
        if (newUser != null) {
          addStudent();
          Loading.value = false;
          update();
          Get.snackbar(
            'Success',
            "Register Successfully",
            colorText: Colors.white,
            backgroundColor: Colors.lightBlue,
            icon: const Icon(Icons.add_alert),
          );
          Get.offAllNamed(Routes.login);
        }
        Loading.value = false;
        update();
      } else {
        Get.snackbar(
          'Error',
          "Password should be at least 8 characters",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.add_alert),
        );
      }
    } else {
      Get.snackbar(
        'Error',
        "Password didn't match",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
    }
  }

  addStudent() {
    var semester = Random().nextInt(3);
    Database().addStudent(
        contact: contactController.text.toString(),
        f_name: f_nameController.text.toString(),
        password: passwordController.text.toString(),
        semester: semester.toString(),
        s_name: nameController.text.toString(),
        email: emailController.text.toString());
    Get.offAllNamed(Routes.login);
  }
}
