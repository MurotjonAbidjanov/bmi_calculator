import 'package:bmi_calculator/BMI_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Result_page.dart';

import '../resorses/round_icon_button.dart';
import '../resorses/functions.dart';
import '../resorses/bottom_button.dart';
import '../constants.dart';

enum Gen {
  male,
  female,
}

class InputPage extends StatefulWidget {
  InputPage();

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gen? selectedGender;
  int height = 170;
  int weight = 60;
  int age = 18;

  // Color maleCardColor = cInActiveColor;
  // Color femaleCardColor = cInActiveColor;

  // void updateColor(int gender) {
  //   if (gender == 1) {
  //     if (maleCardColor == InActiveColor) {
  //       maleCardColor = ActiveColor;
  //       femaleCardColor = InActiveColor;
  //     } else {
  //       maleCardColor == InActiveColor;
  //     }
  //   }
  //   if (gender == 2) {
  //     if (femaleCardColor == InActiveColor) {
  //       femaleCardColor = ActiveColor;
  //       maleCardColor = InActiveColor;
  //     } else {
  //       femaleCardColor == InActiveColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF0A0E21),
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gen.male;
                    });
                  },
                  child: Pages(
                    tus: selectedGender == Gen.male
                        ? cActiveColor
                        : cInActiveColor,
                    cardChild: Gender(
                      icon: FontAwesomeIcons.mars,
                      title: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gen.female;
                      ;
                    });
                  },
                  child: Pages(
                    tus: selectedGender == Gen.female
                        ? cActiveColor
                        : cInActiveColor,
                    cardChild: Gender(
                      icon: FontAwesomeIcons.venus,
                      title: 'FEMALE',
                    ),
                  ),
                ),
              )
            ],
          )),
          Expanded(
              child: Pages(
            tus: cActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: cLabelTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      height.toString(),
                      style: cNumberTextStyle,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'cm',
                      style: cLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.white,
                        thumbColor: cBottomColor,
                        overlayColor: Color(0x29EB1555)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ))
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Pages(
                tus: cActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: cLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: cNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: Pages(
                tus: cActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: cLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: cNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          )),
          BottomButton(
              title: 'CALCULATE',
              onPress: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult()!,
                      comment: calc.getComment()!,
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
