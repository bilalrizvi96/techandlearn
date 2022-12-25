import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/Colors.dart';

class RegistraterCourseScreen extends StatelessWidget {
  const RegistraterCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        width: width,
        color: Colors.white,
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: height / 15,
          width: width / 1.2,
          decoration: BoxDecoration(
              color: primarycolor, borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: Text(
              'Buy Now',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: white),
            ),
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: SafeArea(
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20.0,
                  sigmaY: 10.0,
                ),
                child: Image.network(
                  'https://img-cdn.inc.com/image/upload/w_1920,h_1080,c_fill/images/panoramic/getty_1187833318_2000133220009280118_mbtvwq.jpg',
                  fit: BoxFit.contain,
                  width: width,
                ),
              ),
              Column(
                children: [],
              ),
              Positioned(
                top: height / 4,
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50.0))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
