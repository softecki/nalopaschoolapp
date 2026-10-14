import 'package:flutter/material.dart';
import 'package:dodomaapp/src/model/recommended_product.dart';
import 'package:dodomaapp/src/model/bottom_nav_bar_item.dart';

import 'app_color.dart';

class AppData {
  const AppData._();

  static String url = "https://nalopaschool.softecki.com/api";
  static String School_name = "Nalopa School";


  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static const Color lightOrangeColor = Color(0xFF4AB024);

  static List<BottomNavBarItem> bottomNavBarItems = [
    const BottomNavBarItem(
      "Home",
      Icon(Icons.home),
    ),
    const BottomNavBarItem(
      "Favorite",
      Icon(Icons.favorite),
    ),
    const BottomNavBarItem(
      "Cart",
      Icon(Icons.shopping_cart),
    ),
    const BottomNavBarItem(
      "Add",
      Icon(Icons.add_box_outlined),
    ),
    const BottomNavBarItem(
      "Profile",
      Icon(Icons.person),
    ),
  ];

  static List<RecommendedProduct> recommendedProducts = [
    RecommendedProduct(
      cardBackgroundColor:  AppColor.primaryColor,
    ),
  ];
}
