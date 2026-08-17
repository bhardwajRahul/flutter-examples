import 'package:flutter/material.dart';

// Example: load images (including animated GIFs) from a network URL.
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image from Network"),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          // Load image from network
          Image.network(
              'https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/flutter_logo.png'),
          // even loads gifs
          // Gif image from Giphy, all copyrights are owned by Giphy
          Image.network(
              'https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/loop_anim.gif'),
        ],
      )),
    );
  }
}
