import 'package:get/get.dart';

import '../Model/OptionModel.dart';
import '../Routes/Routes.dart';

class HomeController extends GetxController {
  List<OptionModel> optionList = [
    OptionModel(name: 'Current Course', selected: true),
    OptionModel(name: 'Current Certification Course', selected: false),
    OptionModel(name: 'Self Registration', selected: false),
    OptionModel(name: 'Class Schedule', selected: false),
    OptionModel(name: 'About Us', selected: false),
  ];

  ///routing here
  courseSelection(index) {
    if (index == 0) {
      Get.toNamed(Routes.coursedetail);
    } else if (index == 1) {
      Get.toNamed(Routes.certification);
    } else if (index == 2) {
      Get.toNamed(Routes.registrationcourse);
    } else if (index == 3) {
      Get.toNamed(Routes.schedue);
    } else if (index == 4) {
      Get.toNamed(Routes.aboutus);
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
