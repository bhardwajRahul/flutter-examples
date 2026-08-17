import 'package:flutter/material.dart';

// Example: show an AlertDialog when the button is pressed.
class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  // Generate dialog
  AlertDialog dialog = AlertDialog(
      content: const Text(
    "Hello World!",
    style: TextStyle(fontSize: 30.0),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Using Alert Dialog"),
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
                child: const Text("Hit to alert!"),
                // On press of the button
                onPressed: () {
                  // Show dialog
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog);
                }),
          ),
        ));
  }
}
