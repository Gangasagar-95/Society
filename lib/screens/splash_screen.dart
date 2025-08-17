// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ss/Color/app_colors.dart';
// import 'package:ss/screens/login_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFFD8C1F8),
//               Color(0xFF8951D7),
//               Color(0xFF7637CF),
//               Color(0xFF592B99),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Image.asset(
//                 "assets/images/newlogo.png",
//                 width: 150,
//                 height: 150,
//               ),
//             ),
//             Text(
//               "Society Setu",
//               style: GoogleFonts.poppins(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w500,
//                 color: Appcolor.bgcolor,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    await Future.delayed(const Duration(seconds: 3)); // show splash

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

    if (isLoggedIn) {
      Get.offNamed(Approutes.tabscreen); // or Approutes.tabs
    } else {
      Get.offNamed(Approutes.loginscreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFD8C1F8),
              Color(0xFF8951D7),
              Color(0xFF7637CF),
              Color(0xFF592B99),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/newlogo.png",
                width: 150,
                height: 150,
              ),
            ),
            Text(
              "Society Setu",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Appcolor.bgcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//   // Future<void> checkLogin() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String token = prefs.getString('token') ?? '';

//   //   if (token.isNotEmpty) {
//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(builder: (context) => Tabs()),
//   //     );
//   //   } else {
//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(builder: (context) => LoginScreen()),
//   //     );
//   //   }
//   // }