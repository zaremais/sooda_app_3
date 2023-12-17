import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sooda_app/screens/home_screen.dart';
import 'package:flutter_sooda_app/screens/item_screen.dart';
import 'package:flutter_sooda_app/splash/splash_screen.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,

          routes: {
            "/":(context)=>const SplashScreen(),
            "homeScreen": (context) => const HomeScreen(),
            "itemScreen": (context)=> const ItemScreen(),
          },
        ));
  }
}
