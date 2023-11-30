// Define your Category and Subcategory classes here

// Define the events
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CategoryEvent {}

class LoadCategories extends CategoryEvent {}

// Define the states
abstract class CategoryState {}

class CategoriesLoaded extends CategoryState {
  final List<Category> categories;

  CategoriesLoaded(this.categories);
}

class CategorySelected extends CategoryState {
  final String? selectedCategoryId;

  CategorySelected(this.selectedCategoryId);
}

class CategoryInitial extends CategoryState {}

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  String? selectedCategoryId; // Store the selected category's ID

  Future<void> loadCategoriesforcategoriesscreen() async {
    try {
      // Load JSON data from your file (adjust the path as needed)
      final jsonString =
          await rootBundle.loadString("Assets/json/Category.json");

      final data = jsonDecode(jsonString);

      final List<dynamic> categoryList = data['categories'];

      final categories = categoryList.map((categoryData) {
        final imagePath = categoryData['imagePath'] ?? '';

        return Category(
          categoryData['id']?.toString() ?? '', // Add the ID property
          categoryData['name'] ?? '',
          imagePath,
        );
      }).toList();

      emit(CategoriesLoaded(categories));
      print(categories);
    } catch (e) {
      // Handle errors here
      print('Error loading categories: $e');
      emit(CategoriesLoaded([])); // Emit an empty list in case of an error
    }
  }

  void setSelectedCategory(String categoryId) {
    selectedCategoryId = categoryId;
    // emit(CategorySelected(selectedCategoryId));
  }
}

class Category {
  final String id;
  final String name;
  final String imagePath;
  Category(this.id, this.name, this.imagePath);
}
