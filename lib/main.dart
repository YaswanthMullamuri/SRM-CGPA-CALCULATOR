import 'package:cgpa_calculator/Pages/TabView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
