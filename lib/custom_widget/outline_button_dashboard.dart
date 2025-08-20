import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onPressed;

  const CustomOutlineButton({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),

      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: size.height * 0.28, // ~28% of screen height
        width: size.width * 0.44, 
          // height: 230,
          // width: 170,
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Appcolor.primarycolor, width: 1.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  imagePath,
                  height: 90,
                  width: 90,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 5),

              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Appcolor.subtitlecolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
