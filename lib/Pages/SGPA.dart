import 'package:cgpa_calculator/Widgets/CalculateAndReset.dart';
import 'package:cgpa_calculator/Widgets/HeaderRow.dart';
import 'package:cgpa_calculator/Constants.dart';
import 'package:flutter/material.dart';

class SGPA extends StatefulWidget {
  const SGPA({Key? key}) : super(key: key);
  @override
  _SGPAState createState() => _SGPAState();
}

class _SGPAState extends State<SGPA> {
  List<String> _credits = ['0', '1', '2', '3', '4', '5'];
  List<String> _grades = ['O', 'A+', 'A', 'B+', 'B', 'C', 'P', 'F', 'Ab'];

  List<String> selectedCredit = List.filled(15, '0');
  List<String> selectedGrade = List.filled(15, 'O');
  Map gradeMap = {'O':10, 'A+':9, 'A':8, 'B+':7, 'B':6, 'C':5, 'P':4, 'F':0, 'Ab':0};
  String sgpa = '';

  void calculate() {
    double result = 0;
    int totalScore = 0;
    int totalCredits = 0;
    for (int i = 0; i < selectedCredit.length; i++) {
      totalCredits += int.parse(selectedCredit[i]);
      totalScore += (int.parse(selectedCredit[i]) * gradeMap[selectedGrade[i]]).toInt();
    }
    result = (totalScore / totalCredits);
    setState(() {
      sgpa = roundDouble(result, 3).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        HeaderRow(
          numberText: 'SNo',
          gradeOrGpa: 'Grade',
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return dataRow(index: index);
            },
          ),
        ),
        CalculateAndReset(onPressed: calculate, gpa: sgpa),
      ],
    );
  }



  Row dataRow({required int index}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '${index+1}',
            style: kGPATextStyle,
          ),
          DropdownButtonHideUnderline(
            child: buildDropdown(
              selectedValue: selectedCredit[index],
              selectedList: _credits,
              onSelected: (value) {
                setState(() {
                  selectedCredit[index] = value!;
                });
              }
            ),
          ),
          DropdownButtonHideUnderline(
            child: buildDropdown(
                selectedValue: selectedGrade[index],
                selectedList: _grades,
                onSelected: (value) {
                  setState(() {
                    selectedGrade[index] = value!;
                  });
                }
            ),
          ),
        ],
      );
  }

  DropdownButton<String> buildDropdown(
      {required final String? selectedValue, required final List<String> selectedList, required final ValueSetter<String?> onSelected}) {
    return DropdownButton(
      value: selectedValue,
      items: selectedList.map((location) {
        return DropdownMenuItem(
          value: location,
          child: Text(
            location,
            style: kDropdownTextStyle,
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        onSelected(newValue);
        print(selectedValue);
      },
    );
  }
}