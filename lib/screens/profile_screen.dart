import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
//import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart' as AppSettings;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/CustomTextField.dart';
//import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/text_show.dart';
import 'package:ss/screens/tabs.dart';

class Profile extends StatefulWidget {
  // final String name;
  // final String flat;
  // final String phone;
  // final String address;

  const Profile({super.key, 
  //required this.name, required this.flat, required this.phone, required this.address
  });

  @override
  State<Profile> createState() => _ProfileState();
}

 class _ProfileState extends State<Profile> {
//   String name = "Vaishnai";
//   String flat = "";
//   String address = "";
//   String phone = "";
//   String email = "";

//   @override
//   void initState() {
//     super.initState();
//     loadProfileData();
//   }

//   Future<void> loadProfileData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       name = prefs.getString("name") ?? "";
//       flat = prefs.getString("flat") ?? "";
//       address = prefs.getString("address") ?? "";
//       phone = prefs.getString("phone") ?? "";
//       email = prefs.getString("email") ?? ""; // if you save email too
//     });
//   }

  Future<void> logout() async {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to log out?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove("isLoggedIn");
        Get.offAllNamed(Approutes.loginscreen);
      },
      onCancel: () {},
    );
  }

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
                                  flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
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
                              logout();
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
              SizedBox(height: 40),

              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/profile.webp"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Text(
                "Basic Details",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Appcolor.subtitlecolor,
                ),
              ),
              SizedBox(height: 10),
              //CustomTextField(label: "Full Name", hint: "$name"),
              TextShow(text: "Vaishnavi Mahurkar", label: "Full Name"),
              SizedBox(height: 10),
              //CustomTextField(label: "Flat no/House no", hint: flat),
              TextShow(text: "203", label: "Flat no/House no"),
              SizedBox(height: 10),
              //CustomTextField(label: "Address", hint: address),
              TextShow(text: "Nanded", label: "Address"),

              SizedBox(height: 20),
              Text(
                "Contact Details",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Appcolor.subtitlecolor,
                ),
              ),
              SizedBox(height: 10),
              //CustomTextField(label: "Phone", hint: phone),
              TextShow(text: "9404459700", label: "Phone"),
              SizedBox(height: 10),
              //CustomTextField(label: "Email", hint: email),
              TextShow(text:"vaishnavi@gmail.com", label: "Email"),
            ],
          ),
        ),
      ),
    );
  }
}


// class Profile extends StatelessWidget {

//   Future<void> logout() async {
//   Get.defaultDialog(
//     title: "Logout",
//     middleText: "Are you sure you want to log out?",
//     textCancel: "No",
//     textConfirm: "Yes",
//     confirmTextColor: Colors.white,
//     onConfirm: () async {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.remove("isLoggedIn");
//       Get.offAllNamed(Approutes.loginscreen); // clear stack and go to login
//     },
//     onCancel: () {},
//   );
// }

//   const Profile({super.key});


  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolor.bgcolor,
//       appBar: AppBar(
//         backgroundColor: Appcolor.bgcolor,

//         leading: IconButton(
//           icon: Icon(Icons.menu, color: Colors.black),
//           onPressed: () {
//             Navigator.of(context).push(
//               PageRouteBuilder(
//                 opaque: false, // Keep background visible
//                 pageBuilder: (_, __, ___) => Align(
//                   alignment: Alignment.centerLeft,
//                   child: FractionallySizedBox(
//                     widthFactor: 0.5, // Half screen width
//                     heightFactor: 1.0,
//                     child: Material(
//                       color: Colors.white,
//                       child: ListView(
//                         children: [
//                           ListTile(
//                             title: Text(
//                               "Society Setu",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                                 color: Appcolor.primarycolor,
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),

//                           ListTile(
//                             title: Text(
//                               "Dashboard",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             onTap: () {
//                               tabsKey.currentState?.onItemTapped(0);
//                               Navigator.pop(context);
//                             },
//                           ),
//                           ListTile(
//                             title: Text(
//                               "Complaints",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             onTap: () {
//                               tabsKey.currentState?.onItemTapped(1);
//                               Navigator.pop(context);
//                             },
//                           ),

//                           ListTile(
//                             title: Text(
//                               "Event & Notices",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             onTap: () {
//                               tabsKey.currentState?.onItemTapped(3);
//                               Navigator.pop(context);
//                             },
//                           ),
//                           ListTile(
//                             title: Text(
//                               "Bills & Payments",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             onTap: () {
//                               Get.toNamed(Approutes.bill);
//                               // tabsKey.currentState?.onItemTapped(3);
//                               // Navigator.pop(context);
//                             },
//                           ),
//                           ListTile(
//                             title: Text(
//                               "Emergency ",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             onTap: () {
//                               Get.toNamed(Approutes.emergency);
//                             },
//                           ),
//                           ListTile(
//                             title: Text(
//                               "Settings",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             onTap: () async {
//                               if (Platform.isAndroid) {
//                                 const intent = AndroidIntent(
//                                   action:
//                                       'android.settings.APPLICATION_DETAILS_SETTINGS',
//                                   data:
//                                       'package:com.example.ss', // 👈 your package name
//                                   flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
//                                 );
//                                 await intent.launch();
//                               } else if (Platform.isIOS) {
//                                 await AppSettings.openAppSettings();
//                               }
//                             },
//                           ),

//                           ListTile(
//                             title: Text(
//                               "Profile",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             onTap: () {
//                               tabsKey.currentState?.onItemTapped(4);
//                               Navigator.pop(context);
//                             },
//                           ),

//                           ListTile(
//                             title: Text(
//                               "About",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             onTap: () {
//                               Get.toNamed(Approutes.about);
//                               // tabsKey.currentState?.onItemTapped(3);
//                               // Navigator.pop(context);
//                             },
//                           ),

//                           ListTile(
//                             title: Text(
//                               "Logout",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             onTap: () {
//                               logout();
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 transitionsBuilder: (_, animation, __, child) {
//                   return SlideTransition(
//                     position: Tween<Offset>(
//                       begin: Offset(-1, 0),
//                       end: Offset(0, 0),
//                     ).animate(animation),
//                     child: child,
//                   );
//                 },
//               ),
//             );
//           },
//         ),

//         title: Text(
//           "Profile",
//           style: GoogleFonts.poppins(
//             fontSize: 24,
//             fontWeight: FontWeight.w500,
//             color: Appcolor.subtitlecolor,
//           ),
//         ),
//       ),

//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Padding(
//           padding: const EdgeInsets.all(17.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 40),

//               Center(
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: AssetImage("assets/images/profile.webp"),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               SizedBox(width: 15),
//               Text(
//                 "Basic Details",
//                 style: GoogleFonts.poppins(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                   color: Appcolor.subtitlecolor,
//                 ),
//               ),
//               SizedBox(height: 10),
//               CustomTextField(label: "Full Name", hint: "Vaishnvi Mahurkar"),
//               SizedBox(height: 10),
//               CustomTextField(label: "Flat no/House no", hint: "203"),
//               SizedBox(height: 10),
//               CustomTextField(label: "Address", hint: "xyz"),

//               SizedBox(height: 20),
//               SizedBox(width: 15),
//               Text(
//                 "Contact Details",
//                 style: GoogleFonts.poppins(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                   color: Appcolor.subtitlecolor,
//                 ),
//               ),
//               SizedBox(height: 10),
//               CustomTextField(label: "Mobile Number", hint: "7822027057"),
//               SizedBox(height: 10),
//               CustomTextField(label: "Eamil", hint: "abc@gmail.com"),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
