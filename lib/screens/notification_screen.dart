import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';
//import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/notification_container.dart';
import 'package:ss/screens/tabs.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.bgcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.bgcolor,
        leading: IconButton(
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
                              "Notification",
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
          "Notification",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Appcolor.subtitlecolor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                " This month",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Appcolor.subtitlecolor,
                ),
              ),

              NotificationCard(
                imagePath: "assets/images/event.jpg",
                title: "Society Event",
                subtitle: "You are invited for flag hosting ceremony",
              ),
              SizedBox(height: 20),
              NotificationCard(
                imagePath: "assets/images/power_cut.jpg",
                title: "Power cut schedule",
                subtitle: "Electricity will be cut for 2 hours",
              ),
              SizedBox(height: 20),
              NotificationCard(
                imagePath: "assets/images/no_water_supply.jpg",
                title: "Water supply ",
                subtitle: "No water supply since 3 days",
              ),
              SizedBox(height: 20),

              Text(
                " Jully",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Appcolor.subtitlecolor,
                ),
              ),
              NotificationCard(
                imagePath: "assets/images/others_problem.jpg",
                title: "Lift maintenance",
                subtitle: "Lift under repsir for 2 days",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
