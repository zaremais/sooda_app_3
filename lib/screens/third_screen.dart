import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sooda_app/constants/colors.dart';
import 'package:flutter_sooda_app/widgets/add_badge_count.dart';
import 'package:flutter_sooda_app/widgets/app_bar_product.dart';
import 'package:flutter_sooda_app/widgets/custom_product_chip.dart';
import 'package:flutter_sooda_app/widgets/text_form_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int cartItemNO = 0;

  int selectedIndex = 0;

  List<String> labels = [
    "Моя точка",
    "Проход 12г",
    "Контейнер 454",
  ];

  List<String> products = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
  ];

  List<bool> isChecked = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarProduct(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TextFormWidget(),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 94.w,
                        height: 32.h,
                        child: CustomProductChip(
                          title: labels[0],
                          onSelected: (isSelected) {
                            selectedIndex = 0;
                            setState(() {});
                          },
                          isSelected: selectedIndex == 0,
                        ),
                      ),
                      SizedBox(
                        width: 102.w,
                        height: 32.h,
                        child: CustomProductChip(
                          title: labels[1],
                          onSelected: (isSelected) {
                            selectedIndex = 1;
                            setState(() {});
                          },
                          isSelected: selectedIndex == 1,
                        ),
                      ),
                      SizedBox(
                        width: 126.w,
                        height: 32.h,
                        child: CustomProductChip(
                          title: labels[2],
                          onSelected: (isSelected) {
                            selectedIndex = 2;
                            setState(() {});
                          },
                          isSelected: selectedIndex == 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            for (int i = 0; i < isChecked.length; i++)
              myCheckBox(isChecked[i], products[i], i),
          ],
        ),
      ),
      bottomSheet: myBottomSheet(context),
    );
  }

  Padding myBottomSheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12),
      child: SizedBox(
        height: 72.h,
        width: double.infinity,
        child: Row(
          children: [
          for (int i = 0; i < isChecked.length; i++)
            if (isChecked[i] == true)
              InkWell(
                onTap: () {
                  setState(() {
                    cartItemNO++;
                  });
                },
                child: addBadgeCount(
                    badgeColor: AppColors.blueColor,
                    widget: Image.asset(
                      products[i],
                      width: 40.w,
                    ),
                    badgeCount: cartItemNO),
              ),
          SizedBox(
            width: 38.w,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r)),
                backgroundColor: AppColors.amberColor,
                fixedSize: Size(147.w, 48.h)),
            onPressed: () {
              cartItemNO++;
            },
            child: Row(
              children: [
                Text(
                  "Выбрать $cartItemNO",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "itemScreen");
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right_sharp,
                      size: 24,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget myCheckBox(bool check, String image, int index) {
    return Container(
      width: 343.w,
      height: 164.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blueColor),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: Text(
                  "№54931",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Checkbox(
                  activeColor: AppColors.blueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  value: check,
                  onChanged: (val) {
                    setState(() {
                      isChecked[index] = val!;
                    });
                  }),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 35),
                child: Image.asset(
                  products[index],
                  width: 70,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                children: [
                  Text(
                    "Off-white, Футболка из рельефной\nткани",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const badges.Badge(
                        badgeStyle:
                            badges.BadgeStyle(badgeColor: AppColors.greenColor),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "500 ₽",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      const badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                            badgeColor: AppColors.purpleColor),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "1 200 ₽",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 56.w,
                      ),
                      Text("54шт",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/cube-01.png",
                          width: 24.w,
                          color: AppColors.secondaryColor,
                        ),
                        Text(
                          "Склад",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryColor),
                        ),
                        SizedBox(
                          width: 118.w,
                        ),
                        Text(
                          "120 шт",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
