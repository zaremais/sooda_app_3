import 'package:flutter/material.dart';
import 'package:flutter_sooda_app/screens/home_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const Center(
        child: Text(
          "Product",
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.w500, color: Colors.purple),
        ),
      ),
    );
  }
}
