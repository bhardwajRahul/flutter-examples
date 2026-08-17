import 'package:flutter/material.dart';

// Example: show a SnackBar with an action button when the button is pressed.
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Using SnackBar"),
      ),
      body: Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Show SnackBar'),
      // On pressing the raised button
      onPressed: () {
        // show snackbar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          // set content of snackbar
          content: const Text("Hello! I am SnackBar :)"),
          // set duration
          duration: const Duration(seconds: 3),
          // set the action
          action: SnackBarAction(
              label: "Hit Me (Action)",
              onPressed: () {
                // When action button is pressed, show another snackbar
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                      "Hello! I am shown becoz you pressed Action :)"),
                ));
              }),
        ));
      },
    );
  }
}
