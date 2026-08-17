import 'package:flutter/material.dart';

// Example: the focused code for this app.
// Shows a single centered Text widget inside a plain Material app.
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Material App"),
      ),
      body: Container(
        child: const Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}
