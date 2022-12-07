import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techandlearn/Component/Colors.dart';
import 'package:techandlearn/Controller/LoginController.dart';

import '../../Routes/Routes.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GetBuilder(
            init: loginController,
            builder: (context) {
              return Column(
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
                          validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Please enter a valid email",
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text("Remember me"),
                          contentPadding: EdgeInsets.zero,
                          value: loginController.rememberValue,
                          activeColor: primarycolor,
                          onChanged: (newValue) {
                            loginController.valueCheckBox(newValue);
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                final user = await loginController.auth
                                    .signInWithEmailAndPassword(
                                    email: loginController
                                        .emailController.text
                                        .toString(),
                                    password: loginController
                                        .passwordController.text);
                                if (user != null) {
                                  Get.offAllNamed(Routes.home);
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: Container(
                            height: height / 15,
                            width: width / 1.2,
                            decoration: BoxDecoration(
                                color: primarycolor,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, color: white),
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
                                    color: black, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
