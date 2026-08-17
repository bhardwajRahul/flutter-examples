import 'package:flutter/material.dart';

// Example: use the app theme to style widgets and override it locally.
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        // AppBar Title
        title: const Text("Using Theme"),
      ),
      body: Container(
        // Another way to set the background color
        decoration: const BoxDecoration(color: Colors.black87),
        child: Center(
          child: Container(
            // use the theme accent color as background color for this widget
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Hello World!',
              // Set text style as per theme
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),

      floatingActionButton: Theme(
        // override the accent color of theme for this widget only
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: Colors.pinkAccent),
        ),
        child: FloatingActionButton(
          onPressed: null,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
