import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/contact_card.dart';
//import 'package:ss/custom_widget/number.dart';
import 'package:url_launcher/url_launcher.dart';

class CallCarpenter extends StatefulWidget {
  //final Number no = Number();
 CallCarpenter({super.key});

  @override
  State<CallCarpenter> createState() => _CallCarpenterState();
}

class _CallCarpenterState extends State<CallCarpenter> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final List<Map<String, String>> _carpenters = [
    {
      "name": "Niraj Gothe",
      "role": "Carpenter",
      "availableTime": "9am to 9pm",
      "address": "Nanded",
      "phone": "07304713934",
    },
    {
      "name": "Shiv Patre",
      "role": "Carpenter",
      "availableTime": "12pm to 10pm",
      "address": "Nanded",
      "phone": "07304713934",
    },
    {
      "name": "Ajay Rathi",
      "role": "Carpenter",
      "availableTime": "11am to 4pm",
      "address": "Nanded",
      "phone": "07304713934",
    },
    {
      "name": "Suraj Tambare",
      "role": "Carpenter",
      "availableTime": "9am to 10pm",
      "address": "Nanded",
      "phone": "07304713934",
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
    // filter list based on search
    final List<Map<String, String>> filteredCarpenters = _carpenters.where((c) {
      final query = _searchQuery.toLowerCase();
      return c["name"]!.toLowerCase().contains(query) ||
          c["role"]!.toLowerCase().contains(query) ||
          c["address"]!.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Appcolor.bgcolor,
        title: Text(
          "Carpenter",
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

            // 📋 Carpenter list
            Expanded(
              child: filteredCarpenters.isEmpty
                  ? const Center(child: Text("No carpenter found"))
                  : ListView.builder(
                      itemCount: filteredCarpenters.length,
                      itemBuilder: (context, index) {
                        final carpenter = filteredCarpenters[index];
                        return Column(
                          children: [
                            ContactCard(
                              name: carpenter["name"]!,
                              role: carpenter["role"]!,
                              availableTime: carpenter["availableTime"]!,
                              address: carpenter["address"]!,
                              onCallTap: () =>
                                  _makeDirectCall(carpenter["phone"]!),
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
