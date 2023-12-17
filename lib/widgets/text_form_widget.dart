import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({
    super.key,
  });

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 299.w,
            height: 52.h,
            decoration: BoxDecoration(
                color: const Color(0xffEDF0F8),
                borderRadius: BorderRadius.circular(12.r)),
            child: TextFormField(
              controller: controller,
              onChanged: (value) {
                // print("введенный текст: $value");
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/search-lg.png",
                      width: 56.w,
                    )),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                labelText: "Поиск",
                labelStyle: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff51637B)),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/icons/scan.png",
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 36.w,
            height: 52.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffEDF0F8),
            ),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/icons/settings-04.png",
                  width: 24.w,
                  color: const Color(0xff1C222B),
                )),
          )
        ],
      ),
    );
  }
}
