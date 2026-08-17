// Example: Analytics tracking with Firebase Analytics showing a list of items
import 'package:analytics_integration/single_item_tile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  /// create instance of FirebaseAnalytics as [analytics]
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  /// create observer for FirebaseAnalytics as [observer]
  /// this observer sends events to Firebase Analytics when the
  /// currently active route changes.
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  late FirebaseAnalytics _analytics;

  @override
  void initState() {
    /// initializing data to local variable [_analytics] for Firebase Analytics
    /// that we made before for local use
    _analytics = Example.analytics;
    //// below three events are related to user which we are
    //// sending to Firebase Analytics
    _setUserIdInAnalytics();
    _setUserPropertyInAnalytics();
    _currentScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text('Flutter Analytics'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            SingleItemTile(
              itemName: 'Carrot',
              analytics: _analytics,
              quantity: 1,
              price: '100Rs',
            ),
            SizedBox(
              height: 16,
            ),
            SingleItemTile(
              itemName: 'Baby Carrot',
              analytics: _analytics,
              quantity: .5,
              price: '50Rs',
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  //// to create a unique user identifier for Analytics
  //// send user id(if you app has)
  Future<void> _setUserIdInAnalytics() async {
    await _analytics.setUserId(id: 'alksj39hnfn49skvnghqwp40sm');
  }

  //// sending user related field to Analytics
  /// below [name] is the name of the user property to set
  /// [value] is the values of that property
  Future<void> _setUserPropertyInAnalytics() async {
    await _analytics.setUserProperty(
      name: 'email',
      value: 'johndoe@gmail.com',
    );
  }

  /// Setting the current Screen of the app in [screenName]
  /// and sending back to Analytics
  Future<void> _currentScreen() async {
    await _analytics.logEvent(
      name: 'screen_view',
      parameters: <String, Object>{
        'screen_name': 'FlutterAnalyticsHome',
        'screen_class': 'FlutterAnalyticsHome',
      },
    );
  }
}
