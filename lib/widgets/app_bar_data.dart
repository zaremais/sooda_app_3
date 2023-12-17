import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class AppBarData extends StatefulWidget {
  const AppBarData(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.image,
      required this.onTap});

  final String title;
  final String subTitle;
  final IconData icon;
  final String image;
  final Function() onTap;

  @override
  State<AppBarData> createState() => _AppBarDataState();
}

class _AppBarDataState extends State<AppBarData> {
  late bool showCartBadge;

  int cartItemNO = 2;

  @override
  Widget build(BuildContext context) {
    showCartBadge = cartItemNO > 0;
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 115.w,
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.nunitoSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff51637B)),
            ),
            Text(
              widget.subTitle,
              style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff1C222B)),
            )
          ],
        ),
        title: IconButton(
          onPressed: widget.onTap,
          icon: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              widget.icon,
              size: 24,
              color: const Color(0xff4A72FF),
            ),
          ),
        ),
        titleSpacing: -20,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                badges.Badge(
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.red,
                  ),
                  position: badges.BadgePosition.topEnd(top: -12, end: 6),
                  badgeContent: Text(
                    "$cartItemNO",
                    style: const TextStyle(color: Colors.white),
                  ),
                  showBadge: cartItemNO == 0 ? false : true,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        cartItemNO++;
                      });
                    },
                    child: Image.asset(
                      widget.image,
                      width: 24.w,
                      color: const Color(0xff1C222B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
