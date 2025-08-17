import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
//import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart' as AppSettings;
import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';
//import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/CustomTextField.dart';
import 'package:ss/screens/tabs.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.bgcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.bgcolor,

        leading: 
         IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false, // Keep background visible
                      pageBuilder: (_, __, ___) => Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: 0.5, // Half screen width
                          heightFactor: 1.0,
                          child: Material(
                            color: Colors.white,
                            child: ListView(
                              children: [
                                ListTile(
                                  title: Text(
                                    "Society Setu",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Appcolor.primarycolor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),

                                ListTile(
                                  title: Text(
                                    "Dashboard",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    tabsKey.currentState?.onItemTapped(0);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                    "Complaints",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    tabsKey.currentState?.onItemTapped(1);
                                    Navigator.pop(context);
                                  },
                                ),

                                ListTile(
                                  title: Text(
                                    "Event & Notices",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    tabsKey.currentState?.onItemTapped(3);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                    "Bills & Payments",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(Approutes.bill);
                                    // tabsKey.currentState?.onItemTapped(3);
                                    // Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                    "Emergency ",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(Approutes.emergency);
                                  },
                                ),
                                ListTile(
                                  title: Text(
                                    "Settings",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () async {
                                    if (Platform.isAndroid) {
                                      const intent = AndroidIntent(
                                        action:
                                            'android.settings.APPLICATION_DETAILS_SETTINGS',
                                        data:
                                            'package:com.example.ss', // 👈 your package name
                                        flags: <int>[
                                          Flag.FLAG_ACTIVITY_NEW_TASK,
                                        ],
                                      );
                                      await intent.launch();
                                    } else if (Platform.isIOS) {
                                      await AppSettings.openAppSettings();
                                    }
                                  },
                                ),

                                ListTile(
                                  title: Text(
                                    "Profile",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    tabsKey.currentState?.onItemTapped(4);
                                    Navigator.pop(context);
                                  },
                                ),

                                ListTile(
                                  title: Text(
                                    "About",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    Get.toNamed(Approutes.about);
                                    // tabsKey.currentState?.onItemTapped(3);
                                    // Navigator.pop(context);
                                  },
                                ),

                                ListTile(
                                  title: Text(
                                    "Logout",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    tabsKey.currentState?.onItemTapped(3);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      transitionsBuilder: (_, animation, __, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset(0, 0),
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),

        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
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
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
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
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
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
