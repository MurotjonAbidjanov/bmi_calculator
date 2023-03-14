import 'dart:math';

import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({
    required this.height,
    required this.weight,
  });

  final int height;
  final int weight;

  double? _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String? getResult() {
    if (_bmi! >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi! > 18.5) {
      return 'NORMAL';
    } else {
      'UNDERWEIGHT';
    }
  }

  String? getComment() {
    if (_bmi! >= 25) {
      return 'You have a higher than normal result. Try to exercise more and eat less';
    } else if (_bmi! > 18.5) {
      return 'You have a normal result. Good job';
    } else {
      'You have a lower result. Try to eat more';
    }
  }
}
