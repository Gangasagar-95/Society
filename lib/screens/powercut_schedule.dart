import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';

class Powercut extends StatelessWidget {
  const Powercut({super.key});

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
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(30),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
