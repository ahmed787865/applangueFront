import 'package:flutter/material.dart';

class ShopCategory {
  String title;
  IconData icon;

  ShopCategory({required this.title, required this.icon});
}

class HomeCategory {
  String title;
  String image;
  bool isOpen;

  HomeCategory({required this.title, required this.image, this.isOpen = false});
}
