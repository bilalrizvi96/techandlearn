import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/Colors.dart';
import '../../Controller/PaymentController.dart';

class RegistraterCourseScreen extends StatelessWidget {
  RegistraterCourseScreen({Key? key}) : super(key: key);
  Payment payment = Get.put(Payment());
  var val = Get.arguments;
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
        child: GestureDetector(
          onTap: () {
            payment.regCourse(val[7]);
            // payment.checkOut();
            // Payment().makePayment(context, double.parse('25'), 1254.toString());
          },
          child: Container(
            height: height / 15,
            width: width / 1.2,
            decoration: BoxDecoration(
                color: primarycolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0))),
            child: Center(
              child: Text(
                'Buy Now',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, color: white),
              ),
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
              Opacity(
                opacity: 0.5,
                child: Image.network(
                  val[6],
                  fit: BoxFit.contain,
                  width: width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height / 28,
                      width: width / 5,
                      decoration: BoxDecoration(
                        color: secondarycolor.withOpacity(0.75),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          'Premium',
                          style: GoogleFonts.rajdhani(
                              fontWeight: FontWeight.w600,
                              fontSize: width / 35,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Row(
                      children: [
                        Text(
                          val[5],
                          style: GoogleFonts.rajdhani(
                              fontWeight: FontWeight.w700,
                              fontSize: width / 20,
                              color: Colors.white),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              val[3].toString().toUpperCase(),
                              style: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.w700,
                                  fontSize: width / 20,
                                  color: Colors.white),
                            ),
                            Text(
                              val[4] + ' PM',
                              style: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.w700,
                                  fontSize: width / 20,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.people,
                          size: width / 25,
                          color: Colors.white.withOpacity(0.75),
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Text(
                          val[2].toString(),
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: width / 32,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          '\$ ' + val[0].toString(),
                          style: GoogleFonts.rajdhani(
                              fontWeight: FontWeight.w400,
                              fontSize: width / 20,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: width / 40,
                        )
                      ],
                    ),
                  ],
                ),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 50, vertical: height / 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: width / 20,
                            color: Colors.black,
                            // Colors.black.withOpacity(0.80)
                          ),
                        ),
                        Text(
                          val[1],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: width / 35,
                            color: Colors.black,
                            // Colors.black.withOpacity(0.80)
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
