import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 244, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        
        title: Text(
          "About Us",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Appcolor.primarycolor,
          ),
        ),
        // centerTitle: true,
        elevation: 0,
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [


            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/topapplogo.jpg",),fit: BoxFit.fill),
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 240, 228, 255),
              ),
            ),

            // Logo or App Icon
      
            const SizedBox(height: 15),

            Text(
              "Society Setu",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Appcolor.primarycolor,
              ),
            ),
           SizedBox(height: 8),

            Text(
              "Connecting Residents • Building Community",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 25),

            // About Text Container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                "Society Setu is a one-stop solution for managing society-related services. "
                "From complaints and emergency contacts to bill payments and event updates, "
                "we simplify communication and bring residents closer together.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  height: 1.5,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Version + Contact Info
            Column(
              children: [
                Text(
                  "App Version: 1.0.0",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Contact: support@societysetu.com",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}