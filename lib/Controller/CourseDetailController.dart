import 'package:get/get.dart';

import '../Model/OptionModel.dart';

class CourseDetailController extends GetxController {
  List<OptionModel> optionList = [
    OptionModel(name: 'Course 1', selected: true),
    OptionModel(name: 'Course 2', selected: false),
    OptionModel(name: 'Course 3', selected: false),
    OptionModel(name: 'Course 4', selected: false),
    OptionModel(name: 'Course 5', selected: false),
    OptionModel(name: 'Course 6', selected: false),
    OptionModel(name: 'Course 7', selected: false),
  ];
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
