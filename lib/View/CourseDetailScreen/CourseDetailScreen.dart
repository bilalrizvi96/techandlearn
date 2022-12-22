import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/Colors.dart';
import '../../Controller/CourseDetailController.dart';
import '../../Routes/Routes.dart';

class CourseDetailScreen extends StatelessWidget {
  CourseDetailScreen({Key? key}) : super(key: key);

  CourseDetailController courseDetailController =
      Get.put(CourseDetailController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GetBuilder(
            init: courseDetailController,
            builder: (_) {
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
                  Text(
                    'Current Course',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount:
                            courseDetailController.optionList.value.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.coursevideo);
                                courseDetailController.courseSelection(index);
                              },
                              child: Container(
                                width: width,
                                height: height / 15,
                                decoration: BoxDecoration(
                                    color: primarycolor.withOpacity(0.34),
                                    border: Border.all(
                                        color: courseDetailController
                                                    .optionList[index]
                                                    .selected ==
                                                true
                                            ? secondarycolor
                                            : Colors.transparent,
                                        width: 3),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Center(
                                  child: Text(
                                    courseDetailController
                                        .optionList.value[index].name,
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
