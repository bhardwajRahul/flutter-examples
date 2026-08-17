// Example: Platform adaptive widgets
import 'package:flutter/material.dart';
import 'package:using_platform_adaptive/common_widgets/adaptive_button.dart';
import 'package:using_platform_adaptive/common_widgets/adaptive_date_picker.dart';
import 'package:using_platform_adaptive/common_widgets/adaptive_indicator.dart';

class Example extends StatefulWidget {
  const Example({super.key, this.title = 'Using Platform Adaptive'});
  final String title;

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  TargetPlatform? selectedPlatform;
  final String introText = "Flutter's flagship feature is it's ability to write"
      " code once and have it run on multiple devices. While this is great, sometimes"
      " you want the user interface to look more native to its platform. This project"
      " showcases the Platform Adaptive pattern, a powerful pattern that allows you"
      " to create widgets that you write once and look natural on any device. The"
      " demo is just set up to work on android and iOS but can be extended to work"
      " on web, native and any other platform flutter supports.";

  @override
  Widget build(BuildContext context) {
    final platforms = {
      "Default": null,
      "Android": TargetPlatform.android,
      "iOS": TargetPlatform.iOS,
    };
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(introText),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Force a platform:  "),
                DropdownButton(
                  value: selectedPlatform,
                  items: List<DropdownMenuItem>.from(platforms.entries.map(
                      (e) => DropdownMenuItem(
                          value: e.value, child: Text(e.key)))),
                  onChanged: (value) {
                    setState(() {
                      selectedPlatform = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Buttons:  "),
                AdaptiveButton(
                  forcePlatform: selectedPlatform,
                  color: Colors.teal,
                  onPressed: () {},
                  child: const Text("I'm a button"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dialogs:  "),
                AdaptiveButton(
                  forcePlatform: selectedPlatform,
                  color: Colors.teal,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AdaptiveDialog(
                            title: "Test",
                            content: const Text("This is the content area"),
                            actions: [
                              AdaptiveDialogAction(
                                text: "Action 1",
                                forcePlatform: selectedPlatform,
                                onPressed: () {},
                              ),
                              AdaptiveDialogAction(
                                text: "Action 2",
                                forcePlatform: selectedPlatform,
                                onPressed: () {},
                              ),
                            ],
                            forcePlatform: selectedPlatform,
                          );
                        });
                  },
                  child: const Text("Show"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Loading Indicator:   "),
                AdaptiveIndicator(
                  forcePlatform: selectedPlatform,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
