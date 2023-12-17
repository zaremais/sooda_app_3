import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
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
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        selectedColor: const Color(0xffEDF0F8),
        disabledColor: Colors.white,
        label: Text(
          title,
          style: GoogleFonts.nunitoSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected == true ? Colors.black : const Color(0xff51637B),
          ),
        ),
        selected: isSelected);
  }
}
