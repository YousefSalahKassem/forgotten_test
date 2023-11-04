import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forgotten_test/home/providers/category_provider.dart';

class ProductProvider extends ChangeNotifier {
  final CategoryProvider categoryProvider;
  static final provider = ChangeNotifierProvider((ref) =>
      ProductProvider(categoryProvider: ref.watch(CategoryProvider.provider)));

  ProductProvider({required this.categoryProvider}){
    updateProducts();
  }

  final Map<String, String> products = {};
  final productDetailsMap = {
    "Cars": {
      "CarProduct1": "Car Product 1 Details",
      "CarProduct2": "Car Product 2 Details",
      "CarProduct3": "Car Product 3 Details",
    },
    "Electronics": {
      "ElectronicProduct1": "Electronic Product 1 Details",
      "ElectronicProduct2": "Electronic Product 2 Details",
      "ElectronicProduct3": "Electronic Product 3 Details",
    },
  };


  void updateProducts() {
    products.clear();

    final selectedCategory = categoryProvider.selectedCategory;
      final selectedCategoryTitle = selectedCategory.title;
      final productDetails = productDetailsMap[selectedCategoryTitle];

      if (productDetails != null) {
        products.addAll(productDetails);
      }


    notifyListeners();
  }
}
