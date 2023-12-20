import 'dart:math';
import 'package:flutter/material.dart';
import '';

class Calculate {
  Calculate(
      {required this.height,
      required this.weight,
      required this.age,
      required this.Gender,
      required this.sport});
  final int height;
  final int weight;
  final int age;
  final bool Gender;
  final Object? sport;

  double TDEE = 0;
  double _bmi = 0;
  double _bmr = 0;
  double BFP = 0;
  double IBW = 0;

  Color _textColor = Color(0xFF24D876);

  String result() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String result2() {
    Gender == true
        ? _bmr = 66.5 + (13.75 * weight) + (5.003 * height) - (6.75 * age)
        : _bmr = 655.1 + (9.563 * weight) + (1.850 * height) - (4.676 * age);

    return _bmr.toStringAsFixed(1);
    //return TDEE.toStringAsFixed(1);
  }

  String result3() {
    result2();
    sport == 0
        ? TDEE = 1.5 * _bmr
        : sport == 1
            ? TDEE = 1.8 * _bmr
            : TDEE = 2 * _bmr;

    return TDEE.toStringAsFixed(1);
    //return TDEE.toStringAsFixed(1);
  }

  String result4() {
    result();

    Gender == true
        ? BFP = (1.20 * _bmi + 0.23 * age - 16.2)
        : BFP = (1.20 * _bmi + 0.23 * age - 5.4);

    return BFP.toStringAsFixed(1);
    //return TDEE.toStringAsFixed(1);
  }

  String result5() {
    Gender == true
        ? IBW = height - 100 - ((height - 150) / 4)
        : IBW = height - 100 - ((height - 150) / 2.5);

    return IBW.toStringAsFixed(1);
    //return TDEE.toStringAsFixed(1);
  }

  String getText() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getAdvise() {
    if (_bmi >= 25) {
      return 'You have a more than normal body weight.\n Try to do more Exercise';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight.\nGood job!';
    } else {
      return 'You have a lower than normal body weight.\n Try to eat more';
    }
  }

  String getAdviseMale2() {
    if (BFP >= 18) {
      return 'You have a more than normal body Fat Percentage.\n Try to do more Exercise';
    } else if (BFP > 14) {
      return 'You have a normal body Fat Percentage.\nGood job!';
    } else if (BFP > 6) {
      return 'You have a low body Fat Percentage.\nGood job!';
    } else {
      return 'You have a lower than normal body Fat Percentage.\n Try to eat more';
    }
  }

  String getAdvisefeMale2() {
    if (BFP >= 25) {
      return 'You have a more than normal body Fat Percentage.\n Try to do more Exercise';
    } else if (BFP > 21) {
      return 'You have a normal body Fat Percentage.\nGood job!';
    } else if (BFP > 14) {
      return 'You have a low body Fat Percentage.\nGood job!';
    } else {
      return 'You have a lower than normal body Fat Percentage.\n Try to eat more';
    }
  }

  Color getTextColor() {
    if (_bmi >= 25 || _bmi <= 18.5) {
      return Colors.deepOrangeAccent;
    } else {
      return Color(0xFF24D876);
    }
  }
}
