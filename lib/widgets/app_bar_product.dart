import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBarProduct(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      color: const Color(0xff1C222B),
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    ),
    title: Text(
      "Выбрать товар",
      style: GoogleFonts.nunitoSans(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xff1C222B)),
    ),
  );
}
