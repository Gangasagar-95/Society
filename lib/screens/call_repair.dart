import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/contact_card.dart';
import 'package:url_launcher/url_launcher.dart';

class CallRepair extends StatefulWidget {
  const CallRepair({super.key});

  @override
  State<CallRepair> createState() => _CallRepairState();
}

class _CallRepairState extends State<CallRepair> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final List<Map<String, String>> _painters = [
    {
      "name": "Ram Thoke",
      "role": "Electrician",
      "availableTime": "9am to 9pm",
      "address": "Nanded",
      "phone": "07041943994",
    },
    {
      "name": "Prashant Sakhre",
      "role": "Electrician",
      "availableTime": "12pm to 10pm",
      "address": "Nanded",
      "phone": "07041943994",
    },
    {
      "name": "Vivek Kale",
      "role": "Electrician",
      "availableTime": "11am to 4pm",
      "address": "Nanded",
      "phone": "07041943994",
    },
    {
      "name": "Swami Gore",
      "role": "Electrician",
      "availableTime": "9am to 10pm",
      "address": "Nanded",
      "phone": "07041943994",
    },
  ];

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
    // filter painters by search query
    final filteredPainters = _painters.where((p) {
      final query = _searchQuery.toLowerCase();
      return p["name"]!.toLowerCase().contains(query) ||
          p["role"]!.toLowerCase().contains(query) ||
          p["address"]!.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Appcolor.bgcolor,
        title: Text(
          "Appliance Repair",
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Appcolor.primarycolor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search ",
                prefixIcon: Icon(Icons.search, color: Appcolor.primarycolor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Appcolor.primarycolor),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Appcolor.primarycolor),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // 📋 List of Painters
            Expanded(
              child: filteredPainters.isEmpty
                  ? const Center(child: Text("No painter found"))
                  : ListView.builder(
                      itemCount: filteredPainters.length,
                      itemBuilder: (context, index) {
                        final painter = filteredPainters[index];
                        return Column(
                          children: [
                            ContactCard(
                              name: painter["name"]!,
                              role: painter["role"]!,
                              availableTime: painter["availableTime"]!,
                              address: painter["address"]!,
                              onCallTap: () =>
                                  _makeDirectCall(painter["phone"]!),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
