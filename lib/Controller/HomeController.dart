import 'package:get/get.dart';

import '../Model/OptionModel.dart';
import '../Routes/Routes.dart';

class HomeController extends GetxController {
  List<OptionModel> optionList = [
    OptionModel(name: 'Current Course', selected: true),
    OptionModel(name: 'Current Certification Course', selected: false),
    OptionModel(name: 'Self Registration', selected: false),
    OptionModel(name: 'Course Fee Bill', selected: false),
    OptionModel(name: 'Certification Fee Bill', selected: false),
    OptionModel(name: 'Grade History', selected: false),
    OptionModel(name: 'Course Outline', selected: false),
    OptionModel(name: 'Certification Course Outline', selected: false),
    OptionModel(name: 'Class Schedule', selected: false),
    OptionModel(name: 'About Us', selected: false),
  ];
  courseSelection(index) {
    if (index == 0) {
      Get.toNamed(Routes.coursedetail);
    } else if (index == 1) {
      Get.toNamed(Routes.certification);
    } else if (index == 2) {
      Get.toNamed(Routes.registrationcourse);
    }
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
