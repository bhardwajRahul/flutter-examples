import 'package:flutter/material.dart';

import 'example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stateless Widget",
      // Define the theme, set the primary swatch
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Example(),
    );
  }
}
