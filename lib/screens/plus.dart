import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:ss/Color/app_colors.dart';

import 'package:ss/custom_widget/call_button.dart';

import 'package:ss/custom_widget/custom_button.dart';
import 'package:ss/custom_widget/CustomTextField.dart';
import 'package:ss/custom_widget/dropdown2.dart';
import 'package:ss/screens/tabs.dart';

import 'package:url_launcher/url_launcher.dart';

class PlusScreen extends StatelessWidget {
  const PlusScreen({super.key});
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
        leading: IconButton(
          onPressed: () {
            tabsKey.currentState?.onItemTapped(0);
            
            //Get.toNamed(Approutes.dashscreen);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Make a complain",
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
              ),
              SizedBox(height: 20),
              CustomTextField(label: "Description", hint: "Complaint details"),
              SizedBox(height: 20),
              CustomButton(text: "Submit Complaint", onPressed: () {}),
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

              // SizedBox(height: 10),
              // MyIconButton(label: "Search for electrician", onPressed: (){}),
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
