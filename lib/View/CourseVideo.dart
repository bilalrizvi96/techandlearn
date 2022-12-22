import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techandlearn/Routes/Routes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Controller/CourseDetailController.dart';

class CourseVideo extends StatelessWidget {
  CourseVideo({Key? key}) : super(key: key);
  CourseDetailController courseDetailController =
      Get.put(CourseDetailController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                  'Course Video',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 40,
                  ),
                ),
                YoutubePlayer(
                  controller: courseDetailController.videoMetaData!,
                  showVideoProgressIndicator: true,

                  // videoProgressIndicatorColor: Colors.amber,
                  // progressColors: Colors.accents,
                  //   onReady () {
                  // _controller.addListener(listener);
                  // },
                ),
                SizedBox(
                  height: 50,
                ),
                YoutubePlayer(
                  controller: courseDetailController.videoMetaData2!,
                  showVideoProgressIndicator: true,

                  // videoProgressIndicatorColor: Colors.amber,
                  // progressColors: Colors.accents,
                  //   onReady () {
                  // _controller.addListener(listener);
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
