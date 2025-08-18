import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ss/Color/app_colors.dart';
//import 'package:ss/custom_widget/CustomTextField.dart';
import 'package:ss/custom_widget/call_button.dart';
import 'package:ss/custom_widget/custom_button.dart';
import 'package:ss/custom_widget/dropdown2.dart';
import 'package:ss/custom_widget/question_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Tenantissue extends StatefulWidget {
  Tenantissue({super.key});

  @override
  State<Tenantissue> createState() => _TenantissueState();
}

class _TenantissueState extends State<Tenantissue> {
  String? selectedIssue;
  bool showError = false;
  final descriptionCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future<void> _makeDirectCall(String phoneNumber) async {
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
      appBar: AppBar(backgroundColor: Appcolor.bgcolor),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.all(25),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/tenant_issues.jpg",
                    height: 150,
                    width: 150,
                  ),
                ),
                Center(
                  child: Text(
                    "Tenant Issue",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Dropdown
                CustomDropdown(
                  title: 'Issue',
                  items: [
                    "unauthorized tenant",
                    "not following rules",
                    "noise or disturbance",
                    "Cleanliness issue",
                    "Other",
                  ],
                  hintText: 'select issue',
                  onChanged: (value) {
                    setState(() {
                      selectedIssue = value;
                      showError = false;
                    });
                  },
                ),
                showError
                    ? Padding(
                        padding: EdgeInsets.only(top: 8, left: 8),
                        child: Text(
                          "⚠ Please select an issue",
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      )
                    : SizedBox(),

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

                // CustomTextField(label: "Description", hint: "Complaint details"),
                SizedBox(height: 20),

                // Submit Button
                CustomButton(
                  text: "Submit Complaint",
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      if (selectedIssue == null &&
                          _formkey.currentState!.validate()) {
                        setState(() {
                          showError = true;
                        });
                      } else {
                        Get.snackbar(
                          "Complaint Submitted",
                          "of tenant for $selectedIssue",
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
                      onPressed: () => _makeDirectCall("+917822027057"),
                    ),
                    SizedBox(width: 10),
                    CallButton(
                      label: "house owner",
                      onPressed: () => _makeDirectCall("02462234405"),
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
