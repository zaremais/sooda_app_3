import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sooda_app/constants/images.dart';
import 'package:flutter_sooda_app/screens/shop_screen.dart';
import 'package:flutter_sooda_app/widgets/card_info_product.dart';
import 'package:flutter_sooda_app/widgets/custom_product_chip.dart';
import 'package:flutter_sooda_app/widgets/nav_bottom_widget.dart';
import 'package:flutter_sooda_app/widgets/text_form_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: const Color(0xff1C222B),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavBottomWidget()));
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
                  ...labels
                      .map(
                        (e) => CustomProductChip(
                          title: e,
                          isSelected: e == selectedLabel,
                          onSelected: ((p0) {
                            setState(() {
                              selectedLabel = e;
                            });
                          }),
                        ),
                      )
                      ,
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
                                    builder: (context) => const ShopScreen()));
                          },
                          child: CardInfoProduct(image: products[index])),
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
