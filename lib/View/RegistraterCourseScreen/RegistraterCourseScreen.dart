import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/Colors.dart';
import '../../Controller/PaymentController.dart';

class RegistraterCourseScreen extends StatelessWidget {
  RegistraterCourseScreen({Key? key}) : super(key: key);
  Payment payment = Get.put(Payment());
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
                  'https://images.pexels.com/photos/8460453/pexels-photo-8460453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
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
                    Text(
                      'OOP',
                      style: GoogleFonts.rajdhani(
                          fontWeight: FontWeight.w700,
                          fontSize: width / 20,
                          color: Colors.white),
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
                          '12',
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
                          '\$ 75',
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
                          "\nIn this course how to create online course websites like Coursera & Skillshare or any other online course website with tutor lms plugin. You will learn how you can create an online course website for FREE. You do not require any coding to build a website. You just need to do Drag & Drop.\n\nAll plugins & theme used for making this website is completely Free. We will use page builders to design and customize our website to make it look more professional.\n\nYou can create unlimited courses. Inside the course, you can add lessons (both video & article) and quizzes. Other instructors can also join your website and make courses in return you can take a commission from them like Udemy.\n This website will be completely user-friendly on both mobile and desktop this will conform to your visitors. The interface of this website will be very smooth and lead to more easily sales of any paid course.",
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
