import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenwings/provider.dart';
import 'package:womenwings/subcategories.dart';
import 'package:womenwings/subcategorydescriptionscreen.dart';

class SubcategoryScreen extends StatelessWidget {
  final Category? selectedCategory;

  const SubcategoryScreen({
    super.key,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          SubcategoryCubit()..loadSubcategories(selectedCategory!.id),
      child: BlocBuilder<SubcategoryCubit, SubcategoryState>(
        builder: (context, state) {
          if (state is SubcategoriesLoaded) {
            final subcategories = state.subcategories;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFFF6D1D7),

                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<CategoryCubit>().loadCategories();
                  },
                ),
                title: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(selectedCategory!.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(selectedCategory!.name.toString()),
                  ],
                ), // Ensure name is a string
              ),
              body: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                child: ListView.builder(
                  itemCount: subcategories.length,
                  itemBuilder: (context, index) {
                    final subcategory = subcategories[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: Colors.grey[200]),
                        child: Column(
                          children: [
                            Text(
                              subcategory.name,
                              textAlign: TextAlign.center,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SubcategoryDescriptionScreen(
                                      subcategory: subcategory,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                color: Colors.blue,
                                child: const Text("More Info"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (state is SubcategoryError) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Subcategories'),
              ),
              body: Center(
                child: Column(
                  children: [
                    Text('Error loading subcategories: ${state.errorMessage}'),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Subcategories'),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
