import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import "dart:async";

import 'package:womenwings/mainpage.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF27B1B2),
      body: Container(
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
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                        height: size.height,
                        width: size.width * 0.5,
                        alignment: Alignment.center,
                        child: Image.asset("assets/logo.png")),
                    Positioned(
                      bottom: size.height * 0.36,
                      left: size.width * 0.1,
                      child: Container(
                        child: Text("WomenWings",
                            style: GoogleFonts.mrDafoe(fontSize: 25)),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.9,
                      child: Container(
                        child: Text(
                          "\"Strong Women, Strong World\"",
                          style: GoogleFonts.barlow(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
