import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techandlearn/Controller/HomeController.dart';
import 'package:techandlearn/Routes/Routes.dart';

import '../../Component/Colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GetBuilder(
            init: homeController,
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Spacer(),
                      Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.cover,
                        height: height / 6,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.login);
                        },
                        child: Icon(
                          Icons.login,
                          color: Colors.red,
                          size: width / 15,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: homeController.optionList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                homeController.courseSelection(index);
                              },
                              child: Container(
                                width: width,
                                height: height / 15,
                                decoration: BoxDecoration(
                                    color: primarycolor.withOpacity(0.34),
                                    border: Border.all(
                                        color: homeController.optionList[index]
                                                    .selected ==
                                                true
                                            ? secondarycolor
                                            : Colors.transparent,
                                        width: 3),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Center(
                                  child: Text(
                                    homeController.optionList[index].name,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                        color:
                                            secondarycolor.withOpacity(0.80)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              );
            }),
      ),
    );
  }
}
