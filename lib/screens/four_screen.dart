import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FourScreen extends StatefulWidget {
  const FourScreen({super.key});

  @override
  State<FourScreen> createState() => _FourScreenState();
}

class _FourScreenState extends State<FourScreen> {
  List<String> products = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < products.length; i++)
              Center(
                  child: Image.asset(
                products[i],
                width: 100.w,
              ))
          ],
        ));
  }
}
