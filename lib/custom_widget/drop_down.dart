import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';

class CategoryDropdownField extends StatefulWidget {
  const CategoryDropdownField({super.key});

  @override
  State<CategoryDropdownField> createState() => _CategoryDropdownFieldState();
}

class _CategoryDropdownFieldState extends State<CategoryDropdownField> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _categories = [
    "Cooker",
    "Sweeper",
    "Laundary",
    "Child care",
  ];

  void _showCategoryMenu() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + renderBox.size.height,
        offset.dx + renderBox.size.width,
        0,
      ),
      items: _categories
          .map(
            (category) =>
                PopupMenuItem<String>(value: category, child: Text(category)),
          )
          .toList(),
    ).then((selected) {
      if (selected != null) {
        setState(() {
          _controller.text = selected;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Category", style: GoogleFonts.poppins(fontSize: 20)),

        TextFormField(
          controller: _controller,
          readOnly: true, // so user can only select
          decoration: InputDecoration(
            hintText: "Select category",
            suffixIcon: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Appcolor.primarycolor,
              ),
              onPressed: _showCategoryMenu,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Appcolor.primarycolor),
            ),
          ),
        ),
      ],
    );
  }
}
