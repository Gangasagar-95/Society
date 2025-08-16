import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/notification_container.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
          icon: Icon(Icons.menu),
        ),
        title: Text(
          "Notification",
          style: GoogleFonts.josefinSans(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Appcolor.subtitlecolor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 20),
              NotificationCard(
                imagePath: "assets/images/power_cut.jpg",
                title: "Power cut schedule",
                subtitle: "cut the electricity for 2 hours",
              ),
              SizedBox(height: 20),
              NotificationCard(
                imagePath: "assets/images/no_water_supply.jpg",
                title: "Water supply ",
                subtitle: "No water supply since 3 days",
              ),
              SizedBox(height: 20),
              NotificationCard(
                imagePath: "assets/images/others_problem.jpg",
                title: "Lift maintenance",
                subtitle: "Lift is not working since 2 days",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
