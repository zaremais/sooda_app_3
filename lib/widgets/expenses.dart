import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({
    super.key,
    required this.image,
    required this.expensesTitle,
    required this.onPressed,
  });

  final String image;
  final String expensesTitle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 24.w,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              expensesTitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xff1C222B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
