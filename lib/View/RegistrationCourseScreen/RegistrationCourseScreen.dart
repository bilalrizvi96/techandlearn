import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
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
            Text(
              'Register Course',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: width,
              height: height / 15,
              decoration: BoxDecoration(
                  color: primarycolor.withOpacity(0.34),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                child: Text(
                  'Course',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: secondarycolor.withOpacity(0.80)),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: width,
                height: height / 15,
                decoration: BoxDecoration(
                    color: primarycolor.withOpacity(0.34),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                  child: Text(
                    'Certification Course',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: secondarycolor.withOpacity(0.80)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
