import 'package:flutter/material.dart';

// Example: load an image from the app's assets and use it as a background.
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Load local image"),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  // Load image from assets
                  image: AssetImage('data_repo/img/bg1.jpg'),
                  // Make the image cover the whole area
                  fit: BoxFit.cover)),
          child: const Center(
            child: Text(
              "Hello World!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
