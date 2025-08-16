import 'package:flutter/material.dart';
import 'package:ss/Color/app_colors.dart';

class CustomSearchButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomSearchButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.search, color : Appcolor.primarycolor),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Appcolor.primarycolor,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Appcolor.primarycolor, width: 2), // outline
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // rounded corners
        ),
      ),
    );
  }
}