import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techandlearn/Component/Colors.dart';
import 'package:techandlearn/Services/Database.dart';

import '../../Controller/RegistrationController.dart';
import '../../Routes/Routes.dart';

class AddCourse extends StatelessWidget {
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
        padding: const EdgeInsets.all(20),
        child: GetBuilder(
            init: registrationController,
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Add Course',
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
                            controller: registrationController.emailController,
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
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
                            controller: registrationController.nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Name';
                              }
                              return null;
                            },
                            maxLines: 1,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              suffix: Icon(
                                Icons.mic,
                                color: secondarycolor,
                              ),
                              hintText: 'Enter your no of student allow',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: registrationController.f_nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Father Name';
                              }
                              return null;
                            },
                            maxLines: 1,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              suffix: Icon(
                                Icons.mic,
                                color: secondarycolor,
                              ),
                              hintText: 'Enter your cost',
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
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.contact_mail),
                              hintText: 'Enter your Time',
                              suffix: Icon(
                                Icons.mic,
                                color: secondarycolor,
                              ),
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
                              Database().addCourse(
                                  c_name: registrationController
                                      .emailController.text
                                      .toString(),
                                  cost: registrationController
                                      .f_nameController.text
                                      .toString(),
                                  t_std: registrationController
                                      .nameController.text
                                      .toString(),
                                  time: registrationController
                                          .contactController.text
                                          .toString() +
                                      'hr');
                            },
                            child: Container(
                              height: height / 15,
                              width: width / 1.2,
                              decoration: BoxDecoration(
                                  color: primarycolor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                child: Text(
                                  'Add Course',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
