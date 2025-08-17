import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';
import 'package:ss/custom_widget/bill_button.dart';

class BillsPaymentScreen extends StatelessWidget {
  const BillsPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 239, 255),
      appBar: AppBar(
        backgroundColor: Appcolor.bgcolor,
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text(
          "Bills & Payments",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Appcolor.primarycolor,
          ),
        ),
        // centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Bills",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 13, 13, 13),
              ),
            ),
            const SizedBox(height: 15),

            BillContainer(
              title: "Maintenance Fee",
              dueDate: "15 Aug 2025",
              amount: "1200",
            ),
            BillContainer(
              title: "Water Bill",
              dueDate: "30 Aug 2025",
              amount: "1200",
            ),
            BillContainer(
              title: "Electricity Bill",
              dueDate: "13 Sep 2025",
              amount: "1000",
            ),
          ],
        ),
      ),
    );
  }
}
