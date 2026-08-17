import 'package:flutter/material.dart';

class ViewPDF extends StatelessWidget {
  final Widget viewer;
  const ViewPDF({super.key, 
    required this.viewer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Center(child: viewer),
    );
  }
}
