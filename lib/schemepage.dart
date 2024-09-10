import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
    // Define media query data to access screen size
    final mediaQuery = MediaQuery.of(context);

    // Define responsive font size based on screen width
    double fontSize = mediaQuery.size.width * 0.03;
    // Define responsive container height
    double containerHeight = mediaQuery.size.height * 0.25;
    // Define responsive text weight
    FontWeight fontWeight = FontWeight.bold;

    return BlocProvider(
      create: (_) =>
          SubcategoryCubit()..loadSubcategories(selectedCategory!.id),
      child: BlocBuilder<SubcategoryCubit, SubcategoryState>(
        builder: (context, state) {
          if (state is SubcategoriesLoaded) {
            final subcategories = state.subcategories;
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
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: mediaQuery.size.height * 0.03),
                        child: Container(
                          height: mediaQuery.size.height * 0.1,
                          width: mediaQuery.size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  context
                                      .read<CategoryCubit>()
                                      .loadCategories();
                                },
                              ),
                              Container(
                                height: mediaQuery.size.height * 0.07,
                                width: mediaQuery.size.width * 0.14,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage(selectedCategory!.imagePath),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(width: mediaQuery.size.width * 0.02),
                              Container(
                                width: mediaQuery.size.width * 0.7,
                                child: Text(
                                  selectedCategory!.name.toString(),
                                  style: GoogleFonts.leagueSpartan(
                                      fontSize: fontSize * 2,
                                      fontWeight: fontWeight),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Colors.white),
                        width: mediaQuery.size.width,
                        height: mediaQuery.size.height -
                            mediaQuery.size.height * 0.15,
                        child: ListView.builder(
                          itemCount: subcategories.length,
                          itemBuilder: (context, index) {
                            final subcategory = subcategories[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: mediaQuery.size.width * 0.04,
                                  left: mediaQuery.size.width * 0.04,
                                  bottom: mediaQuery.size.height * 0.03),
                              child: Container(
                                height: containerHeight,
                                width: mediaQuery.size.width,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            mediaQuery.size.width * 0.04)),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    Container(
                                      height: containerHeight * 0.60,
                                      width: mediaQuery.size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                mediaQuery.size.width * 0.04),
                                            topRight: Radius.circular(
                                                mediaQuery.size.width * 0.04)),
                                        image: DecorationImage(
                                          image: AssetImage(subcategory.image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        subcategory.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.leagueSpartan(
                                            fontSize: fontSize * 1.5,
                                            fontWeight: fontWeight),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SubcategoryDescriptionScreen(
                                              subcategory: subcategory,
                                              selectedCategory:
                                                  selectedCategory!,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: containerHeight * 0.13,
                                        width: mediaQuery.size.width * 0.8,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    mediaQuery.size.width *
                                                        0.02)),
                                            color: Color.fromRGBO(
                                                249, 208, 216, 1)),
                                        child: Center(
                                          child: Text("More Info",
                                              style: GoogleFonts.lato(
                                                fontSize: fontSize * 0.8,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is SubcategoryError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Subcategories',
                    style: GoogleFonts.leagueSpartan(
                        fontSize: fontSize * 1.5, fontWeight: fontWeight)),
              ),
              body: Center(
                child: Column(
                  children: [
                    Text('Error loading subcategories: ${state.errorMessage}',
                        style: GoogleFonts.leagueSpartan(
                            fontSize: fontSize * 0.8, fontWeight: fontWeight)),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Subcategories',
                    style: GoogleFonts.leagueSpartan(
                        fontSize: fontSize * 1.5, fontWeight: fontWeight)),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
