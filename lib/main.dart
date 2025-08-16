import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ss/screens/complaint.dart';
import 'package:ss/screens/create_account_screen.dart';
import 'package:ss/screens/dashboard.dart';
import 'package:ss/screens/dog_problem.dart';
import 'package:ss/screens/email_verification_screen.dart';
import 'package:ss/screens/forgot_password_screen.dart';
import 'package:ss/screens/garbage_problem.dart';
import 'package:ss/screens/information.dart';
import 'package:ss/screens/login_screen.dart';
import 'package:ss/screens/maid_screen.dart';
import 'package:ss/screens/no_watersupply.dart';
import 'package:ss/screens/notification_screen.dart';
import 'package:ss/screens/others_problem.dart';
import 'package:ss/screens/powercut_schedule.dart';
import 'package:ss/screens/profile_screen.dart';
import 'package:ss/screens/reset_password_screen.dart';
import 'package:ss/screens/splash_screen.dart';
import 'package:ss/screens/street_light.dart';
import 'package:ss/screens/tabs.dart';
import 'package:ss/screens/tenant_issue.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  runApp(MyApp(token: token));

  print("token in main.dart:$token");
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, required this.token});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: token == null ? '/login_screen' : '/Tab_screen',

      routes: {
        "/": (context) => Tabs(), //Informationscreen(),//Dashscreen(),
        "/login_screen": (context) => LoginScreen(),
        "/information_screen": (context) => Informationscreen(),
        "/create_account_Screen": (context) => CreateAccount(),
        "/forgot_password_screen": (context) => ForgotPassword(),
        "/email_verification_screen": (context) => EmailVerification(),
        "/reset_password_screen": (context) => ResetPassword(),
        "/splash_screen": (context) => SplashScreen(),
        "/dash_screen": (context) => Dashscreen(),
        "/maid_screen": (context) => MaidScreen(),
        "/dog_problem_screen": (context) => DogsScreen(),
        "/no_water_supply": (context) => NoWatersupply(),
        "/street_light": (context) => Streetlight(),
        "/tenant_issue": (context) => Tenantissue(),
        "/others_problem": (context) => OthersProblem(),
        "/garbage_screen": (context) => Garbage(),
        "/complaint_screen": (context) => Complaints(),
        "/notification_screen": (context) => NotificationScreen(),
        "/profile_screen": (context) => Profile(),
        "/tab_screen": (context) => Tabs(),
        "/powercut_schedule": (context) => Powercut(),
      },
    );
  }
}
