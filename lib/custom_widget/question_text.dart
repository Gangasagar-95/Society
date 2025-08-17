import 'package:flutter/material.dart';
//import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';

class QuestionText extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  // final bool isDropdown;
  // final Widget? suffixIcon;

  QuestionText({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    // this.isDropdown = false,
    // this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    SizedBox(width: 10);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.poppins(fontSize: 18)),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                color: Appcolor.subtextcolor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Appcolor.primarycolor),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Appcolor.primarycolor),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "This field is required";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
