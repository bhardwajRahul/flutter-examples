import 'package:analytics_integration/example.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize your firebase project
  await Firebase.initializeApp();
  runApp(const FlutterAnalyticsApp());
}

class FlutterAnalyticsApp extends StatelessWidget {
  const FlutterAnalyticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Analytics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      /// this is used to observe navigation changes in the app
      /// and sending data back to Firebase Analytics
      navigatorObservers: <NavigatorObserver>[Example.observer],
      home: const Example(),
    );
  }
}
