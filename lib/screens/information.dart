import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'package:ss/Color/app_colors.dart';
import 'package:ss/Controller/information_ctrl.dart';
//import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/question_text.dart';
//import 'package:ss/screens/profile_screen.dart';

class Informationscreen extends StatelessWidget {
  
  final _formkey = GlobalKey<FormState>();

  final infoctrl = Get.put(InformationCtrl());

  Informationscreen({super.key});


  void continuee() async {
    if (_formkey.currentState!.validate()) {
      infoctrl.continuee();

      //final prefs = await SharedPreferences.getInstance();
      // await prefs.setString("name", nameCtrl.text.trim());
      // await prefs.setString("flat", flatCtrl.text.trim());
      // await prefs.setString("phone", phoneCtrl.text.trim());
      // await prefs.setString("address", addressCtrl.text.trim());
      // await prefs.setBool("isLoggedIn", true);

      // Get.offNamed(Approutes.tabscreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.bgcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.primarycolor,
        leading: Icon(Icons.arrow_back_ios_new_outlined),

        title: Text(
          "Personal Details",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Appcolor.bgcolor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    "Enter Your Details ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Appcolor.subtitlecolor,
                    ),
                  ),
                  Text(
                    "Please provide your information below",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Appcolor.subtextcolor,
                    ),
                  ),
                  SizedBox(height: 25),
                  QuestionText(
                    label: "Full Name",
                    hint: "Name Surname",
                    controller: infoctrl.nameCtrl,
                    validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
                  ),

                  SizedBox(height: 14),
                  QuestionText(
                    label: "Flat No/House No",
                    hint: "Tower - flat.no",
                    controller: infoctrl.flatCtrl,
                    validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Flat no is required";
                  }
                  return null;
                },
                  ),
                  SizedBox(height: 14),
                  QuestionText(
                    label: "phone number",
                    hint: "+91 XXXX XXX XXX",
                    controller: infoctrl.phoneCtrl,
                    validator:  (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Phone number is required";
                  } else if (value.trim().length < 10) {
                    return "Phone number must be at least 10 digits";
                  }
                  return null;
                },
                  ),
                  SizedBox(height: 14),
                  QuestionText(
                    label: "Address",
                    hint: "xyz",
                    controller: infoctrl.addressCtrl,
                    validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Address is required";
                  }
                  return null;
                },
                  ),

                  ElevatedButton(
                    onPressed: () {
                      continuee(
                        //context
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(350, 50),
                      backgroundColor: Appcolor.primarycolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Appcolor.bgcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

