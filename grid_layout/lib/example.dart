// Example: A grid layout displaying social network icons in a 2-column grid.
import 'package:flutter/material.dart';

import 'gridview.dart';

class Example extends StatelessWidget {
  Example({super.key});

  final MyGridView myGridView = MyGridView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("GridView Example"),
      ),
      body: myGridView.build(),
    );
  }
}
