import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/call_button.dart';
//import 'package:ss/custom_widget/call_container.dart';
import 'package:ss/custom_widget/custom_button.dart';
//import 'package:ss/custom_widget/drop_down.dart';
import 'package:ss/custom_widget/CustomTextField.dart';
import 'package:ss/custom_widget/dropdown2.dart';
import 'package:ss/custom_widget/icon_button.dart';
//import 'package:ss/custom_widget/dropdown2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class MaidScreen extends StatelessWidget {
  const MaidScreen({super.key});

  //  final String phoneNumber = "+917822027057"; // Your number

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
                  "assets/images/maid.jpg",
                  height: 150,
                  width: 150,
                ),
              ),
              Center(
                child: Text(
                  "Maid Not coming",
                  style: GoogleFonts.josefinSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 20),
              CustomDropdown(
                title: 'Category',
                items: ["Cooker", "Sweeper", "Laundary", "Child care", "Other"],
                hintText: 'select category',
              ),
              //CategoryDropdownField(),
              SizedBox(height: 20),
              CustomTextField(label: "Date of absence", hint: "23/07/2025"),
              SizedBox(height: 20),
              CustomTextField(label: "Description", hint: "Complaint details"),
              SizedBox(height: 20),
              CustomButton(text: "Submit Complaint", onPressed: () {}),
              SizedBox(height: 30),

              Text(
                "Need help ?",
                textAlign: TextAlign.left,
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Appcolor.pcolor,
                ),
              ),

              SizedBox(height: 10),
              MyIconButton(label: "Search for maid", onPressed: (){}),
              SizedBox(height: 10,),

              Row(
                children: [
                  CallButton(label: "Secretary", onPressed: () => _makeDirectCall("+917822027057"),),
                  SizedBox(width: 10,),
                  CallButton(label: "Maid", onPressed: () => _makeDirectCall("+917822027057"),),  
                ],
              ),
              SizedBox(height: 20,)


              //ContactCard(
              //   name: "Sunita sathe",
              //   role: "Sweeper",
              //   availableTime: "8 AM to 8 PM",
              //   towers: "A,B,C",
              //   onCallTap: () => _makeDirectCall("+917822027057"),
              // ),
              // ContactCard(
              //   name: "Kavita Kale",
              //   role: "Cooker",
              //   availableTime: "8 AM to 8 PM",
              //   towers: "A,B,C",
              //   onCallTap: () => _makeDirectCall("+919860801358"),
              // ),
              // ContactCard(
              //   name: "Nita Kamble",
              //   role: "Sectatery",
              //   availableTime: "8 AM to 8 PM",
              //   towers: "A,B,C",
              //   onCallTap: () => _makeDirectCall("+918888131220"),


              // ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
