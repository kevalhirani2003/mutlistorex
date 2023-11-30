import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define the Category class (replace with your actual Category class)

// Define the events
abstract class SubcategoryEvent {}

class LoadSubcategories extends SubcategoryEvent {
  final String categoryId;

  LoadSubcategories(this.categoryId);
}

// Define the states
abstract class SubcategoryState {}

class SubcategoriesLoaded extends SubcategoryState {
  final List<Subcategory> subcategories;

  SubcategoriesLoaded(this.subcategories);
}

class SubcategoryLoading extends SubcategoryState {}

class SubcategoryError extends SubcategoryState {
  final String errorMessage;

  SubcategoryError(this.errorMessage);
}

// Define the Subcategory class (replace with your actual Subcategory class)
class Subcategory {
  final String name;
  final String description;
  final String imagePath;
  final double price;

  Subcategory(
    this.name,
    this.description,
    this.imagePath,
    this.price,
  );
}

// Define the SubcategoryCubit
class SubcategoryCubit extends Cubit<SubcategoryState> {
  SubcategoryCubit() : super(SubcategoryLoading());

  void loadSubcategories(String categoryId) async {
    try {
      // Load JSON data from your file (adjust the path as needed)
      final jsonString =
          await rootBundle.loadString("Assets/json/Category.json");
      final data = jsonDecode(jsonString);

      // Retrieve the list of categories from the JSON data
      final List<dynamic> categoryList = data['categories'];

      // Find the matching category by ID
      final categoryData = categoryList.firstWhere(
        (category) => category['id'].toString() == categoryId,
        orElse: () => null,
      );

      if (categoryData != null) {
        // Extract and parse subcategories for the matching category
        final subcategoryList = categoryData['subcategories'] as List<dynamic>;
        final subcategories = subcategoryList.map((subcategoryData) {
          return Subcategory(
              subcategoryData['name'] ?? '',
              subcategoryData['description'] ?? '',
              subcategoryData['imagePath'] ?? '',
              subcategoryData["price"]);
        }).toList();

        emit(SubcategoriesLoaded(subcategories));
      } else {
        emit(SubcategoryError('Category not found'));
      }
    } catch (e) {
      emit(SubcategoryError('Failed to load subcategories: $e'));
    }
  }
}
