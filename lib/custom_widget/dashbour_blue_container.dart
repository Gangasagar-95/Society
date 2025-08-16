

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:society_mansi/Color/app_color.dart';
// import 'package:society_mansi/Screen/complaints.dart';
// import 'package:society_mansi/Screen/maid_screen.dart';
// import 'package:society_mansi/Screen/notification.dart';
// import 'package:society_mansi/Screen/profile.dart';
import 'package:ss/Color/app_colors.dart';
//import 'package:ss/custom_widget/notification_container.dart';
import 'package:ss/screens/complaint.dart';
//import 'package:ss/screens/dashboard.dart';
//import 'package:ss/screens/maid_screen.dart';
import 'package:ss/screens/notification_screen.dart';
import 'package:ss/screens/profile_screen.dart';
import 'package:ss/screens/tabs.dart';

class CustomTopAppBar extends StatelessWidget {
  final String text;
  const CustomTopAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
      decoration: BoxDecoration(
        color: Color(0xFF9550F5),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row: Menu + Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             IconButton(
  icon: Icon(Icons.menu,color: Colors.white,),
  onPressed: () {
    Navigator.of(context).push(PageRouteBuilder(
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
                  title: Text("Dashboard",
                    style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.w600,
                  ),),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Tabs()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Complaints",
                  style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.w600,
                  ),),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Complaints()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Profile",
                  style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.w600,
                  ),),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Profile()),
                    );
                  },
                ),
                ListTile(
                  title: Text("Notification",
                  style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.w600,
                  ),),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NotificationScreen()),
                    );
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
    ));
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
              IconButton(onPressed: (){
        
              }, icon:Icon(Icons.person_2,color: Colors.white,))
            ],
          ),

          SizedBox(height: 60),

          
          Text(
            text,
          
            style: GoogleFonts.josefinSans(fontSize: 24, fontWeight: FontWeight.w600,color: Appcolor.bgcolor ),
          ),
        ]
          ),
        
      );
          
  }
}