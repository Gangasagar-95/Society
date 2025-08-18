import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/call_button.dart';
import 'package:ss/custom_widget/custom_button.dart';
//import 'package:ss/custom_widget/CustomTextField.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ss/custom_widget/dropdown2.dart';
import 'package:ss/custom_widget/number.dart';
import 'package:ss/custom_widget/question_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Garbage extends StatefulWidget {
  const Garbage({super.key});

  @override
  State<Garbage> createState() => _GarbageState();
}

class _GarbageState extends State<Garbage> {
  String? selectedLocation;
  bool showError = false;
  final descriptionCtrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  //final Number no = Number();

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
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/Garbage_problem.jpg",
                    height: 150,
                    width: 150,
                  ),
                ),
                Center(
                  child: Text(
                    "Garbage Not Picked",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                CustomDropdown(
                  title: 'Location',
                  items: ["Society", "Parking", "Garden", "Floor", "Other"],
                  hintText: 'select location',
                  onChanged: (value) {
                    setState(() {
                      selectedLocation = value;
                      showError = false;
                    });
                  },
                ),
                if (showError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "⚠ Please select a location",
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

                //CustomTextField(label: "Description", hint: "Complaint details"),
                SizedBox(height: 20),

                CustomButton(
                  text: "Submit Complaint",
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      if (selectedLocation == null) {
                        setState(() {
                          showError = true;
                        });
                      } else {
                        Get.snackbar(
                          "Complain Submitted",
                          "for garbage not picked up at $selectedLocation",
                          backgroundColor: const Color.fromARGB(
                            255,
                            189,
                            142,
                            255,
                          ),
                        );
                      }
                    }
                    ;
                  },
                ),
                SizedBox(height: 25),

                Text(
                  "Need help ?",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Appcolor.pcolor,
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    CallButton(
                      label: "Secretary",
                      onPressed: () => _makeDirectCall(Numbers.rolePhoneNumbers["Secretary"]!),
                    ),
                    SizedBox(width: 10),
                    CallButton(
                      label: "Municipality",
                      onPressed: () => _makeDirectCall(Numbers.rolePhoneNumbers["Municipality"]!),
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
