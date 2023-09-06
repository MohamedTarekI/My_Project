import 'package:flutter/material.dart';
import 'package:test1/Login%20Screen.dart';
import 'package:test1/home%20screen.dart';

import 'BMI Calculator.dart';
import 'BMI Result Screen.dart';
import 'Countair Screen.dart';
import 'Home Layout.dart';
import 'MessnegarScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginScreen()
    );
  }
}
