import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = "/account";

  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Container(
          child: Center(
        child: Text("Account Screen"),
      )),
    );
  }
}
