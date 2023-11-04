import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forgotten_test/home/model/category.dart';

class CategoryProvider extends ChangeNotifier {
  static final provider = ChangeNotifierProvider<CategoryProvider>((ref) {
    return CategoryProvider();
  });
  static List<Category> mockCategories = [
    Category.createCategory("Cars"),
    Category.createCategory("Electronics"),
  ];

  static Category _selectedCategory = mockCategories.first;

  Category get selectedCategory => _selectedCategory;

  set selectedCategory(Category category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
