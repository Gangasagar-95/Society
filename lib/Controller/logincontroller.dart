import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/modle/login_model.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  Future<void> loginUser() async {
    isLoading.value = true;

    try {
      print("email controller");
      final response = await http.post(
        Uri.parse("https://krushimahostav.yuvapsvs.com/api/auth/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": emailCtrl.text.trim(),
          "password": passwordCtrl.text.trim(),
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final loginData = loginmodel.fromJson(data);

        Get.snackbar(
          "Success",
          "Login successful",
          backgroundColor: Colors.grey,
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', loginData.token ?? "");

        Get.offNamed(Approutes.informationscreen);
      } else {
        final error = jsonDecode(response.body);
        Get.snackbar(
          "Login Failed",
          error['message'] ?? 'Unknown error',
          backgroundColor: Colors.grey,
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
