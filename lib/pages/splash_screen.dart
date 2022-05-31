import 'dart:async';
import 'package:demo_cricket_scorecard/constants/app_constants.dart';
import 'package:demo_cricket_scorecard/data/drift_database.dart';
import 'package:demo_cricket_scorecard/pages/home_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (_) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Welcome! Back',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      )),
    );
  }
}
