import 'package:flutter/material.dart';

import 'tabs/first.dart';
import 'tabs/second.dart';
import 'tabs/third.dart';

// Example: the focused code for this app.
// A TabController wired to a TabBar (in the AppBar) and a TabBarView
// showing three tabs.
class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

// SingleTickerProviderStateMixin is used for animation
class _ExampleState extends State<Example> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        // set icon to the tab
        const Tab(icon: Icon(Icons.favorite)),
        const Tab(icon: Icon(Icons.adb)),
        const Tab(icon: Icon(Icons.airport_shuttle)),
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(List<Widget> tabs) {
    return TabBarView(
      // set the controller
      controller: controller,
      // Add tabs as widgets
      children: tabs,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: const Text("Using Tabs"),
        // Set the background color of the App Bar
        backgroundColor: Colors.blue,
        // Set the bottom property of the Appbar to include a Tab Bar
        bottom: getTabBar(),
      ),
      // Set the TabBar view as the body of the Scaffold
      body:
          getTabBarView(<Widget>[const First(), const Second(), const Third()]),
    );
  }
}
