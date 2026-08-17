// Example: A scrollable list of contacts with avatar, name, and email.
import 'package:flutter/material.dart';
import 'package:using_listview/contact_page.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Using Listview"),
      ),
      body: const ContactPage(),
    );
  }
}
