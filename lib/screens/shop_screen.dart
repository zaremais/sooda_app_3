import 'package:flutter/material.dart';
import 'package:flutter_sooda_app/screens/home_screen.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: const Center(
        child: Text(
          "Shop",
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.w500, color: Colors.purple),
        ),
      ),
    );
  }
}
