import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hinText;
  final ValueSetter<String> onChanged;

  CustomTextField({required this.hinText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(color: Colors.white54),
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: Colors.lightBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
