import 'package:get/get.dart';

class LoginController extends GetxController {
  var rememberValue = false;
  valueCheckBox(newValue) {
    rememberValue = newValue!;
    update();
  }
}
