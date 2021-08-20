import 'package:flutter/material.dart';
import 'package:cgpa_calculator/Widgets/CustomElevatedButton.dart';
import 'package:cgpa_calculator/Constants.dart';
import '../main.dart';

class CalculateAndReset extends StatefulWidget {

  final void Function()? onPressed;
  final String gpa;

  CalculateAndReset({required this.onPressed, required this.gpa});

  @override
  _CalculateAndResetState createState() => _CalculateAndResetState();
}

class _CalculateAndResetState extends State<CalculateAndReset> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'CALCULATE',
                onPressed: widget.onPressed,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: CustomElevatedButton(
                  text: 'RESET',
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      ModalRoute.withName('SGPA'),
                      //To remove routes until a route with a certain name, use the RoutePredicate returned from ModalRoute.withName.
                    );
                  },
                ),
              ),
              SizedBox(width: 20),
              Row(
                children: [
                  Text(
                    'Result: ',
                    style: kResultTextStyle,
                  ),
                  Text(
                    widget.gpa,
                    style: kResultTextStyle,
                  ),
                ],
              )
            ],
          )
        ],
      ),

    );
  }
}
