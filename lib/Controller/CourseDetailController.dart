import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:techandlearn/Model/CourseModel.dart';
import 'package:techandlearn/Services/BaseUrl.dart';
import 'package:techandlearn/Services/Database.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Model/OptionModel.dart';
import '../Routes/Routes.dart';

class CourseDetailController extends GetxController {
  RxList<CourseModel> optionList = <CourseModel>[].obs;
  RxList<CourseModel> regList = <CourseModel>[].obs;
  final databaseRef = FirebaseDatabase.instance;
  YoutubePlayerController? videoMetaData;
  YoutubePlayerController? videoMetaData2;
  final user = FirebaseAuth.instance.currentUser;
  @override
  void onInit() {
    super.onInit();
    getregCourse();
    getCourse();

    videoMetaData = YoutubePlayerController(
      initialVideoId: 'm17XxsjRiqk',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    // videoMetaData2 = YoutubePlayerController(
    //   initialVideoId: 'zrsqhcVpaE0',
    //   flags: YoutubePlayerFlags(
    //     autoPlay: false,
    //     mute: true,
    //   ),
    // );
  } //   OptionModel(`name: 'Course 1', selected: true),

  getCourseVideo(name) async {
    await databaseRef.ref('RegCourse').onValue.listen((DatabaseEvent event) {
      Map<String, dynamic>.from(event.snapshot.value as dynamic)
          .forEach((key, value) async {
        if (user!.uid.toString() == value['uuid']) {
          await databaseRef
              .ref('Courses')
              .onValue
              .listen((DatabaseEvent event) {
            Map<String, dynamic>.from(event.snapshot.value as dynamic)
                .forEach((key, value1) {
              if (name == value1['c_name']) {
                print(value['video']);
                videoMetaData = YoutubePlayerController(
                  initialVideoId: value1['video'],
                  flags: YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ),
                );
                update();
              }
            });
          });
        }

        update();
      });
    });
    Get.toNamed(Routes.coursevideo);
    update();
  }

  dropCourse(name) {
    DatabaseReference ref = FirebaseDatabase.instance.ref("RegCourse");
    ref.orderByChild('c_name').equalTo(name).onValue.listen((event) {
      Map<String, dynamic>.from(event.snapshot.value as dynamic)
          .forEach((key, value) async {
        print('dawar');
        await ref.child(key).remove();
        update();
      });
    });
  }

  getregCourse() async {
    regList.clear();
    await databaseRef.ref('RegCourse').onValue.listen((DatabaseEvent event) {
      Map<String, dynamic>.from(event.snapshot.value as dynamic)
          .forEach((key, value) async {
        if (user!.uid.toString() == value['uuid']) {
          await databaseRef
              .ref('Courses')
              .onValue
              .listen((DatabaseEvent event) {
            Map<String, dynamic>.from(event.snapshot.value as dynamic)
                .forEach((key, value1) {
              if (value['c_name'] == value1['c_name']) {
                regList.value.add(CourseModel(
                    time: value1['time'],
                    day: value1['days'],
                    description: value1['description'],
                    price: value1['price'],
                    thumbnail: value1['thumbnail'],
                    // cost: value['cost'],
                    totalstudent: value1['totalstd'],
                    name: value1['c_name'],
                    selected: false));
                update();
              }
            });
          });
        }

        update();
      });
    });
    update();
  }

  getCourse() async {
    print('haris');
    print(BaseUrl.storage.read('semester'));
    // optionList.value.clear();
    await databaseRef.ref('Courses').onValue.listen((DatabaseEvent event) {
      Map<String, dynamic>.from(event.snapshot.value as dynamic)
          .forEach((key, value) {
        if (value['semester'] == BaseUrl.storage.read('semester')) {
          print(BaseUrl.storage.read('semester'));
          print(value['semester']);
          optionList.value.add(CourseModel(
              time: value['time'],
              day: value['days'],
              description: value['description'],
              price: value['price'],
              thumbnail: value['thumbnail'],
              // cost: value['cost'],
              totalstudent: value['totalstd'],
              name: value['c_name'],
              selected: false));
        }

        print(optionList.value);
        update();
      });
    });
    update();
  }

  courseSelection(index) {
    for (int i = 0; i < optionList.length; i++) {
      if (i == index) {
        if (optionList[i].selected == true) {
          // weeklist.value[i].selected = false;

        } else {
          optionList[i].selected = true;
          // weekupdate.value = i;
        }
      } else {
        optionList[i].selected = false;
      }
    }
    update();
  }
}
