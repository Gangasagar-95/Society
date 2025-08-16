import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ss/Color/app_colors.dart';
import 'package:ss/Controller/eye_icon_controller.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/logo_containers.dart';

class CreateAccount extends StatelessWidget {
  final eyeIconcontrollerobj = Get.put(EyeIconController());
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void login() {
    if (_formkey.currentState!.validate()) {
      Get.offNamed(Approutes.splashscreen);
    }
  }

  CreateAccount({super.key});

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
            icon: Icon(Icons.arrow_back, color: Appcolor.primarycolor),
          ),
        ),

        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/newapplogo.png",
                        height: 300,
                        width: 300,
                      ),
                      Text(
                        "Create your Account",
                        style: TextStyle(
                          color: Appcolor.textcolor,
                          fontSize: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                          bottom: 20,
                        ),
                        child: TextFormField(
                          controller: emailCtrl,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.email,
                              size: 20,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Appcolor.primarycolor,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "email can not be null";
                            }
                            if (!RegExp(
                              r'^[^@]+@[^@]+\.[^@]+',
                            ).hasMatch(value)) {
                              return "enter a valid email";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
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
                          padding: const EdgeInsets.only(left: 120, right: 120),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Appcolor.textcolor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "-Or sign in with-",
                        style: TextStyle(
                          fontSize: 16,
                          color: Appcolor.subtextcolor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LogoContainers(
                              assetimage: "assets/images/google_logo.png",
                            ),
                            SizedBox(width: 20),
                            LogoContainers(
                              assetimage: "assets/images/facebook_logo.png",
                            ),
                            SizedBox(width: 20),
                            LogoContainers(
                              assetimage:
                                  "assets/images/Twitter_logo-removebg-preview.png",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
