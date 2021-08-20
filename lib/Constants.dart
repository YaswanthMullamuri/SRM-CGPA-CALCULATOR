import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xFF213061);

const Color kElevatedButtonColor = Color(0xFF213061);

const String kCalculatorImage = 'images/Calculator.png';

const TextStyle kGPATextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

const TextStyle kTabBarTextStyle = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.bold,
);

const TextStyle kDropdownTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);

const TextStyle kResultTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: "Enter City Name",
  hintStyle: TextStyle(
    color: Colors.blueGrey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);

double roundDouble(double value, int places){
num mod = pow(10.0, places);
return ((value * mod).round().toDouble() / mod);
}