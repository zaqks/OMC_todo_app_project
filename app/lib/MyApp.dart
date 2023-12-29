import 'package:flutter/material.dart';
import "data/userData.dart";

import "pages/HomePage.dart";
import 'pages/LoadingPage.dart';

Function? refreshMyApp;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    if (refreshMyApp == null) {
      refreshMyApp = () {
        setState(() {});
      };
      initFuncs();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loaded ? HomePage() : LoadingPage(),
    );
  }
}
