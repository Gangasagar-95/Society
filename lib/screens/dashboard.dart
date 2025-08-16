import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';

import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/custom_circle.dart';
import 'package:ss/custom_widget/dashbour_blue_container.dart';
import 'package:ss/custom_widget/outline_button_dashboard.dart';

class Dashscreen extends StatelessWidget {
  const Dashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          
          children: [
            CustomTopAppBar(text: "Dashboard"),
            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Household Services",style: GoogleFonts.josefinSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Appcolor.subtitlecolor,
                      ),),
                SizedBox(height: 10,),
                
                SingleChildScrollView( scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCircle(label: "Plumber", image: "assets/images/plumb req.jpg", onTap: () {Get.toNamed(Approutes.callplumber);},),
                      SizedBox(width: 15,),
                      CustomCircle(label: "Maid", image: "assets/images/maid.jpg", onTap: () {Get.toNamed(Approutes.callmaid);  },),
                      SizedBox(width: 15,),
                      CustomCircle(label: "Carpainter", image: "assets/images/carpainter.jpg", onTap: () {  },),
                      SizedBox(width: 15,),
                      CustomCircle(label: "Appliance Re...", image: "assets/images/repair2.jpg", onTap: () {  },),
                      SizedBox(width: 15,),
                      CustomCircle(label: "pest Controll", image: "assets/images/pest3.jpg", onTap: () {  },),
                      SizedBox(width: 15,),
                      CustomCircle(label: "painter", image: "assets/images/paint3.jpg", onTap: () {  },),
                      
                  
                    ],
                  ),
                ),

               
              SizedBox(height: 20,),
              Row(
                children: [
                  CustomOutlineButton(
                    title: "Maid Not Coming",
                            
                    imagePath: "assets/images/maid.jpg",
                    onPressed: () {
                      Get.toNamed(Approutes.maidscreen);
                    },
                  ),
                  SizedBox(width: 15),
                  CustomOutlineButton(
                    title: "Street light not working",
                    imagePath: "assets/images/lamp_light.jpg",
                    onPressed: () {
                      Get.toNamed(Approutes.streetlightscreen);
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  CustomOutlineButton(
                    title: "Garbage not picked up",
                    imagePath: "assets/images/Garbage_problem.jpg",
                    onPressed: () {
                      Get.toNamed(Approutes.garbagescreen);
                    },
                  ),
                  SizedBox(width: 15),
                  CustomOutlineButton(
                    title: "Dog Menace",
                    imagePath: "assets/images/dog_problem.jpg",
                    onPressed: () {
                      Get.toNamed(Approutes.dogproblemscreen);
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  CustomOutlineButton(
                    title: "No water supply",
                    imagePath: "assets/images/no_water_supply.jpg",
                    onPressed: () {
                      Get.toNamed(Approutes.nowaterscreen);
                    },
                  ),
                  SizedBox(width: 15),
                  CustomOutlineButton(
                    title: "tenant issues",
                    imagePath: "assets/images/tenant_issues.jpg",
                    onPressed: () {
                      Get.toNamed(Approutes.tenantissuescreen);
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  CustomOutlineButton(
                    title: "Others Problem",
                    imagePath: "assets/images/others_problem.jpg",
                    onPressed: () {
                      Get.toNamed(Approutes.othersproblemscreen);
                    },
                  ),
                  SizedBox(width: 15),
                  CustomOutlineButton(
                    title: "Power Cut Schedual",
                    imagePath: "assets/images/power_cut.jpg",
                    onPressed: () {
                      Get.toNamed(Approutes.powercut);
                    },
                  ),
                ],
              ),
               ],
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
