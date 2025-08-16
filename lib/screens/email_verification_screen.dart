import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';

class EmailVerification extends StatelessWidget {
  final emailCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void login() {
    if (_formkey.currentState!.validate()) {
      Get.offNamed(Approutes.resetpassword);
    }
  }

  EmailVerification({super.key});

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
          "Email Verification",
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
                  "Get Your Code",
                  style: TextStyle(color: Appcolor.textcolor, fontSize: 24),
                ),

                Text(
                  "Please enter the 4 digit code that",
                  style: TextStyle(color: Appcolor.subtextcolor, fontSize: 20),
                ),
                Text(
                  "sent to your email address",
                  style: TextStyle(color: Appcolor.subtextcolor, fontSize: 20),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If you don’t receive code !",
                      style: TextStyle(
                        color: Appcolor.subtextcolor,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Approutes.resetpassword);
                      },
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          color: Appcolor.primarycolor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
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
                      "Verifiy and Procced",
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
