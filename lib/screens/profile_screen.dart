import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/CustomTextField.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.bgcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.bgcolor,

        leading: IconButton(
          onPressed: () {
            Get.toNamed(Approutes.tabscreen);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),

        title: Text(
          "Profile",
          style: GoogleFonts.josefinSans(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Appcolor.subtitlecolor,
          ),
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),

              Center(
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/profile.jpeg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(width: 15),
              Text(
                "Basic Details",
                style: GoogleFonts.josefinSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Appcolor.subtitlecolor,
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(label: "Full Name", hint: "Vaishnvi Mahurkar"),
              SizedBox(height: 20), 

              CustomTextField(label: "Date of birth", hint: "23/07/2025"),
              SizedBox(height: 20),
              SizedBox(width: 15),
              Text(
                "Contact Details",
                style: GoogleFonts.josefinSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Appcolor.subtitlecolor,
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(label: "Mobile Number", hint: "7822027057"),

            ],
          ),
        ),
      ),
    );
  }
}
