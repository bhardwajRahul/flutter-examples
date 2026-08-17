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
      // Disable the debug flag
      debugShowCheckedModeBanner: false,
      // Title
      title: "Persist Key Value",
      // Home
      home: const Example(),
    );
  }
}
