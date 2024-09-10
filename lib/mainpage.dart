import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:womenwings/provider.dart';
import 'package:womenwings/schemepage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Category? selectedCategory;
  Future<void>? loadingCategories; // Track loading state

  // Custom function to calculate responsive font sizes
  double fontSize(double size) {
    return size * MediaQuery.of(context).textScaleFactor;
  }

  // Custom function to calculate responsive sizes
  double responsiveSize(double size) {
    return size * MediaQuery.of(context).size.width / 375.0;
  }

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      loadingCategories = context.read<CategoryCubit>().loadCategories();
      await loadingCategories; // Wait for the categories to load
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: loadingCategories ?? loadCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Handle errors
            return Center(
              child: Text('Error loading categories: ${snapshot.error}'),
            );
          } else {
            if (context.watch<CategoryCubit>().state is CategoriesLoaded) {
              final categories =
                  (context.watch<CategoryCubit>().state as CategoriesLoaded)
                      .categories;
              for (final category in categories) {
                print(
                    "Category: ${category.name}, Image Path: ${category.imagePath}");
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: responsiveSize(10),
                              ),
                              Image.asset("assets/logo.png",
                                  height: responsiveSize(70)),
                              SizedBox(width: responsiveSize(20)),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("WomenWings",
                                      style: GoogleFonts.mrDafoe(
                                          fontSize: fontSize(25))),
                                  Text(
                                    "\"Strong Women, Strong World\"",
                                    style: GoogleFonts.barlow(
                                      fontSize: fontSize(13),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
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
                                  topLeft: Radius.circular(responsiveSize(20)),
                                  topRight: Radius.circular(responsiveSize(20)),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: responsiveSize(2),
                                  left: responsiveSize(20),
                                  right: responsiveSize(20),
                                ),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: responsiveSize(20),
                                    mainAxisSpacing: responsiveSize(20),
                                    childAspectRatio: 0.78,
                                  ),
                                  itemCount: categories.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final category = categories[index];
                                    return GestureDetector(
                                      onTap: () {
                                        context
                                            .read<CategoryCubit>()
                                            .setSelectedCategory(category.id);
                                        selectedCategory = category;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SubcategoryScreen(
                                              selectedCategory:
                                                  selectedCategory,
                                            ),
                                          ),
                                        ).then((value) => setState(() {
                                              loadingCategories = null;
                                            }));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              responsiveSize(20)),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                responsiveSize(20)),
                                            color: Color(0xFFEEDCD8),
                                          ),
                                          margin: EdgeInsets.all(
                                              responsiveSize(10)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Container(
                                                  height: responsiveSize(100),
                                                  width: responsiveSize(100),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          category.imagePath),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  category.name,
                                                  style:
                                                      GoogleFonts.leagueSpartan(
                                                    fontSize: fontSize(20),
                                                    height: 1,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              SizedBox(
                                                  height: responsiveSize(10)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
      ),
    );
  }
}
