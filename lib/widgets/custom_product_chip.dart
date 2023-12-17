import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProductChip extends StatelessWidget {
  const CustomProductChip({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onSelected,
  });

  final bool isSelected;

  final String title;

  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
        backgroundColor: Colors.white,
        onSelected: onSelected,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
        selectedColor: Colors.black,
        disabledColor: Colors.white,
        label: Text(
          title,
          style: GoogleFonts.nunitoSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected == true ? Colors.white : const Color(0xff51637B),
          ),
        ),
        selected: isSelected);
  }
}
