import 'package:flutter/material.dart';

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
              '$beforeColon-',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              afterColon,
              textAlign: TextAlign.start, // Align text to the beginning
            ),
          ],
        );
        formattedWidgets.add(formattedLine);
      } else {
        formattedWidgets.add(
          Text(
            line,
            textAlign: TextAlign.start, // Align text to the beginning
          ),
        );
      }
    }

    // Create a Column to display the formatted widgets
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: formattedWidgets,
    );
  }
}
