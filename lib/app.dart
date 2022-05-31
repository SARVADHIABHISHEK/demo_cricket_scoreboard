import 'package:demo_cricket_scorecard/constants/app_constants.dart';
import 'package:demo_cricket_scorecard/data/drift_database.dart';
import 'package:demo_cricket_scorecard/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<AppDatabase>(
      create: (_) => AppDatabase(),
      dispose: (_, db) => db.close(),
      builder: (context, child) {
        kAppDatabase = Provider.of<AppDatabase>(context, listen: false);
        return ScreenUtilInit(
          builder: (BuildContext context, Widget child) {
            return child;
          },
          child: const MaterialApp(
            title: 'demo_cricket_scoreboard',
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
