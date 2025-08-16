import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/Controller/eye_icon_controller.dart';
import 'package:ss/Routes/app_routes.dart';

class ResetPassword extends StatelessWidget {
  final eyeIconcontrollerobj = Get.put(EyeIconController());
  final passwordCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void login() {
    if (_formkey.currentState!.validate()) {
      Get.offNamed(Approutes.createaccount);
    }
  }

  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Appcolor.bgcolor,
        appBar: AppBar(
          backgroundColor: Appcolor.bgcolor,
          leading: IconButton(
            onPressed: () {
              Get.toNamed(Approutes.loginscreen);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Appcolor.primarycolor),
          ),
          title: Text(
            "Reset Password",
            style: TextStyle(color: Appcolor.textcolor, fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/newapplogo.png",
                    height: 300,
                    width: 300,
                  ),
                  Text(
                    "Mail Address Here",
                    style: TextStyle(color: Appcolor.textcolor, fontSize: 24),
                  ),

                  Text(
                    "Enter the email address associate",
                    style: TextStyle(
                      color: Appcolor.subtextcolor,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "with your account",
                    style: TextStyle(
                      color: Appcolor.subtextcolor,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                      top: 25,
                    ),
                    child: TextFormField(
                      controller: passwordCtrl,
                      obscureText: eyeIconcontrollerobj.eye.value,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Appcolor.primarycolor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),

                        suffixIcon: IconButton(
                          icon: Icon(
                            eyeIconcontrollerobj.eye == false
                                ? Icons.remove_red_eye
                                : Icons.visibility_off,
                            size: 20,

                            color: eyeIconcontrollerobj.eye == false
                                ? Colors.red
                                : Appcolor.primarycolor,
                          ),
                          onPressed: () {
                            eyeIconcontrollerobj.eyeicon();
                          },
                        ),
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "password is required and can not be null";
                        }
                        if (value.length < 7) {
                          return "Password must be atleast 7 character";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 30,
                    ),
                    child: TextFormField(
                      controller: passwordCtrl,
                      obscureText: eyeIconcontrollerobj.eye.value,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Appcolor.primarycolor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),

                        suffixIcon: IconButton(
                          icon: Icon(
                            eyeIconcontrollerobj.eye == false
                                ? Icons.remove_red_eye
                                : Icons.visibility_off,
                            size: 20,

                            color: eyeIconcontrollerobj.eye == false
                                ? Colors.red
                                : Appcolor.primarycolor,
                          ),
                          onPressed: () {
                            eyeIconcontrollerobj.eyeicon();
                          },
                        ),
                        hintText: "Confirm password",
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "password is required and can not be null";
                        }
                        if (value.length < 7) {
                          return "Password must be atleast 7 character";
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolor.buttoncolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70, right: 70),
                      child: Text(
                        "Recover Password",
                        style: TextStyle(
                          color: Appcolor.textcolor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
