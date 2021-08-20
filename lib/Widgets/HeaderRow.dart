import 'package:flutter/material.dart';
import 'package:cgpa_calculator/Constants.dart';

class HeaderRow extends StatelessWidget {

  final String numberText, gradeOrGpa;
  HeaderRow({required this.numberText, required this.gradeOrGpa});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('$numberText', style: kGPATextStyle),
        Text('Credits', style: kGPATextStyle),
        Text('$gradeOrGpa', style: kGPATextStyle),
      ],
    );
  }
}