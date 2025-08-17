import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ss/Color/app_colors.dart';
import 'package:ss/Routes/app_routes.dart';
import 'package:ss/custom_widget/question_text.dart';

class Informationscreen extends StatelessWidget {
  //final detailCtrl = TextEditingController();
   final nameCtrl = TextEditingController();
   final flatCtrl = TextEditingController();
   final phoneCtrl = TextEditingController();
   final addressCtrl = TextEditingController();
   final _formkey = GlobalKey<FormState>();

   void continuee() async {
    if (_formkey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("name", nameCtrl.text.trim());
      await prefs.setString("flat", flatCtrl.text.trim());
      await prefs.setString("phone", phoneCtrl.text.trim());
      await prefs.setString("address", addressCtrl.text.trim());
      await prefs.setBool("isLoggedIn", true);

      Get.offNamed(Approutes.tabscreen); 
    }
  }


  Informationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.bgcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.primarycolor,
        leading: Icon(Icons.arrow_back_ios_new_outlined),

        title: Text(
          "Personal Details",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Appcolor.bgcolor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    "Enter Your Details ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Appcolor.subtitlecolor,
                    ),
                  ),
                  Text(
                    "Please provide your information below",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Appcolor.subtextcolor,
                    ),
                  ),
                  SizedBox(height: 25),
                  QuestionText(
                    label: "Full Name",
                    hint: "Name Surname",
                    controller: nameCtrl,
                  ),

                  SizedBox(height: 14),
                  QuestionText(
                    label: "Flat No/House No",
                    hint: "Tower - flat.no",
                    controller: flatCtrl,
                  ),
                  SizedBox(height: 14),
                  QuestionText(
                    label: "phone number",
                    hint: "+91 XXXX XXX XXX",
                    controller: phoneCtrl,
                  ),
                  SizedBox(height: 14),
                  QuestionText(
                    label: "Address",
                    hint: "xyz",
                    controller: addressCtrl,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      continuee();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(350, 50),
                      backgroundColor: Appcolor.primarycolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Appcolor.bgcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:ss/Color/app_colors.dart';
// import 'package:ss/Routes/app_routes.dart';
// import 'package:ss/custom_widget/question_text.dart';

// class Informationscreen extends StatelessWidget {
//   final _formkey = GlobalKey<FormState>();

//   // separate controllers
//   final nameCtrl = TextEditingController();
//   final flatCtrl = TextEditingController();
//   final phoneCtrl = TextEditingController();
//   final addressCtrl = TextEditingController();

//   Informationscreen({super.key});

//   void continuee() async {
//     if (_formkey.currentState!.validate()) {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString("name", nameCtrl.text.trim());
//       await prefs.setString("flat", flatCtrl.text.trim());
//       await prefs.setString("phone", phoneCtrl.text.trim());
//       await prefs.setString("address", addressCtrl.text.trim());
//       await prefs.setBool("isLoggedIn", true);

//       Get.offNamed(Approutes.tabscreen); 
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolor.bgcolor,
//       appBar: AppBar(
//         backgroundColor: Appcolor.primarycolor,
//         leading: Icon(Icons.arrow_back_ios_new_outlined),
//         title: Text(
//           "Personal Details",
//           style: GoogleFonts.poppins(
//             fontSize: 22,
//             fontWeight: FontWeight.w500,
//             color: Appcolor.bgcolor,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formkey,
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 children: [
//                   Text(
//                     "Enter Your Details ",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.poppins(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w500,
//                       color: Appcolor.subtitlecolor,
//                     ),
//                   ),
//                   Text(
//                     "Please provide your information below",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.poppins(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: Appcolor.subtextcolor,
//                     ),
//                   ),
//                   SizedBox(height: 25),
//                   QuestionText(
//                     label: "Full Name",
//                     hint: "Name Surname",
//                     controller: nameCtrl,
//                   ),
//                   SizedBox(height: 14),
//                   QuestionText(
//                     label: "Flat No/House No",
//                     hint: "Tower - flat.no",
//                     controller: flatCtrl,
//                   ),
//                   SizedBox(height: 14),
//                   QuestionText(
//                     label: "Phone Number",
//                     hint: "+91 XXXX XXX XXX",
//                     controller: phoneCtrl,
//                   ),
//                   SizedBox(height: 14),
//                   QuestionText(
//                     label: "Address",
//                     hint: "xyz",
//                     controller: addressCtrl,
//                   ),
//                   SizedBox(height: 25),
//                   ElevatedButton(
//                     onPressed: continuee,
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(350, 50),
//                       backgroundColor: Appcolor.primarycolor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                     ),
//                     child: Text(
//                       "Continue",
//                       style: TextStyle(
//                         color: Appcolor.bgcolor,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

