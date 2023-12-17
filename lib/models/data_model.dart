import 'package:flutter/material.dart';

class DataModel {
  final String title;
  final String price;
  final Color color;
  final String image;

  DataModel(
      {required this.title,
      required this.price,
      required this.color,
      required this.image});
}