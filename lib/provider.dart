import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

// Define your Category and Subcategory classes here

// Define the events
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

// Define the cubit
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  String? selectedCategoryId; // Store the selected category's ID

  Future<void> loadCategories() async {
    try {
      // Load JSON data from your file (adjust the path as needed)
      final jsonString = await rootBundle.loadString("json/scheme.json");
      final data = jsonDecode(jsonString);

      final List<dynamic> categoryList = data['categories'];

      final categories = categoryList.map((categoryData) {
        final List<dynamic> subcategoryList = categoryData['subcategories'];

        final subcategories = subcategoryList.map((subcategoryData) {
          return Subcategory(
            subcategoryData['name'] ?? '',
            subcategoryData['description'] ?? '',
            subcategoryData['beneficiaries'] ?? '',
            subcategoryData['targetSectors'] ?? '',
            subcategoryData['eligibilityCriteria'] ?? '',
            subcategoryData['applicationProcess'] ?? '',
            subcategoryData['documentsRequired'] ?? '',
            subcategoryData['schemeExplanation'] ?? '',
          );
        }).toList();

        final imagePath = categoryData['imagespath'] ?? '';

        return Category(
          categoryData['id']?.toString() ?? '', // Add the ID property
          categoryData['name'] ?? '',
          subcategories,
          imagePath,
        );
      }).toList();

      emit(CategoriesLoaded(categories));
    } catch (e) {
      // Handle errors here
      print('Error loading categories: $e');
      emit(CategoriesLoaded([])); // Emit an empty list in case of an error
    }
  }

  void setSelectedCategory(String categoryId) {
    selectedCategoryId = categoryId;
    emit(CategorySelected(selectedCategoryId));
  }
}

class Category {
  final String id;
  final String name;
  final List<Subcategory> subcategories;
  final String imagePath;

  Category(this.id, this.name, this.subcategories, this.imagePath);
}

class Subcategory {
  final String name;
  final String description;
  final String beneficiaries;
  final String targetSectors;
  final String eligibilityCriteria;
  final String applicationProcess;
  final String documentsRequired;
  final String schemeExplanation;

  Subcategory(
    this.name,
    this.description,
    this.beneficiaries,
    this.targetSectors,
    this.eligibilityCriteria,
    this.applicationProcess,
    this.documentsRequired,
    this.schemeExplanation,
  );
}
