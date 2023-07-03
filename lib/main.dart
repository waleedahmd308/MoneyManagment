import 'package:flutter/material.dart';
import 'package:money_managment/screens/Goals/showAllGoals.dart';
import 'package:money_managment/screens/Goals/goal.dart';
import 'package:money_managment/screens/Goals/goalDetail.dart';
import 'package:money_managment/screens/converter/converterScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: converterScreen()
    );
  }
}


