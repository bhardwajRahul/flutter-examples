import 'package:flutter/material.dart';
import 'package:handling_routes/screens/about.dart';

import 'example.dart';

void main() {
  runApp(MaterialApp(
    home: const Example(), // home has implicit route set at '/'
    // Setup routes
    routes: <String, WidgetBuilder>{
      // Set named routes
      AboutPage.routeName: (BuildContext context) => AboutPage(),
    },
  ));
}
