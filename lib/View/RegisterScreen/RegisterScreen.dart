import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techandlearn/Component/Colors.dart';

import '../../Controller/RegistrationController.dart';
import '../../Routes/Routes.dart';

class RegisterScreen extends StatelessWidget {
  RegistrationController registrationController =
      Get.put(RegistrationController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: Container(
        child: GetBuilder(
            init: registrationController,
            builder: (_) {
              return SingleChildScrollView(
                child: Stack(
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller:
                                      registrationController.emailController,
                                  validator: (value) =>
                                      EmailValidator.validate(value!)
                                          ? null
                                          : "Please enter a valid email",
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    suffix: GestureDetector(
                                        onTap: () {
                                          registrationController
                                              .valueCheck('email');
                                        },
                                        child: Icon(
                                          registrationController
                                                      .speechEnabled.value ==
                                                  false
                                              ? Icons.mic
                                              : Icons.mic,
                                          color: Colors.blue,
                                        )),
                                    hintText: 'Enter your email',
                                    prefixIcon: const Icon(
                                      Icons.email,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: registrationController
                                      .nameController, //sahi hogaya

                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Father Name';
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person),
                                    suffix: GestureDetector(
                                        onTap: () {
                                          registrationController
                                              .valueCheck('name');
                                        },
                                        child: Icon(
                                          registrationController
                                                      .speechEnabled.value ==
                                                  false
                                              ? Icons.mic
                                              : Icons.mic,
                                          color: Colors.blue,
                                        )),
                                    hintText: 'Enter your Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller:
                                      registrationController.f_nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Father Name';
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person),
                                    suffix: GestureDetector(
                                        onTap: () {
                                          registrationController
                                              .valueCheck('fname');
                                        },
                                        child: Icon(
                                          registrationController
                                                      .speechEnabled.value ==
                                                  false
                                              ? Icons.mic
                                              : Icons.mic,
                                          color: Colors.blue,
                                        )),
                                    hintText: 'Enter your Father Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller:
                                      registrationController.contactController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Contact';
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 11,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.contact_mail),
                                    hintText: 'Enter your Contact',
                                    suffix: GestureDetector(
                                        onTap: () {
                                          registrationController
                                              .valueCheck('number');
                                        },
                                        child: Icon(
                                          registrationController
                                                      .speechEnabled.value ==
                                                  false
                                              ? Icons.mic
                                              : Icons.mic,
                                          color: Colors.blue,
                                        )),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller:
                                      registrationController.passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  obscureText: registrationController
                                      .passwordVisible.value,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          registrationController
                                                  .passwordVisible.value =
                                              !registrationController
                                                  .passwordVisible.value;
                                          registrationController.update();
                                        },
                                        child: registrationController
                                                .passwordVisible.value
                                            ? Icon(
                                                Icons.visibility_off_outlined)
                                            : Icon(Icons.visibility_outlined)),
                                    hintText: 'Enter your password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: registrationController
                                      .c_passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your confirm password';
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  obscureText: registrationController
                                      .confirmPasswordVisible.value,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          registrationController
                                                  .confirmPasswordVisible
                                                  .value =
                                              !registrationController
                                                  .confirmPasswordVisible.value;
                                          registrationController.update();
                                        },
                                        child: registrationController
                                                .confirmPasswordVisible.value
                                            ? Icon(
                                                Icons.visibility_off_outlined)
                                            : Icon(Icons.visibility_outlined)),
                                    hintText: 'Confirm password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      registrationController
                                          .registerationauth();
                                    }
                                    print(registrationController.Loading.value);
                                  },
                                  child: Container(
                                    height: height / 15,
                                    width: width / 1.2,
                                    decoration: BoxDecoration(
                                        color: primarycolor,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Sign up',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        ),
                                        if (registrationController
                                            .Loading.value)
                                          SizedBox(width: width / 20),
                                        if (registrationController
                                            .Loading.value)
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Already Have a Account?'),
                                    TextButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.login);
                                      },
                                      child: Text(
                                        'Sign In',
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
                ),
              );
            }),
      ),
    );
  }
}
