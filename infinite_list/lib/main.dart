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
      title: 'Infinite List',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.lightBlue)),
      home: const Example(),
    );
  }
}
