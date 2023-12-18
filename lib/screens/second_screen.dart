import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sooda_app/screens/third_screen.dart';
import 'package:flutter_sooda_app/widgets/app_bar_product.dart';
import 'package:flutter_sooda_app/widgets/card_info_product.dart';
import 'package:flutter_sooda_app/widgets/custom_product_chip.dart';
import 'package:flutter_sooda_app/widgets/text_form_widget.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarProduct(context),
      body: Column(children: [
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
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ThirdScreen()));
                          },
                          child: CardInfoProduct(nameImage: products[index])),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
