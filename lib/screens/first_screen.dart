import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sooda_app/constants/colors.dart';
import 'package:flutter_sooda_app/constants/images.dart';
import 'package:flutter_sooda_app/models/data_model.dart';
import 'package:flutter_sooda_app/screens/second_screen.dart';
import 'package:flutter_sooda_app/widgets/expenses.dart';
import 'package:flutter_sooda_app/widgets/app_bar_data.dart';
import 'package:flutter_sooda_app/widgets/card_data.dart';
import 'package:flutter_sooda_app/widgets/custom_chip.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int selectedIndex = 0;
 
  List<Widget> screens = [const FirstScreen()];
  List<String> labels = ["Сегодня", "7 дней", "Месяц"];
  List<DataModel> data = [
    DataModel(
      color: AppColors.deepColor1,
      title: "Касса",
      price: "42 310 P",
      image: AppImages.bankNote,
    ),
    DataModel(
      color: AppColors.deepColor,
      title: "Продано",
      price: "120",
      image: AppImages.shoppingBag,
    ),
    DataModel(
      color: AppColors.deepColor2,
      title: "Прибыль",
      price: "+32 000",
      image: AppImages.coinsStacked,
    ),
    DataModel(
      color: AppColors.deepColor3,
      title: "Расходы",
      price: "-2400",
      image: AppImages.receipt,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              AppBarData(
                title: 'Торговая точка',
                subTitle: 'Проход 456а',
                icon: Icons.keyboard_arrow_right_outlined,
                image: 'assets/icons/bell-04.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondScreen()));
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomChip(
                    title: labels[0],
                    onSelected: (isSelected) {
                      selectedIndex = 0;
                      setState(() {});
                    },
                    isSelected: selectedIndex == 0,
                  ),
                  CustomChip(
                    title: labels[1],
                    onSelected: (isSelected) {
                      selectedIndex = 1;
                      setState(() {});
                    },
                    isSelected: selectedIndex == 1,
                  ),
                  CustomChip(
                    title: labels[2],
                    onSelected: (isSelected) {
                      selectedIndex = 2;
                      setState(() {});
                    },
                    isSelected: selectedIndex == 2,
                  ),
                  const Text(
                    "Календарь",
                    style: TextStyle(color: AppColors.blueColor),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 8.h,
              // ),
              Column(
                children: [
                  Row(
                    children: [
                      CardDataWidget(
                          title: data[0].title,
                          price: data[0].price,
                          image: data[0].image,
                          color: data[0].color),
                      CardDataWidget(
                          title: data[1].title,
                          price: data[1].price,
                          image: data[1].image,
                          color: data[1].color),
                    ],
                  ),
                  Row(
                    children: [
                      CardDataWidget(
                          title: data[2].title,
                          price: data[2].price,
                          image: data[2].image,
                          color: data[2].color),
                      CardDataWidget(
                          title: data[3].title,
                          price: data[3].price,
                          image: data[3].image,
                          color: data[3].color),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffF6F7F9)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ExpensesWidget(
                      expensesTitle: 'История\nпродаж',
                      image: AppImages.calendar,
                      onPressed: () {},
                    ),
                    ExpensesWidget(
                      expensesTitle: 'Список\nдолжников',
                      image: AppImages.usersList,
                      onPressed: () {},
                    ),
                    ExpensesWidget(
                      expensesTitle: 'Мои\nрасходы',
                      image: AppImages.filePlus,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Container(
                    width: 167.5.w,
                    height: 92.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff4A72FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/icons/plus-circle.png",
                              width: 24.w,
                            )),
                        Text(
                          "Добавить",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    width: 167.5.w,
                    height: 92.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff1DB469),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/icons/package-plus.png",
                              width: 24.w,
                            )),
                        Text(
                          "Продать",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}
