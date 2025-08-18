import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/call_button.dart';
import 'package:ss/custom_widget/custom_button.dart';
//import 'package:ss/custom_widget/CustomTextField.dart';
import 'package:ss/custom_widget/dropdown2.dart';
import 'package:ss/custom_widget/number.dart';
import 'package:ss/custom_widget/question_text.dart';

import 'package:url_launcher/url_launcher.dart';

class PlusScreen extends StatefulWidget {
  const PlusScreen({super.key});

  @override
  State<PlusScreen> createState() => _OthersProblemState();
}

class _OthersProblemState extends State<PlusScreen> {
  String? selectedIssue;
  bool showError = false;
  final descriptionCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final Number no = Number();

  Future<void> _makeDirectCall(String phoneNumber) async {
    // Request permission
    if (await Permission.phone.request().isGranted) {
      final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
      if (await canLaunchUrl(callUri)) {
        await launchUrl(callUri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint("Could not launch $callUri");
      }
    } else {
      debugPrint("Phone permission not granted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.bgcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.bgcolor,
        //leading: Icon(Icons.arrow_back),
      ),
      body: 
      Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Center(
                  child: Text(
                    "Other Problem",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomDropdown(
                  title: 'Category',
                  items: [
                    "Security issue",
                    "Infrastructure issue",
                    "Maintenance issue",
                    "Community issue",
                    "Other",
                  ],
                  hintText: 'select category',
                  onChanged: (value) {
                    setState(() {
                      selectedIssue = value;
                      showError = false;
                    });
                  },
                ),
                if (showError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "⚠ Please select a category",
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                SizedBox(height: 20),
                QuestionText(
                  label: "Description",
                  hint: "Complaint details",
                  controller: descriptionCtrl,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "description is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: "Submit Complaint",
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      if (selectedIssue == null) {
                        setState(() {
                          showError = true;
                        });
                      } else {
                        Get.snackbar(
                          "Complaint Submitted",
                          "for $selectedIssue",
                          backgroundColor: Color.fromARGB(255, 198, 157, 255),
                        );
                      }
                    }
                    ;
                  },
                ),
                SizedBox(height: 25),
                Text(
                  "Need help ?",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Appcolor.pcolor,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CallButton(
                      label: "Secretary",
                      onPressed: () => _makeDirectCall(no.secratery),
                    ),
                    SizedBox(width: 10),
                    CallButton(
                      label: "Municipality",
                      onPressed: () => _makeDirectCall(no.municipality),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
