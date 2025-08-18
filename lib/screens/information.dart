import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ss/Color/app_colors.dart';
import 'package:ss/Controller/information_ctrl.dart';
import 'package:ss/custom_widget/dropdown2.dart';
import 'package:ss/custom_widget/question_text.dart';

class Informationscreen extends StatefulWidget {
  const Informationscreen({super.key});

  @override
  _InformationscreenState createState() => _InformationscreenState();
}

class _InformationscreenState extends State<Informationscreen> {
  String? selectedRole;
  bool showError = false;
  final _formKey = GlobalKey<FormState>();
  final infoctrl = Get.put(InformationCtrl());

  void continuee() {
    if (_formKey.currentState!.validate()) {
      infoctrl.continuee();
      // You can save data here if needed
      // Example:
      // print(infoctrl.nameCtrl.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.bgcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.primarycolor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.pop(context),
        ),
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
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    "Enter Your Details",
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

                  // Full Name
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

                  // Flat No/House No
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

                  // Phone Number
                  QuestionText(
                    label: "Phone Number",
                    hint: "+91 XXXX XXX XXX",
                    controller: infoctrl.phoneCtrl,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Phone number is required";
                      } else if (value.trim().length < 10) {
                        return "Phone number must be at least 10 digits";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 14),

                  // Address
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

                  SizedBox(height: 14),
                  CustomDropdown(
                    title: 'Role',
                    items: ["Recident", "Secratery", "Tenent", "House owner"],
                    hintText: 'Select role',
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value;
                        infoctrl.nameee = selectedRole;
                        showError = false;
                      });
                    },
                  ),
                  showError
                      ? Padding(
                          padding: EdgeInsets.only(top: 8, left: 8),
                          child: Text(
                            "⚠ Please select a role",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        )
                      : SizedBox(),

                  SizedBox(height: 25),

                  ElevatedButton(
                    onPressed: continuee,
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
