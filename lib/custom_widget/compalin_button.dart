import 'package:flutter/material.dart';

import 'package:ss/Color/app_colors.dart';

class ComplaintButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final String status;
  final VoidCallback onPressed;

  const ComplaintButton({
    super.key,
    required this.iconPath,
    required this.title,
    required this.status,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(150, 100),
          side: BorderSide(color: Appcolor.primarycolor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(8),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            // Icon/Image
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Appcolor.bgcolor,
              ),
              child: Image.asset(iconPath, fit: BoxFit.contain),
            ),
            const SizedBox(width: 12),
            // Text Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Appcolor.subtitlecolor,
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
