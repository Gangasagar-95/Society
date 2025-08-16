import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';

class MyIconButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const MyIconButton({Key? key, required this.label, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(360, 50),
        backgroundColor: const Color.fromARGB(
          255,
          103,
          56,
          170,
        ), // Button color
        foregroundColor: Colors.white, // Text & icon color
        //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: const Icon(Icons.search, size: 24),
      label: Text(
        label,
        style: GoogleFonts.josefinSans(
          color: Appcolor.bgcolor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
