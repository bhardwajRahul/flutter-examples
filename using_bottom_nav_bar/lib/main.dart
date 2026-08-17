import 'package:flutter/material.dart';
import 'package:using_bottom_nav_bar/example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Title
      title: "Using Tabs",
      // Home
      home: const Example(),
    );
  }
}
