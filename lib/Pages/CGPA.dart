import 'package:cgpa_calculator/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:cgpa_calculator/Widgets/HeaderRow.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cgpa_calculator/Widgets/CustomTextField.dart';
import 'package:cgpa_calculator/Widgets/CalculateAndReset.dart';

class CGPA extends StatefulWidget {

  @override
  _CGPAState createState() => _CGPAState();
}

class _CGPAState extends State<CGPA> {
  List<int> _semesterCredits = List.filled(8, 0);
  List<double> _sgpa = List.filled(8, 0);
  String cgpa = '';

  void calculate() {
    double result = 0;
    double totalGpa = 0;
    double totalCredits = 0;
    for (int i = 0; i < _semesterCredits.length; i++) {
      totalCredits += _semesterCredits[i];
      totalGpa += (_semesterCredits[i] * _sgpa[i]);
    }
    result = (totalGpa / totalCredits);
    setState(() {
      cgpa = roundDouble(result, 3).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        HeaderRow(numberText: 'Semester', gradeOrGpa: 'SGPA'),
        SizedBox(height: 15),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 20,
            ),
            itemCount: 8,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return buildRow(context, index);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CalculateAndReset(onPressed: calculate, gpa: cgpa),
        )
      ],
    );
  }

  Row buildRow(BuildContext context, int index) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
        ),
        Text(
          '${index + 1}',
          style: kGPATextStyle,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.27,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: CustomTextField(
            hinText: 'SEM${index + 1}',
            onChanged: (value) {
              if (int.tryParse(value)! > 0 && int.tryParse(value)! < 100) {
                _semesterCredits[index] = int.parse(value);
              } else {
                Fluttertoast.showToast(
                  msg: "Enter a number in valid range",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                );
              }
            },
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.11,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: CustomTextField(
            hinText: 'SGPA',
            onChanged: (value) {
              if (double.parse(value) > 0 && double.parse(value) <= 10) {
                _sgpa[index] = double.parse(value);
              } else {
                Fluttertoast.showToast(
                  msg: "Enter a number in valid range",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
