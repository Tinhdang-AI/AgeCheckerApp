import 'package:flutter/material.dart';
import 'screens/age_checker_screen.dart';

void main() {
  runApp(AgeCheckerApp());
}

class AgeCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AgeCheckerScreen(),
    );
  }
}
