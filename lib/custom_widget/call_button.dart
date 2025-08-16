import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';

class CallButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  
  const CallButton({
    Key? key,
    required this.label,
    required this.onPressed,
 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(160, 50),
        backgroundColor: const Color.fromARGB(
          255,
          76,
          186,
          80,
        ), // Button color
        foregroundColor: Colors.white, // Text & icon color
        //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: const Icon(Icons.call, size: 24),
      label: Text(
        label,
        style: GoogleFonts.josefinSans(
        color: Appcolor.bgcolor,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
      ),
    );
  }
}
