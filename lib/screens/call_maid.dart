import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/contact_card.dart';
import 'package:url_launcher/url_launcher.dart';

class CallMaid extends StatelessWidget {
  const CallMaid({super.key});

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
        leading: Icon(Icons.arrow_back),
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
                name: "Sunita Sathe",
                role: "Cook",
                availableTime: "9am to 4pm",
                address: "nanded",
                onCallTap: () => _makeDirectCall("+917822027057"),
              ),
              SizedBox(height: 10),
              ContactCard(
                name: "Rupali Joshi",
                role: "Utensils",
                availableTime: "8am to 1pm",
                address: "nanded",
                onCallTap: () => _makeDirectCall("+917822027057"),
              ),
              SizedBox(height: 10),
              ContactCard(
                name: "Swati Dahale",
                role: "Sweeper",
                availableTime: "11am to 4pm",
                address: "nanded",
                onCallTap: () => _makeDirectCall("+917822027057"),
              ),
              SizedBox(height: 10),
              ContactCard(
                name: "Vaishali Rampatwar",
                role: "Cooker",
                availableTime: "9am to 8pm",
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
