import 'package:flutter/material.dart';

// Example: how to enable a splash screen and show a simple message.
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen Example"),
      ),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
