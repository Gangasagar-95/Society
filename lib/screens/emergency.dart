import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/number.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactScreen extends StatelessWidget {

  //final Number no = Number();
   EmergencyContactScreen({super.key});

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
      backgroundColor: Appcolor.bgcolor2,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text(
          "Emergency Contacts",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Appcolor.primarycolor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildEmergencyTile(Icons.local_hospital, "Ambulance", "108", Appcolor.primarycolor,() => _makeDirectCall(Numbers.rolePhoneNumbers["Abmulance"]!)),
            _buildEmergencyTile(Icons.local_fire_department, "Fire Brigade", "101", Appcolor.primarycolor,() => _makeDirectCall(Numbers.rolePhoneNumbers["Fire Brigade"]!)),
            _buildEmergencyTile(Icons.local_police, "Police", "100", Appcolor.primarycolor,() => _makeDirectCall(Numbers.rolePhoneNumbers["Police"]!)),
            _buildEmergencyTile(Icons.local_hospital_outlined, "Nearest Hospital", "7942689918",Appcolor.primarycolor,() => _makeDirectCall(Numbers.rolePhoneNumbers["Nearby Hospital"]!)),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyTile(IconData icon, String title, String number, Color color, VoidCallback onpress) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        subtitle: Text(
          number,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        trailing: IconButton(
          icon: 
          IconButton(onPressed: onpress,
          icon: Icon(Icons.call, color: color),
          ),
          onPressed: () {
            // Add call functionality here
          },
        ),
      ),
    );
  }
}