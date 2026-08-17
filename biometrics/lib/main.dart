import 'package:biometrics/example.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Biometrics());

class Biometrics extends StatelessWidget {
  const Biometrics({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biometrics',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: const Example(),
    );
  }
}
