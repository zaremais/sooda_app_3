import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sooda_app/constants/colors.dart';
import 'package:flutter_sooda_app/constants/images.dart';
import 'package:flutter_sooda_app/screens/product_details_screen.dart';
import 'package:flutter_sooda_app/screens/product_screen.dart';
import 'package:flutter_sooda_app/widgets/add_badge_count.dart';
import 'package:flutter_sooda_app/widgets/custom_product_chip.dart';
import 'package:flutter_sooda_app/widgets/text_form_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int cartItemNO = 0;
  late String selectedLabel = labels.first;


  List<String> labels = [
    'Моя точка',
    'Проход 12г',
    'Контейнер 454',
  ];

List<String> products = [
    AppImages.salle1,
    AppImages.salle2,
    AppImages.salle3,
    AppImages.salle4,
  ];

  List<bool> isChecked = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: const Color(0xff1C222B),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductScreen()));
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Выбрать товар',
          style: GoogleFonts.nunitoSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff1C222B)),
        ),
      ),
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
                      ...labels
                          .map((e) => CustomProductChip(
                                title: e,
                                isSelected: e == selectedLabel,
                                onSelected: ((p0) {
                                  setState(() {
                                    selectedLabel = e;
                                  });
                                }),
                              ))
                          ,
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
        child: Row(children: [
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
                  'Выбрать $cartItemNO',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ProductDetailsScreen()));
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
    return
        Container(
          width: 343.w,
          height: 154.h,
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
                      '№54931',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
        Checkbox(
            activeColor: AppColors.blueColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            value: check,
            onChanged: (val) {
              setState(() {
                isChecked[index] = val!;
              });
            })
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 20),
                child: Image.asset(
                  products[index],
                  width: 70,
                  height: 70,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                children: [
                  Text(
                    'Off-white, Футболка из рельефной\nткани',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5),
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
                        '500 ₽',
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
                        '1 200 ₽',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 56.w,
                      ),
                      Text('54шт',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                    ],
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.cube,
                          width: 24.w,
                          color: AppColors.secondaryColor,
                        ),
                        Text(
                          'Склад',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryColor),
                        ),
                        SizedBox(
                          width: 118.w,
                        ),
                        Text(
                          '120 шт',
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
