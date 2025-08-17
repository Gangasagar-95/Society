import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ss/Color/app_colors.dart';

class CustomCircle extends StatelessWidget {
  final String label;
  final String image;
  final VoidCallback? onTap;

  const CustomCircle({
    super.key,
    required this.label,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
              shape: BoxShape.circle,
              // border: Border.all(
              //   color: Appcolor.primarycolor, // red border
              //   width: 2,
              // ),
            ),
            alignment: Alignment.center,
            //child: Image.asset(image,fit: BoxFit.fill,),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
