

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/call_button.dart';
import 'package:ss/custom_widget/custom_button.dart';
import 'package:ss/custom_widget/CustomTextField.dart';
import 'package:ss/custom_widget/dropdown2.dart';
import 'package:ss/custom_widget/icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Streetlight extends StatefulWidget {
  Streetlight({super.key});

  @override
  State<Streetlight> createState() => _StreetlightState();
}

class _StreetlightState extends State<Streetlight> {
  String? selectedLocation;
  bool showError = false;

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
      appBar: AppBar(
        backgroundColor: Appcolor.bgcolor,
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/lamp_light.jpg",
                  height: 150,
                  width: 150,
                ),
              ),
              Center(
                child: Text(
                  "Street light Not Working",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Dropdown
              CustomDropdown(
                title: 'Location',
                items: ["Main gate", "Parking", "Garden", "Floor", "Other"],
                hintText: 'Select location',
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value;
                    showError = false;
                  });
                },
              ),
              showError
                  ? Padding(
                      padding: EdgeInsets.only(top: 8, left: 8),
                      child: Text(
                        "⚠ Please select a location",
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    )
                  : SizedBox(),

              SizedBox(height: 20),
              CustomTextField(label: "Description", hint: "Complaint details"),
              SizedBox(height: 20),

              // Submit button
              CustomButton(
                text: "Submit Complaint",
                onPressed: () {
                  if (selectedLocation == null) {
                    setState(() {
                      showError = true;
                    });
                  } else {
                    Get.snackbar(
                      "Complaint Submitted",
                      "for Streetlight not working at $selectedLocation",
                      backgroundColor: Color.fromARGB(255, 198, 157, 255),
                    );
                  }
                },
              ),
              SizedBox(height: 25),

              Text(
                "Need help ?",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Appcolor.pcolor,
                ),
              ),
              SizedBox(height: 10),

              MyIconButton(
                label: "Search for electrician",
                onPressed: () {
                  Get.toNamed(Approutes.callrepair);
                },
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
                    label: "Municipality",
                    onPressed: () => _makeDirectCall("02462234405"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
