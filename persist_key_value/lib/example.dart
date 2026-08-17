import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Example: persist a counter across app restarts with shared_preferences.
class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  var nameOfApp = "Persist Key Value";

  var counter = 0;

  // define a key to use later
  var key = "counter";

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    // Get shared preference instance
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Get value
      counter = (prefs.getInt(key) ?? 0);
    });
  }

  Future<void> _onIncrementHit() async {
    // Get shared preference instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      // Get value
      counter = (prefs.getInt(key) ?? 0) + 1;
    });

    // Save Value
    prefs.setInt(key, counter);
  }

  Future<void> _onDecrementHit() async {
    // Get shared preference instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      // Get value
      counter = (prefs.getInt(key) ?? 0) - 1;
    });

    // Save Value
    prefs.setInt(key, counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text(nameOfApp),
      ),
      // Body
      body: Container(
        // Center the content
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$counter',
                textScaler: TextScaler.linear(10.0),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              ElevatedButton(
                  onPressed: _onIncrementHit,
                  child: const Text('Increment Counter')),
              const Padding(padding: EdgeInsets.all(10.0)),
              ElevatedButton(
                  onPressed: _onDecrementHit,
                  child: const Text('Decrement Counter')),
            ],
          ),
        ),
      ),
    );
  }
}
