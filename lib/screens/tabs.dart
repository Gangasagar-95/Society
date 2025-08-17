import 'package:flutter/material.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/screens/complaint.dart';
import 'package:ss/screens/dashboard.dart';
import 'package:ss/screens/notification_screen.dart';
import 'package:ss/screens/profile_screen.dart';

final GlobalKey<TabsState> tabsKey = GlobalKey<TabsState>();

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => TabsState();
}

class TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  //Widget? _subScreen;

  final List<Widget> _Screens = [
    Dashscreen(),
    Complaints(),
    Center(
      child: Icon(Icons.add_circle_outline, size: 80, color: Appcolor.bcolor),
    ),
    NotificationScreen(),
    Profile(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // void openSubScreen(Widget screen) {
  //   setState(() {
  //     _subScreen = screen;
  //   });
  // }

  // // 👉 Go back to tab's main screen
  // void closeSubScreen() {
  //   setState(() {
  //     _subScreen = null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //_subScreen ??
          _Screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Appcolor.bgcolor,
        selectedIconTheme: IconThemeData(color: Appcolor.primarycolor),
        selectedItemColor: Appcolor.primarycolor,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color.fromARGB(255, 197, 156, 255),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: "Complaints",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
