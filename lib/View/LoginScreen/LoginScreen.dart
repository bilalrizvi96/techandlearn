import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techandlearn/Component/Colors.dart';
import 'package:techandlearn/Controller/LoginController.dart';
import 'package:techandlearn/Services/BaseUrl.dart';

import '../../Routes/Routes.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Container(
        // constraints: BoxConstraints.expand(),
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        // image: AssetImage("assets/splash_cut.png"), fit: BoxFit.cover)),

        child: GetBuilder(
            init: loginController,
            builder: (context) {
              return Stack(
                children: [
                  Opacity(
                    opacity: .5,
                    child: Container(
                        height: height,
                        width: width,
                        child: Image.asset("assets/splash_cut.png",
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/logo.png',
                          fit: BoxFit.cover,
                          height: height / 6,
                        ),
                        Text(
                          'Sign in',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: loginController.emailController,
                                validator: (value) =>
                                    EmailValidator.validate(value!)
                                        ? null
                                        : "Please enter a valid email",
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
                                  prefixIcon: const Icon(Icons.email),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black.withOpacity(.6))),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: loginController.passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                maxLines: 1,
                                obscureText:
                                    loginController.passwordVisible.value,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        loginController.passwordVisible.value =
                                            !loginController
                                                .passwordVisible.value;
                                        loginController.update();
                                      },
                                      child: loginController
                                              .passwordVisible.value
                                          ? Icon(Icons.visibility_off_outlined)
                                          : Icon(Icons.visibility_outlined)),
                                  hintText: 'Enter your password',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(.6)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              CheckboxListTile(
                                title: const Text("Remember me"),
                                contentPadding: EdgeInsets.zero,
                                value: loginController.rememberValue,
                                activeColor: Colors.black,
                                onChanged: (newValue) {
                                  loginController.valueCheckBox(newValue);
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    loginController.Loading.value = true;
                                    loginController.update();
                                    try {
                                      final user = await loginController.auth
                                          .signInWithEmailAndPassword(
                                              email: loginController
                                                  .emailController.text
                                                  .toString(),
                                              password: loginController
                                                  .passwordController.text);
                                      if (user != null) {
                                        if (loginController.rememberValue) {
                                          BaseUrl.storage.write('token', 'yes');
                                        } else {
                                          BaseUrl.storage.write('token', 'no');
                                        }

                                        Get.snackbar(
                                          'Success',
                                          "Display the message here",
                                          colorText: Colors.white,
                                          backgroundColor: Colors.lightBlue,
                                          icon: const Icon(Icons.done),
                                        );
                                        loginController.Loading.value = false;
                                        loginController.update();
                                        Get.offAllNamed(Routes.home);
                                      } else {
                                        Get.snackbar(
                                          'Error',
                                          "Something went wrong",
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red,
                                          icon: const Icon(Icons.add_alert),
                                        );
                                        loginController.Loading.value = false;
                                        loginController.update();
                                      }
                                    } catch (e) {
                                      print(e);
                                      Get.snackbar(
                                        'Error',
                                        e
                                            .toString()
                                            .replaceFirst('[', '')
                                            .replaceFirst(']', '')
                                            .replaceFirst(
                                                'firebase_auth/user-not-found',
                                                ''),
                                        colorText: Colors.white,
                                        backgroundColor: Colors.red,
                                        icon: const Icon(Icons.add_alert),
                                      );
                                      loginController.Loading.value = false;
                                      loginController.update();
                                    }
                                  }
                                },
                                child: Container(
                                  height: height / 15,
                                  width: width / 1.2,
                                  decoration: BoxDecoration(
                                      color: primarycolor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Sign in',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        ),
                                        if (loginController.Loading.value)
                                          SizedBox(width: width / 20),
                                        if (loginController.Loading.value)
                                          SizedBox(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2.0,
                                            ),
                                            width: width / 28,
                                            height: height / 45,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Not registered yet?'),
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.registration);
                                    },
                                    child: Text(
                                      'Create an account',
                                      style: GoogleFonts.poppins(
                                          color: black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
