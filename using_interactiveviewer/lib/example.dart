import 'package:flutter/material.dart';

// Example: a zoomable and pannable FlutterLogo using InteractiveViewer.
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Using InteractiveViewer"),
      ),
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(100.0),
        minScale: 0.1,
        maxScale: 1.6,
        child: const Center(
          child: FlutterLogo(
            size: 90,
          ),
        ),
      ),
    );
  }
}
