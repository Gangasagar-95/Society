import 'package:flutter/material.dart';
import 'package:ss/Color/app_colors.dart';

class Subtext extends StatelessWidget {
  final String text;
  final Color textcolor;
  final double textsize;
  const Subtext({
    super.key,
    required this.text,
    this.textcolor = Appcolor.subtextcolor,
    this.textsize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textcolor, fontSize: textsize),
    );
  }
}
