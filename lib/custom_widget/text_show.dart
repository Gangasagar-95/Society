import 'package:flutter/material.dart';
//import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';

class TextShow extends StatelessWidget {
  //final TextEditingController controller;
  final String label;
  final String text;

  TextShow({super.key, required this.text, required this.label});

  @override
  Widget build(BuildContext context) {
    SizedBox(width: 10);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 18)),
        Container(
          height: 50,
          width: double.infinity,

          decoration: BoxDecoration(
            border: Border.all(color: Appcolor.primarycolor, width: 1.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: 
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: Text(
              text.isNotEmpty ? text : "Not set",
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,color: Appcolor.subtitlecolor,)
            ),
          ),
        ),
      ],
    );
  }
}
