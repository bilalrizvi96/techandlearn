import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:techandlearn/Model/CourseModel.dart';
import 'package:techandlearn/Services/Database.dart';

import '../Model/OptionModel.dart';

class CertificationController extends GetxController {
  RxList<CourseModel> optionList = <CourseModel>[].obs;
  RxList<CourseModel> regList = <CourseModel>[].obs;
  final user = FirebaseAuth.instance.currentUser;
  final databaseRef = FirebaseDatabase.instance;
  @override
  void onInit() {
    super.onInit();
    getCertificationCourse();
    getregCourse();
  }

  getregCourse() async {
    regList.value.clear();
    print('sherru');
    await databaseRef
        .ref('RegCertificationCourse')
        .onValue
        .listen((DatabaseEvent event) {
      Map<String, dynamic>.from(event.snapshot.value as dynamic)
          .forEach((key, value) async {
        if (user!.uid.toString() == value['uuid']) {
          await databaseRef
              .ref('CertificationCourses')
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
            day: value['days'],
            description: value['description'],
            price: value['price'],
            thumbnail: value['thumbnail'],
            // cost: value['cost'],
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
