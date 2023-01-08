import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techandlearn/Component/Images.dart';

import '../../Component/Colors.dart';
import '../../Controller/CourseDetailController.dart';
import '../../Routes/Routes.dart';

class ClassScheduleScreen extends StatelessWidget {
  ClassScheduleScreen({Key? key}) : super(key: key);
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
              print(courseDetailController.regList.value[0].description);
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
                    "Class Schedule",
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
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "Courses",
                  //       style: GoogleFonts.rajdhani(
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: width / 22,
                  //         color: secondarycolor,
                  //         // Colors.black.withOpacity(0.80)
                  //       ),
                  //     ),
                  //     Spacer(),
                  //     Icon(
                  //       Icons.arrow_drop_down_sharp,
                  //       color: primarycolor,
                  //       size: height / 30,
                  //     ),
                  //   ],
                  // ),
                  Expanded(
                    child: courseDetailController.regList.value.isNotEmpty
                        ? ListView.builder(
                            itemCount:
                                courseDetailController.regList.value.length,
                            itemBuilder: (_, index) => ExpansionTile(
                              title: Text(
                                  courseDetailController.regList[index].name),
                              expandedAlignment: Alignment.centerLeft,
                              childrenPadding: EdgeInsets.only(left: 20.0),
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Days:'),
                                        Spacer(),
                                        Text(
                                          courseDetailController
                                              .regList.value[index].day
                                              .toString()
                                              .replaceAll(',', ' ')
                                              .toUpperCase(),
                                          style: GoogleFonts.rajdhani(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text('Time:'),
                                        Spacer(),
                                        Text(
                                          courseDetailController
                                              .regList[index].time
                                              .toString()
                                              .replaceAll(',', '')
                                              .toUpperCase(),
                                          style: GoogleFonts.rajdhani(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ],
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
