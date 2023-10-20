import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:womenwings/provider.dart';
import 'package:womenwings/subcategories.dart';
import 'package:womenwings/try.dart'; // Replace with your import path for Subcategory and Category

class SubcategoryDescriptionScreen extends StatelessWidget {
  final Subcategory subcategory;
  final Category selectedCategory;

  const SubcategoryDescriptionScreen({
    Key? key,
    required this.subcategory,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // Define responsive font size based on screen width
    double fontSize = mediaQuery.size.width * 0.03;
    // Define responsive container height
    double containerHeight = mediaQuery.size.height * 0.25;
    // Define responsive text weight
    FontWeight fontWeight = FontWeight.bold;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF6D1D7), // #F6D1D7
                Color(0xFFF3D6D6), // #F3D6D6
                Color(0xFFEDDCD8), // #EDDCD8
                Color(0xFFEBDFDA), // #EBDFDA
                Color(0xFFE8E0DC), // #E8E0DC
                Color(0xFFE0E6E2), // #E0E6E2
                Color(0xFFDDE7E6), // #DDE7E6
                Color(0xFFD8EAEA), // #D8EAEA
                Color(0xFFCDEDF2), // #CDEDF2
                Color(0xFFCCEEF2), // #CCEEF2
                Color(0xFFC4EFF9), // #C4EFF9
                Color(0xFFC2EDFC), // #C2EDFC
                Color(0xFFC2E9FD), // #C2E9FD
                Color(0xFFC4E8FD), // #C4E8FD
                Color(0xFFC7E1FE), // #C7E1FE
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: mediaQuery.size.height * 0.03),
                child: Container(
                  height: mediaQuery.size.height * 0.1,
                  width: mediaQuery.size.width,
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Container(
                          height: mediaQuery.size.height * 0.07,
                          width: mediaQuery.size.width * 0.14,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(selectedCategory.imagePath),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          // Wrap this section with Expanded
                          child: Column(
                            children: [
                              SizedBox(
                                height: mediaQuery.size.height * 0.045,
                              ),
                              Container(
                                child: Text(
                                  selectedCategory.name.toString(),
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: fontSize * 2,
                                    fontWeight: fontWeight,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromRGBO(253, 216, 174, 1)),
                          child: Center(
                            child: Text(
                              subcategory.name,
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 15,
                                fontWeight: fontWeight,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                ),
                              ],
                              color: Color.fromRGBO(246, 236, 236, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  subcategory.name + ":-",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  subcategory.description,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 132, 174, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: mediaQuery.size.height * 0.025,
                                  width: 140,
                                  child: const Text(
                                    'Beneficiaries:-',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  subcategory.beneficiaries.toString(),
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 132, 174, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: mediaQuery.size.height * 0.025,
                                  width: 170,
                                  child: const Text(
                                    'Target Sectors:-',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextFormatter.formatTargetSectors(
                                  subcategory.targetSectors.toString(),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Eligibility Criteria:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                    subcategory.eligibilityCriteria.toString()),
                                const SizedBox(height: 16),
                                const Text(
                                  'Application Process:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(subcategory.applicationProcess.toString()),
                                const SizedBox(height: 16),
                                const Text(
                                  'Documents Required:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(subcategory.documentsRequired.toString()),
                                const SizedBox(height: 16),
                                const Text(
                                  'Implementation:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(subcategory.implementation.toString()),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
