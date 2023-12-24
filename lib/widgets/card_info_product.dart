import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sooda_app/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

// ignore: must_be_immutable
class CardInfoProduct extends StatelessWidget {
  const CardInfoProduct({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: 343.0.w,
            height: 154.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '№54931',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                    Image.asset(
                      'assets/icons/check.png',
                      width: 24.w,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        image,
                        width: 70.w,
                        height: 70.h,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Off-white, Футболка из рельефной\nткани',
                          maxLines: 2,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff1C222B)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const badges.Badge(
                              badgeStyle: badges.BadgeStyle(
                                  badgeColor: AppColors.greenColor),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              '500 ₽',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff1C222B)),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            const badges.Badge(
                              badgeStyle: badges.BadgeStyle(
                                  badgeColor: AppColors.purpleColor),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              '1 200 ₽',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff1C222B)),
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            Text(
                              '54шт',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff1C222B)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/cube-01.png',
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Склад',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff51637B)),
                    ),
                    SizedBox(
                      width: 124.w,
                    ),
                    Text(
                      '120 шт',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff1C222B)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
