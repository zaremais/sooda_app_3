import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDataWidget extends StatelessWidget {
  const CardDataWidget({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.color,
  });

  final String title;
  final String price;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.all(1.5),
        width: 167.5.w,
        height: 72.h,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            child: Text(
              price,
              style: GoogleFonts.nunitoSans(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: price == '+32 000'
                    ? Colors.green
                    : price == '-2400'
                        ? Colors.red
                        : Colors.black,
              ),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(
              top: 0,
            ),
            child: Image.asset(
              image,
              width: 24.w,
            ),
          ),
        ),
      ),
    ]);
  }
}
