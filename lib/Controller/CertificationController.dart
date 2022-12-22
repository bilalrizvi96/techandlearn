import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:techandlearn/Model/CourseModel.dart';
import 'package:techandlearn/Services/Database.dart';

import '../Model/OptionModel.dart';

class CertificationController extends GetxController {
  RxList<CourseModel> optionList = <CourseModel>[].obs;
  final databaseRef = FirebaseDatabase.instance;
  @override
  void onInit() {
    super.onInit();
    getCertificationCourse();
  } //   OptionModel(`name: 'Course 1', selected: true),

  getCertificationCourse() async {
    optionList.value.clear();
    await databaseRef
        .ref('CertificationCourses')
        .onValue
        .listen((DatabaseEvent event) {
      Map<String, dynamic>.from(event.snapshot.value as dynamic)
          .forEach((key, value) {
        optionList.value.add(CourseModel(
            time: value['time'],
            cost: value['cost'],
            totalstudent: value['totalstd'],
            name: value['c_name'],
            selected: false));
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
