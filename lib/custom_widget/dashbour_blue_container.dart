import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/screens/tabs.dart';
import 'dart:io' show Platform;

class CustomTopAppBar extends StatelessWidget {
  final String text;
  const CustomTopAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
      decoration: BoxDecoration(
        color: Color(0xFF9550F5),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row: Menu + Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
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
              // Container(
              //   height: 40,
              //   width: 40,
              //   decoration: BoxDecoration(
              //     color: Colors.pinkAccent,
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   child: Center(
              //     child: Text(
              //       "M",
              //       style: TextStyle(
              //         fontSize: 20,
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // )
              IconButton(
                onPressed: () {
                  tabsKey.currentState?.onItemTapped(4);
                },
                icon: Icon(Icons.person_2, color: Colors.white),
              ),
            ],
          ),

          SizedBox(height: 60),

          Text(
            text,

            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Appcolor.bgcolor,
            ),
          ),
        ],
      ),
    );
  }
}
