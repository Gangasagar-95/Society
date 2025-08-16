import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/call_button.dart';
//import 'package:ss/custom_widget/icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Powercut extends StatelessWidget {
  const Powercut({super.key});

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
                  "assets/images/power_cut.jpg",
                  height: 150,
                  width: 150,
                ),
              ),
              Center(
                child: Text(
                  "Power Cut Schedule",
                  style: GoogleFonts.josefinSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          
              SizedBox(height: 35),
          
              Text(
                "Scheduled Date:",
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  color: Appcolor.bcolor,
                ),
              ),
              Text(
                "Augyst 4,2025",
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  color: Appcolor.subtitlecolor,
                ),
              ),
          
              SizedBox(height: 35),
          
              Text(
                "Time:",
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  color: Appcolor.bcolor,
                ),
              ),
          
              Text(
                "9:00 AM - 11:30",
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  color: Appcolor.subtitlecolor,
                ),
              ),
          
              SizedBox(height: 35),
          
              Text(
                "Affected Area:",
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  color: Appcolor.bcolor,
                ),
              ),
          
              Text(
                "Location",
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  color: Appcolor.subtitlecolor,
                ),
              ),
          
              SizedBox(height: 35),
          
              Text(
                "Impact:",
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  color: Appcolor.bcolor,
                ),
              ),
          
              Text(
                "Electrician Supply Will Interrupted",
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  color: Appcolor.subtitlecolor,
                ),
              ),

              SizedBox(height: 30,),
          
              Text(
              "Need help ?",
              textAlign: TextAlign.left,
              style: GoogleFonts.josefinSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Appcolor.pcolor,
              ),
            ),
          
            // SizedBox(height: 10),
            // MyIconButton(label: "Search for electrician", onPressed: (){}),
            SizedBox(height: 10,),
          
            Row(
              children: [
                CallButton(label: "Secretary", onPressed: () => _makeDirectCall("+917822027057"),),
                SizedBox(width: 10,),
                CallButton(label: "Municipality", onPressed: () => _makeDirectCall("02462234405"),),  
              ],
            ),
            SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
