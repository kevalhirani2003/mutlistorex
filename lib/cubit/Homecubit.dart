import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

// Define your Category and Subcategory classes here

// Define the events
abstract class HomeEvent {}

class LoadCategoriesforHomepage extends HomeEvent {}

// Define the states
abstract class HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeCategory> categories;

  HomeLoaded(this.categories);
}

class HomeInitial extends HomeState {}

// Define the cubit
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  String? selectedCategoryId; // Store the selected category's ID

  Future<void> LoadCategoriesforHomepage() async {
    try {
      // Load JSON data from your file (adjust the path as needed)
      final jsonString = await rootBundle.loadString("Assets/json/Home.json");

      final data = jsonDecode(jsonString);
      final List<dynamic> categoryList = data['categories'];
      final homecategories = categoryList.map((categoryData) {
        final imagePath = categoryData['imagePath'] ?? '';

        return HomeCategory(
          categoryData['imageName'] ?? '',
          imagePath,
        );
      }).toList();

      emit(HomeLoaded(homecategories));
    } catch (e) {
      // Handle errors here
      print('Error loading categories: $e');
      emit(HomeLoaded([])); // Emit an empty list in case of an error
    }
  }
}

class HomeCategory {
  final String name;
  final String imagePath;

  HomeCategory(this.name, this.imagePath);
}
