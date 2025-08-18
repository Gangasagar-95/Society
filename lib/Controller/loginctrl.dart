import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ss/Routes/app_routes.dart';

class LoginCtrl extends GetxController {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

 // String emailll;

  void loginn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);

    Get.offNamed(Approutes.informationscreen);

    var emailll = emailCtrl.value;

    await prefs.setString("email", emailCtrl.text);
    await prefs.setString("pass", passwordCtrl.text);
    // or Approutes.dashboard / Approutes.tabs depending on flow
  }
}
