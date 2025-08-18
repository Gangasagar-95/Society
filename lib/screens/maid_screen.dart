import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/call_button.dart';
import 'package:ss/custom_widget/custom_button.dart';
//import 'package:ss/custom_widget/CustomTextField.dart';
import 'package:ss/custom_widget/dropdown2.dart';
import 'package:ss/custom_widget/icon_button.dart';
import 'package:ss/custom_widget/question_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class MaidScreen extends StatefulWidget {
  const MaidScreen({super.key});

  @override
  State<MaidScreen> createState() => _MaidScreenState();
}

class _MaidScreenState extends State<MaidScreen> {
  String? selectedCategory; //  track selected value
  bool showError = false; //  track validation state
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
                  child: Image.asset(
                    "assets/images/maid.jpg",
                    height: 150,
                    width: 150,
                  ),
                ),
                Center(
                  child: Text(
                    "Maid Not coming",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        
                const SizedBox(height: 20),
        
                // ✅ CustomDropdown with validation
                CustomDropdown(
                  title: 'Category',
                  items: [
                    "Cooker",
                    "Sweeper",
                    "Laundary",
                    "Child care",
                    "Utensils",
                    "Other",
                  ],
                  hintText: 'Select category',
                  selectedValue: selectedCategory,
                  showError: showError,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                      showError = false; // clear error once selected
                    });
                  },
                ),
        
                const SizedBox(height: 20),
                QuestionText(
                  label: "Date of absence",
                  hint: "23/08/2025",
                  controller: descriptionCtrl,
                ),
                //CustomTextField(label: "Date of absence", hint: "23/07/2025"),
                //const SizedBox(height: 20),
                QuestionText(
                  label: "Description",
                  hint: "Complaint details",
                  controller: descriptionCtrl,
                ),
                //CustomTextField(label: "Description", hint: "Complaint details"),
                const SizedBox(height: 20),
        
                // ✅ Use your CustomButton
                CustomButton(
                  text: "Submit Complaint",
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      if (selectedCategory == null) {
                        setState(() {
                          showError = true;
                        });
                      } else {
                        // ✅ proceed with complaint submission
                        Get.snackbar(
                          "Complaint Submitted",
                          "for $selectedCategory maid not coming",
                          backgroundColor: const Color.fromARGB(
                            255,
                            198,
                            157,
                            255,
                          ),
                          //colorText: Appcolor.bgcolor
                        );
                      }
                    }
                    ;
                  },
                ),
        
                const SizedBox(height: 30),
        
                Text(
                  "Need help ?",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Appcolor.pcolor,
                  ),
                ),
        
                const SizedBox(height: 10),
                MyIconButton(
                  label: "Search for maid",
                  onPressed: () {
                    Get.toNamed(Approutes.callmaid);
                  },
                ),
                const SizedBox(height: 10),
        
                Row(
                  children: [
                    CallButton(
                      label: "Secretary",
                      onPressed: () => _makeDirectCall("+917822027057"),
                    ),
                    const SizedBox(width: 10),
                    CallButton(
                      label: "Maid",
                      onPressed: () => _makeDirectCall("+917822027057"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
