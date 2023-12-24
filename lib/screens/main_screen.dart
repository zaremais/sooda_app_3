import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sooda_app/constants/colors.dart';
import 'package:flutter_sooda_app/constants/images.dart';
import 'package:flutter_sooda_app/models/data_model.dart';
import 'package:flutter_sooda_app/screens/product_screen.dart';
import 'package:flutter_sooda_app/widgets/expenses.dart';
import 'package:flutter_sooda_app/widgets/card_data.dart';
import 'package:flutter_sooda_app/widgets/custom_chip.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  late bool showCartBadge;
  late String selectedLabel = labels.first;
  int cartItemNO = 2;

  List<Widget> screens = [const MainScreen()];
  List<String> labels = ['Сегодня', '7 дней', 'Месяц'];
  List<DataModel> data = [
    DataModel(
      color: AppColors.deepColor1,
      title: 'Касса',
      price: '42 310 P',
      image: AppImages.bankNote,
    ),
    DataModel(
      color: AppColors.deepColor,
      title: 'Продано',
      price: '120',
      image: AppImages.shoppingBag,
    ),
    DataModel(
      color: AppColors.deepColor2,
      title: 'Прибыль',
      price: '+32 000',
      image: AppImages.coinsStacked,
    ),
    DataModel(
      color: AppColors.deepColor3,
      title: 'Расходы',
      price: '-2400',
      image: AppImages.receipt,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 135.w,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Торговая точка',
                style: GoogleFonts.nunitoSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff51637B)),
              ),
              Text(
                'Проход 456а',
                style: GoogleFonts.nunitoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff1C222B)),
              )
            ],
          ),
        ),
        title: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductScreen()));
          },
          icon: const Padding(
            padding: EdgeInsets.only(top: 14),
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 24,
              color: Color(0xff4A72FF),
            ),
          ),
        ),
        titleSpacing: -20,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 16),
            child: badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.red,
              ),
              position: badges.BadgePosition.topEnd(top: -12, end: 6),
              badgeContent: Text(
                '$cartItemNO',
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
                  AppImages.bell,
                  width: 24.w,
                  color: const Color(0xff1C222B),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...labels
                    .map((e) => CustomChip(
                          title: e,
                          isSelected: e == selectedLabel,
                          onSelected: ((p0) {
                            setState(() {
                              selectedLabel = e;
                            });
                          }),
                        ))
                    ,
                const Text(
                  'Календарь',
                  style: TextStyle(color: AppColors.blueColor),
                ),
              ],
            ),
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
                           AppImages.plusCircle,
                            width: 24.w,
                          )),
                      Text(
                        'Добавить',
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
                            AppImages.packagePlus,
                            width: 24.w,
                          )),
                      Text(
                        'Продать',
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
    );
  }
}
