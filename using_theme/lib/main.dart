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
      debugShowCheckedModeBanner: false,
      title: "Using Theme",
      // Set the theme's primary color, accent color,
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(secondary: Colors.lightGreenAccent),
        // Set background color
        scaffoldBackgroundColor: Colors.black12,
      ),
      home: const Example(),
    );
  }
}
