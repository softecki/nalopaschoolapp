import 'package:dodomaapp/src/model/recommended_product.dart';

import 'app_color.dart';

class AppData {
  const AppData._();

  static String url = "https://nalopaschool.softecki.com/api";
  static String School_name = "Nalopa School";

  static List<RecommendedProduct> recommendedProducts = [
    RecommendedProduct(
      cardBackgroundColor:  AppColor.primaryColor,
    ),
  ];
}
