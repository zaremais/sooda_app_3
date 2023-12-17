import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sooda_app/constants/colors.dart';
import 'package:flutter_sooda_app/screens/first_screen.dart';
import 'package:flutter_sooda_app/screens/product_screen.dart';
import 'package:flutter_sooda_app/screens/shop_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    const FirstScreen(),
    const ProductScreen(),
    const ShopScreen(),
    // SecondScreen(),
    // ThirdScreen(),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
           type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedItemColor: AppColors.primaryColor,
          // unselectedItemColor: AppColors.amberColor,
          onTap: (val) {
            currentIndex = val;
            setState(() {
              currentIndex = val;
            });
          },
          
          items: [
            BottomNavigationBarItem(

              icon: Image.asset(
                "assets/icons/home-01.png",
                width: 24.w,
              ),
              label: "Главная", 
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/shopping-cart-03.png",
                   width: 24.w,
                ),
                label: "Товары"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/marker-pin-02.png",
                  width: 24.w,
                ),
                label: "Магазин"),
         
          ]),
    );
  }
}