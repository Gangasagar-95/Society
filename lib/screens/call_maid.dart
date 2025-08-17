import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/contact_card.dart';
import 'package:url_launcher/url_launcher.dart';

class CallMaid extends StatefulWidget {
  const CallMaid({super.key});

  @override
  State<CallMaid> createState() => _CallMaidState();
}

class _CallMaidState extends State<CallMaid> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final List<Map<String, String>> _maids = [
    {
      "name": "Sunita Sathe",
      "role": "Cook",
      "availableTime": "9am to 4pm",
      "address": "Nanded",
      "phone": "+917822027057",
    },
    {
      "name": "Rupali Joshi",
      "role": "Utensils",
      "availableTime": "8am to 1pm",
      "address": "Nanded",
      "phone": "+917822027057",
    },
    {
      "name": "Swati Dahale",
      "role": "Sweeper",
      "availableTime": "11am to 4pm",
      "address": "Nanded",
      "phone": "+917822027057",
    },
    {
      "name": "Vaishali\nRampatwar",
      "role": "Cooker",
      "availableTime": "9am to 8pm",
      "address": "Nanded",
      "phone": "+917822027057",
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
    // Filtered list
    final List<Map<String, String>> filteredMaids = _maids.where((maid) {
      final query = _searchQuery.toLowerCase();
      return maid["name"]!.toLowerCase().contains(query) ||
          maid["role"]!.toLowerCase().contains(query) ||
          maid["address"]!.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Appcolor.bgcolor,
        title: Text(
          "Maid",
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
            ), //search

            SizedBox(height: 20),

            // 📋 List
            Expanded(
              child: filteredMaids.isEmpty
                  ? Center(child: Text("No maids found"))
                  : ListView.builder(
                      itemCount: filteredMaids.length,
                      itemBuilder: (context, index) {
                        final maid = filteredMaids[index];
                        return Column(
                          children: [
                            ContactCard(
                              name: maid["name"]!,
                              role: maid["role"]!,
                              availableTime: maid["availableTime"]!,
                              address: maid["address"]!,
                              onCallTap: () => _makeDirectCall(maid["phone"]!),
                            ),
                            SizedBox(height: 10),
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
