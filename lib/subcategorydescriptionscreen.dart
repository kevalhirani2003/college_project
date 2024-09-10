import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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
    double fontSize(BuildContext context, double size) {
      return size * MediaQuery.of(context).textScaleFactor;
    }

    double containerHeight(BuildContext context) {
      return MediaQuery.of(context).size.height;
    }

    double containerWidth(BuildContext context) {
      return MediaQuery.of(context).size.width;
    }

    FontWeight fontWeight = FontWeight.bold;
    Future<void> launchUrlStart({required String url}) async {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: containerHeight(context),
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
                padding: EdgeInsets.only(top: containerHeight(context) * 0.03),
                child: Container(
                  height: containerHeight(context) * 0.1,
                  width: containerWidth(context),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.read<CategoryCubit>().loadCategories();
                        },
                      ),
                      Container(
                        height: containerHeight(context) * 0.07,
                        width: containerWidth(context) * 0.14,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(selectedCategory.imagePath),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width: containerWidth(context) * 0.02),
                      Container(
                        width: containerWidth(context) * 0.7,
                        child: Text(
                          selectedCategory.name.toString(),
                          style: GoogleFonts.leagueSpartan(
                              fontSize: fontSize(context, 21),
                              fontWeight: fontWeight),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
                          height: containerHeight(context) * 0.015,
                        ),
                        Container(
                          height: containerHeight(context) * 0.24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(subcategory.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: containerHeight(context) * 0.017,
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
                            padding:
                                EdgeInsets.all(containerWidth(context) * 0.06),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  subcategory.name + ":-",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: fontSize(context, 13),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  subcategory.description,
                                  style: GoogleFonts.leagueSpartan(
                                    letterSpacing: 0.1,
                                    height: 1.2,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.02),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 132, 174, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: containerHeight(context) * 0.035,
                                  width: containerHeight(context) * 0.2,
                                  child: Center(
                                    child: Text(
                                      'Beneficiaries:-',
                                      style: GoogleFonts.leagueSpartan(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.01),
                                Text(
                                  subcategory.beneficiaries,
                                  style: GoogleFonts.leagueSpartan(
                                    letterSpacing: 0.1,
                                    height: 1.2,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.02),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 132, 174, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: containerHeight(context) * 0.035,
                                  width: containerHeight(context) * 0.2,
                                  child: Center(
                                    child: Text(
                                      'Target Sectors:-',
                                      style: GoogleFonts.leagueSpartan(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextFormatter.formatTargetSectors(
                                  subcategory.targetSectors.toString(),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 132, 174, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: containerHeight(context) * 0.035,
                                  width: containerHeight(context) * 0.2,
                                  child: Center(
                                    child: Text(
                                      'Eligibility Criteria:-',
                                      style: GoogleFonts.leagueSpartan(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.01),
                                Text(
                                  subcategory.eligibilityCriteria,
                                  style: GoogleFonts.leagueSpartan(
                                    letterSpacing: 0.1,
                                    height: 1.2,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.02),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 132, 174, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: containerHeight(context) * 0.035,
                                  width: containerHeight(context) * 0.2,
                                  child: Center(
                                    child: Text(
                                      'Application Process:-',
                                      style: GoogleFonts.leagueSpartan(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.01),
                                Text(
                                  subcategory.applicationProcess,
                                  style: GoogleFonts.leagueSpartan(
                                    letterSpacing: 0.1,
                                    height: 1.2,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.02),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 132, 174, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: containerHeight(context) * 0.035,
                                  width: containerHeight(context) * 0.2,
                                  child: Center(
                                    child: Text(
                                      'Documents Required:-',
                                      style: GoogleFonts.leagueSpartan(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.01),
                                Text(
                                  subcategory.documentsRequired,
                                  style: GoogleFonts.leagueSpartan(
                                    letterSpacing: 0.1,
                                    height: 1.2,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.02),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 132, 174, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: containerHeight(context) * 0.035,
                                  width: containerHeight(context) * 0.2,
                                  child: Center(
                                    child: Text(
                                      'Implementation:-',
                                      style: GoogleFonts.leagueSpartan(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.01),
                                Text(
                                  subcategory.implementation,
                                  style: GoogleFonts.leagueSpartan(
                                    letterSpacing: 0.1,
                                    height: 1.2,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.04),
                                Center(
                                  child: Text(
                                    "URL to the Schemes Web Site",
                                    style: GoogleFonts.leagueSpartan(
                                      fontSize: fontSize(context, 13),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: containerHeight(context) * 0.01),
                                GestureDetector(
                                  onTap: () {
                                    launchUrlStart(url: subcategory.urladdress);
                                  },
                                  child: Center(
                                    child: Container(
                                      width: containerWidth(context) * 0.6,
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        subcategory.urladdress,
                                        style: GoogleFonts.leagueSpartan(
                                          decorationColor: Color(0xFFFF0000),
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFFFF0000),
                                          fontSize: fontSize(context, 13),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
