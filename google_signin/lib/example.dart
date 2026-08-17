// Example: Sign in to Google and display the signed-in user's profile.
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';
import 'user.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  ExampleState createState() => ExampleState();
}

class ExampleState extends State<Example> {
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
  late Widget userPage;

  @override
  void initState() {
    super.initState();
    userPage = Home(
      onSignin: _signin,
      onLogout: _logout,
      showLoading: false,
    );
  }

  Future<User?> _signin() async {
    setState(() {
      userPage = Home(onSignin: null, onLogout: _logout, showLoading: true);
    });
    try {
      await googleSignIn.initialize();
      final GoogleSignInAccount account = await googleSignIn.authenticate();
      final GoogleSignInAuthentication auth = account.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
      );
      final UserCredential authRes =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authRes.user;
      if (user == null) return null;

      setState(() {
        userPage = UserProfile(onLogout: _logout, user: user);
      });

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> _logout() async {
    await googleSignIn.signOut();
    setState(() {
      userPage = Home(
        onSignin: _signin,
        onLogout: _logout,
        showLoading: false,
      );
    });

    print("Logged Out");
  }

  @override
  Widget build(BuildContext context) {
    return userPage;
  }
}
