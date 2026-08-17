import 'package:flutter/material.dart';
import 'example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ).copyWith(secondary: Color(0xfff4796b)),
        brightness: Brightness.dark,
      ),
      home: const Example(),
    );
  }
}
