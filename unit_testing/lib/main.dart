import 'package:flutter/material.dart';
import 'package:unit_testing/screens/home_screen.dart';
import 'package:unit_testing/screens/sign_in_screen.dart';

import 'example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "/",
      home: const Example(),
      routes: {
        "/": (context) => SignInScreen(),
        "/homeScreen": (context) => HomeScreen(),
      },
    );
  }
}
