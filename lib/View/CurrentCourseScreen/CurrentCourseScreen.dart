import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techandlearn/Component/Images.dart';

import '../../Component/Colors.dart';
import '../../Controller/CourseDetailController.dart';
import '../../Routes/Routes.dart';

class CurrentCourseScreen extends StatelessWidget {
  CurrentCourseScreen({Key? key}) : super(key: key);
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
                    "Select Courses",
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Courses",
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
                    child: courseDetailController.regList.isNotEmpty
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount:
                                courseDetailController.regList.value.length,
                            itemBuilder: (_, index) => GestureDetector(
                              onTap: () {
                                courseDetailController.getCourseVideo(
                                    courseDetailController
                                        .regList.value[index].name);
                                courseDetailController.courseSelection(index);
                              },
                              onLongPress: () {
                                courseDetailController.dropCourse(
                                    courseDetailController
                                        .regList.value[index].name);
                              },
                              child: Container(
                                height: height / 20,
                                width: width / 20,
                                margin: EdgeInsets.only(
                                    right: width / 30, bottom: height / 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(tileImage),
                                      fit: BoxFit.cover),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height / 50,
                                      horizontal: width / 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        courseDetailController
                                            .regList.value[index].name,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width / 30,
                                          color: Colors.black,
                                          // Colors.black.withOpacity(0.80)
                                        ),
                                      ),
                                      Spacer(),
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
                          )
                        : Center(child: Text("No Course Register")),
                  )
                ],
              );
            }),
      ),
    );
  }
}
