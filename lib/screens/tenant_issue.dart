import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';


import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/CustomTextField.dart';
import 'package:ss/custom_widget/call_container.dart';
import 'package:ss/custom_widget/custom_button.dart';
import 'package:ss/custom_widget/dropdown2.dart';
import 'package:url_launcher/url_launcher.dart';

class Tenantissue extends StatelessWidget {
  const Tenantissue({super.key});
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
        leading: Icon(Icons.menu),
        actions: [
          Row(children: [Icon(Icons.person_2_rounded), SizedBox(width: 15)]),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
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
                  style: GoogleFonts.josefinSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 20),

              CustomDropdown(title: 'Issue', items: ["unauthorized tenant", "not following rules", "noise or disturbance", "Cleanliness issue","Other"],hintText: 'select location',),
              SizedBox(height: 20),
              CustomTextField(label: "Description", hint: "Complaint details"),
              SizedBox(height: 20),
              CustomButton(text: "Submit Complaint", onPressed:() {},),
              SizedBox(height: 25),

              Text(
                "Call Secretory ?",
                textAlign: TextAlign.left,
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Appcolor.pcolor,
                ),
              ),

              SizedBox(height: 1),

              ContactCard(
                name: "Rajesh Tiwari",
                role: "Secretory",
                availableTime: "25/10/4557",
                towers: "A,B,C",
                onCallTap: () => _makeDirectCall("+917822027057"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}