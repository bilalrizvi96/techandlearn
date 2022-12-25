import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techandlearn/Component/Images.dart';
import 'package:techandlearn/Controller/PaymentController.dart';

import '../../Component/Colors.dart';
import '../../Routes/Routes.dart';

class RegistrationCourseScreen extends StatelessWidget {
  RegistrationCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
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
            Text(
              "Registration Course",
              style: GoogleFonts.rajdhani(
                fontWeight: FontWeight.w400,
                fontSize: width / 20,
                color: Colors.black,
                // Colors.black.withOpacity(0.80)
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 2,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.registratercourse);
                  },
                  child: Container(
                    height: height / 20,
                    width: width / 20,
                    margin:
                        EdgeInsets.only(right: width / 30, bottom: height / 50),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(tileImage), fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height / 50, horizontal: width / 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            index == 0 ? "Course" : 'Certification Course',
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
        ),
      ),
    );
  }
}
