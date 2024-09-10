import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormatter {
  static Widget formatTargetSectors(String inputText) {
    // Split the input text into lines
    final lines = inputText.split('\n');

    // Process each line separately and create a list of Widgets
    final formattedWidgets = <Widget>[];
    for (final line in lines) {
      final colonIndex = line.indexOf(':');
      if (colonIndex != -1) {
        final beforeColon = line.substring(0, colonIndex).trim();
        final afterColon = line.substring(colonIndex + 1).trim();

        final formattedLine = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$beforeColon:',
              style: GoogleFonts.leagueSpartan(
                fontSize: 13,
                letterSpacing: 0.1,
                height: 1.2,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "$afterColon\n",
              style: GoogleFonts.leagueSpartan(
                fontSize: 13,
                letterSpacing: 0.001,
                height: 1.2,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify, // Align text to the beginning
            ),
          ],
        );
        formattedWidgets.add(formattedLine);
      } else {
        formattedWidgets.add(
          Text(
            line,
            textAlign: TextAlign.justify, // Align text to the beginning
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: formattedWidgets,
    );
  }
}
