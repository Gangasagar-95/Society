import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Color/app_colors.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<String> items;
  final String hintText;
  final Function(String?)? onChanged;
  final String? selectedValue;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.items,
    required this.hintText,
    this.onChanged,
    this.selectedValue,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title above the dropdown
        Text(widget.title, style: GoogleFonts.poppins(fontSize: 18)),
        const SizedBox(height: 8),

        // Dropdown
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Appcolor.primarycolor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedValue,
              hint: Text(
                widget.hintText,
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              isExpanded: true,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Appcolor.subtitlecolor,
              ),
              items: widget.items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
