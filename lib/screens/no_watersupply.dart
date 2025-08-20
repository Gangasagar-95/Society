import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/call_button.dart';
import 'package:ss/custom_widget/custom_button.dart';
//import 'package:ss/custom_widget/CustomTextField.dart';
import 'package:ss/custom_widget/dropdown2.dart';
import 'package:ss/custom_widget/icon_button.dart';
import 'package:ss/custom_widget/number.dart';
import 'package:ss/custom_widget/question_text.dart';
import 'package:url_launcher/url_launcher.dart';

class NoWatersupply extends StatefulWidget {
  const NoWatersupply({super.key});

  @override
  State<NoWatersupply> createState() => _NoWatersupplyState();
}

class _NoWatersupplyState extends State<NoWatersupply> {
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
                    "assets/images/no_water_supply.jpg",
                    height: 150,
                    width: 150,
                  ),
                ),
                Center(
                  child: Text(
                    "No Water Supply",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                CustomDropdown(
                  title: 'Location',
                  items: ["Kitchen", "Bathroom", "Sink", "Common tap", "Other"],
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

                const SizedBox(height: 20),
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

                const SizedBox(height: 20),

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
                          "Complaint Submitted",
                          "for no water supply at $selectedLocation",
                          backgroundColor: Color.fromARGB(255, 198, 157, 255),
                        );
                      }
                    }
                    ;
                  },
                ),
                const SizedBox(height: 25),

                Text(
                  "Need help ?",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Appcolor.pcolor,
                  ),
                ),
                const SizedBox(height: 10),

                MyIconButton(
                  label: "Search for plumber",
                  onPressed: () {
                    Get.toNamed(Approutes.callplumber);
                  },
                ),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CallButton(
                      label: "Secretary",
                      onPressed: () => _makeDirectCall(Numbers.rolePhoneNumbers["Secretary"]!),
                    ),
                    const SizedBox(width: 10),
                    CallButton(
                      label: "Municipality",
                      onPressed: () => _makeDirectCall(Numbers.rolePhoneNumbers["Municipality"]!),
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
