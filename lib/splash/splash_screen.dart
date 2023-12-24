import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sooda_app/constants/images.dart';
import 'package:flutter_sooda_app/widgets/nav_bottom_widget.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    routing();
    super.initState();
  }

  Future<void> routing() async {
    await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
    // ignore: use_build_context_synchronously
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NavBottomWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.splashScreen,
          width: 100.w,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
