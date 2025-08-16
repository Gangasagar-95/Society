import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/custom_widget/compalin_button.dart';
import 'package:ss/custom_widget/dashbour_blue_container.dart';

class Complaints extends StatelessWidget {
  const Complaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CustomTopAppBar(text: "Complaints"),
            SizedBox(height: 30),

            Text(
              "Recent Complaints",
              style: GoogleFonts.josefinSans(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 25),

            ComplaintButton(
              iconPath: "assets/images/Garbage_problem.jpg",
              title: "Garbage Not Picked",
              status: "Submitted",
              onPressed: () {},
            ),
            SizedBox(height: 20),
            ComplaintButton(
              iconPath: "assets/images/lamp_light.jpg",
              title: "Street light not Working",
              status: "Submitted",
              onPressed: () {},
            ),
            SizedBox(height: 20),
            ComplaintButton(
              iconPath: "assets/images/no_water_supply.jpg",
              title: "No water Supply",
              status: "pending",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
