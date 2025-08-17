import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/question_text.dart';

class Informationscreen extends StatelessWidget {
  final detailCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Informationscreen({super.key});

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
            fontSize: 24,
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
                      fontSize: 23,
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
                    controller: detailCtrl,
                  ),

                  SizedBox(height: 14),
                  QuestionText(
                    label: "Flat Number",
                    hint: "Tower - flat.no",
                    controller: detailCtrl,
                  ),
                  SizedBox(height: 14),
                  QuestionText(
                    label: "phone number",
                    hint: "+91 XXXX XXX XXX",
                    controller: detailCtrl,
                  ),
                  SizedBox(height: 14),
                  QuestionText(
                    label: "Address",
                    hint: "xyz",
                    controller: detailCtrl,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Get.toNamed(Approutes.dashscreen);
                      }
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
