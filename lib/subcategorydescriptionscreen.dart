import 'package:flutter/material.dart';
import 'package:womenwings/subcategories.dart';
import 'package:womenwings/try.dart';

class SubcategoryDescriptionScreen extends StatelessWidget {
  final Subcategory subcategory;

  const SubcategoryDescriptionScreen({super.key, required this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subcategory.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(subcategory.description),
              const SizedBox(height: 16),
              const Text(
                'Beneficiaries:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(subcategory.beneficiaries.toString()),
              const SizedBox(height: 16),
              const Text(
                'Target Sectors:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormatter.formatTargetSectors(subcategory.targetSectors),
              const SizedBox(height: 16),
              const Text(
                'Eligibility Criteria:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(subcategory.eligibilityCriteria),
              const SizedBox(height: 16),
              const Text(
                'Application Process:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(subcategory.applicationProcess),
              const SizedBox(height: 16),
              const Text(
                'Documents Required:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(subcategory.documentsRequired),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
