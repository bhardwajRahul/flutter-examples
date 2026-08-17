import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

// Example: Two buttons to test Crashlytics custom logging and crash reporting.
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                //custom Crashlytics log message
                FirebaseCrashlytics.instance.log("It's a bug");
              },
              child: Text("Custom Log")),
          const SizedBox(height: 10),
          ElevatedButton(
            child: Text('Crash the app'),
            onPressed: () {
              FirebaseCrashlytics.instance.crash();
            },
          ),
        ],
      ),
    );
  }
}
