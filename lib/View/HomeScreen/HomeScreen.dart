import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techandlearn/Component/Images.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: height / 50,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.cover,
                        width: width / 15,
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
                    ],
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  RichText(
                    text: new TextSpan(
                      // text: 'Hello ',

                      children: <TextSpan>[
                        new TextSpan(
                          text: 'Hello ',
                          style: GoogleFonts.rajdhani(
                            fontWeight: FontWeight.w400,
                            fontSize: width / 22,
                            color: Colors.black,
                            // Colors.black.withOpacity(0.80)
                          ),
                        ),
                        new TextSpan(
                          text: 'Haris,',
                          style: GoogleFonts.rajdhani(
                            fontWeight: FontWeight.w400,
                            fontSize: width / 21,
                            color: Colors.indigo,
                            // Colors.black.withOpacity(0.80)
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Text(
                    "Select Category",
                    style: GoogleFonts.rajdhani(
                      fontWeight: FontWeight.w400,
                      fontSize: width / 25,
                      color: Colors.grey,
                      // Colors.black.withOpacity(0.80)
                    ),
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Categories",
                        style: GoogleFonts.rajdhani(
                          fontWeight: FontWeight.w500,
                          fontSize: width / 22,
                          color: secondarycolor,
                          // Colors.black.withOpacity(0.80)
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        color: primarycolor,
                        size: height / 30,
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: homeController.optionList.length,
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          homeController.courseSelection(index);
                        },
                        child: Container(
                          height: height / 20,
                          width: width / 20,
                          margin: EdgeInsets.only(
                              right: width / 30, bottom: height / 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(tileImage),
                                fit: BoxFit.cover),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: height / 50, horizontal: width / 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  homeController.optionList[index].name,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 30,
                                    color: Colors.black,
                                    // Colors.black.withOpacity(0.80)
                                  ),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  "Click Here",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 40,
                                    color: primarycolor,
                                    // Colors.black.withOpacity(0.80)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
