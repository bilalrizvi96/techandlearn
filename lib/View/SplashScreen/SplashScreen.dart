import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/Colors.dart';
import '../../Controller/SplashController.dart';
import '../../Services/BaseUrl.dart';

class SplashScreen extends StatelessWidget {
  SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: splashController,
        builder: (_) {
          return Scaffold(
            body: Container(
              width: width,
              height: height,
              color: white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                    height: height / 4,
                  ),
                  Spacer(),
                  Text(
                    'v ${BaseUrl.version}',
                    style: GoogleFonts.poppins(
                        color: black,
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: height / 50,
                  )
                ],
              ),
            ),
          );
        });
  }
}
