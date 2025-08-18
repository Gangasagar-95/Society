import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/number.dart';

class InformationCtrl extends GetxController {
  var nameee;

  final nameCtrl = TextEditingController();
  final flatCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final roleCtrl = TextEditingController();

  void setRole(String role) {
    roleCtrl.text = role;

    if (role == "Secretary") {
      // 🔥 Use user-entered phone instead of default
      //if (phoneCtrl.text.isNotEmpty) {
        Numbers.rolePhoneNumbers["Secretary"] = phoneCtrl.text;
      //}
    } 
    else {
      // For other roles → use static number
      phoneCtrl.text = Numbers.rolePhoneNumbers[role] ?? "";
    }
  }


  Future<void> continuee() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);

    Get.offNamed(Approutes.tabscreen);

    nameee = roleCtrl.text;

    await prefs.setString("name", nameCtrl.text.trim());
    await prefs.setString("flat", flatCtrl.text.trim());
    await prefs.setString("phone", phoneCtrl.text.trim());
    await prefs.setString("address", addressCtrl.text.trim());
    await prefs.setString("role", roleCtrl.text.trim());
  }

}
