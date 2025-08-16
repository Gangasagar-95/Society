import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/contact_card.dart';
import 'package:url_launcher/url_launcher.dart';

class CallPlumber extends StatelessWidget {
  const CallPlumber({super.key});

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Appcolor.bgcolor,
        //leading: Icon(Icons.arrow_back),
        actions: [
          Row(children: [Icon(Icons.person_2_rounded), SizedBox(width: 15)]),
        ],
      ),

      body: 
      
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: 
        
        SingleChildScrollView(
          child: Column(
            children: [
              ContactCard(
                name: "Sunil Rathod",
                role: "Plumber",
                availableTime: "9am to 9pm",
                address: "nanded",
                onCallTap: () => _makeDirectCall("+917822027057"),
              ),
              SizedBox(height: 10),
              ContactCard(
                name: "Gokul Devke",
                role: "Plumber",
                availableTime: "12pm to 10pm",
                address: "nanded",
                onCallTap: () => _makeDirectCall("+917822027057"),
              ),
              SizedBox(height: 10),
              ContactCard(
                name: "Vijay Tiwari",
                role: "Plumber",
                availableTime: "11am to 4pm",
                address: "nanded",
                onCallTap: () => _makeDirectCall("+917822027057"),
              ),
              SizedBox(height: 10),
              ContactCard(
                name: "Swapnil Rathi",
                role: "Plumber",
                availableTime: "9am to 10pm",
                address: "nanded",
                onCallTap: () => _makeDirectCall("+917822027057"),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
