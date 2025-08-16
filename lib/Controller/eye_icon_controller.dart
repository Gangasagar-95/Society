import 'package:get/get.dart';

class EyeIconController extends GetxController {
  RxBool eye = true.obs;

  void eyeicon() {
    eye != eye;
    if (eye.value == true) {
      eye.value = false;
    } else {
      eye.value = true;
    }
  }
}
