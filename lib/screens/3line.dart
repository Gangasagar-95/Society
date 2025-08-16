import 'package:flutter/material.dart';

class ThreeLine_Screen extends StatelessWidget {
  const ThreeLine_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      
    Scaffold(
  appBar: AppBar(
    leading: IconButton(
      icon: Icon(Icons.menu), // Your three-line icon
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: 0.5, // Half the screen width
              heightFactor: 1.0, // Full height
              child: Material(
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      child: Text('Categories'),
                    ),
                    ListTile(title: Text('DashBoard')),
                    ListTile(title: Text('Complaints')),
                    ListTile(title: Text('Profile')),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  ),
  body: Center(child: Text('Main Screen')),
);
  }
}