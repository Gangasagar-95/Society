import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';

class ForgotPassword extends StatelessWidget {
  final emailCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void login() {
    if (_formkey.currentState!.validate()) {
      Get.offNamed(Approutes.emailverification);
    }
  }

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Forgot Password",
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
                  style: TextStyle(color: Appcolor.subtextcolor, fontSize: 20),
                ),
                Text(
                  "with your account",
                  style: TextStyle(color: Appcolor.subtextcolor, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 25,
                    bottom: 20,
                  ),
                  child: TextFormField(
                    controller: emailCtrl,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
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
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "enter a valid email";
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
  }
}
