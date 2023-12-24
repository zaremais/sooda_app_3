import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sooda_app/constants/colors.dart';
import 'package:flutter_sooda_app/screens/main_screen.dart';
import 'package:flutter_sooda_app/screens/product_screen.dart';
import 'package:flutter_sooda_app/screens/shop_screen.dart';

class NavBottomWidget extends StatefulWidget {
  const NavBottomWidget({super.key});

  @override
  State<NavBottomWidget> createState() => _NavBottomWidgetState();
}

class _NavBottomWidgetState extends State<NavBottomWidget> {
  int currentIndex = 0;

  List<Widget> screens = [
    const MainScreen(),
    const ProductScreen(),
    const ShopScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedItemColor: AppColors.primaryColor,
          onTap: (val) {
            currentIndex = val;
            setState(() {
              currentIndex = val;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home-01.png',
                width: 24.w,
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/shopping-cart-03.png',
                  width: 24.w,
                ),
                label: 'Товары'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/marker-pin-02.png',
                  width: 24.w,
                ),
                label: 'Магазин'),
          ]),
    );
  }
}
