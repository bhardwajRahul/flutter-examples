// Example: Displays text using a custom font loaded from the app's assets.
import 'package:flutter/material.dart';

import './utils.dart' as utils;

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Using Custom Fonts"),
      ),
      // Body
      body: Container(
        // Center the content
        child: Center(
          // Add Text
          child: Text("The quick brown fox jumps over the lazy dog",
              // Center align text
              textAlign: TextAlign.center,
              // set a text style which defines a custom font
              style: utils.getCustomFontTextStyle()),
        ),
      ),
    );
  }
}
