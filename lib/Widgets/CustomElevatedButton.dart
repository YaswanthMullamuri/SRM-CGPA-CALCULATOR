import 'package:flutter/material.dart';
import 'package:cgpa_calculator/Constants.dart';

class CustomElevatedButton extends StatelessWidget {

  final String text;
  final void Function()? onPressed;
  CustomElevatedButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        primary: kElevatedButtonColor,
      ),
    );
  }
}
