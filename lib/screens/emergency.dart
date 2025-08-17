import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';

class EmergencyContactScreen extends StatelessWidget {
  const EmergencyContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.bgcolor2,
      appBar: AppBar(
        //backgroundColor: Colors.blue,
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
            _buildEmergencyTile(Icons.local_hospital, "Ambulance", "108", Colors.blue),
            _buildEmergencyTile(Icons.local_fire_department, "Fire Brigade", "101", Colors.red),
            _buildEmergencyTile(Icons.local_police, "Police", "100", Colors.black),
            _buildEmergencyTile(Icons.local_hospital_outlined, "Nearest Hospital", "12345 67890", Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyTile(IconData icon, String title, String number, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          number,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        trailing: IconButton(
          icon: Icon(Icons.call, color: color),
          onPressed: () {
            // Add call functionality here
          },
        ),
      ),
    );
  }
}