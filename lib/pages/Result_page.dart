import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../resorses/functions.dart';
import '../resorses/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    required this.bmiResult,
    required this.comment,
    required this.resultText,
  });

  final String bmiResult;
  final String resultText;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: cNumberTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Pages(
              tus: cActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: cResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: cBMITextStyle,
                  ),
                  Text(
                    comment,
                    style: cbodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              title: 'RE-CALCULATE',
              onPress: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
