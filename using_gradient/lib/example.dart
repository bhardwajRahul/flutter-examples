import 'package:flutter/material.dart';

import 'utils.dart' as utils;

// Example: the focused code for this app.
// A Container whose background uses a custom LinearGradient.
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Using Gradient"),
      ),
      body: Container(
        // Decoration
        decoration: BoxDecoration(
          // Add Gradient
          gradient: utils.getCustomGradient(),
        ),
        // Center the content
        child: const Center(
          // Add Text
          child: Text(
            "Hello World!",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
