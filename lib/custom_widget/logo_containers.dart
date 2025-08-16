import 'package:flutter/material.dart';
import 'package:ss/Color/app_colors.dart';

class LogoContainers extends StatelessWidget {
  final double height;
  final double width;
  final Color bgcolor;
  final String assetimage;

  const LogoContainers({
    super.key,
    this.height = 50,
    this.width = 60,
    this.bgcolor = Appcolor.bgcolor,
    required this.assetimage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Appcolor.bgcolor,
        image: DecorationImage(image: AssetImage(assetimage)),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Appcolor.primarycolor),
      ),
    );
  }
}
