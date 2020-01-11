import 'dart:math';

import 'package:flutter_bmi/strings.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 39.9) {
      return str_level6;
    } else if (_bmi > 34.9) {
      return str_level5;
    } else if (_bmi > 29.9) {
      return str_level4;
    } else if (_bmi > 24.9) {
      return str_level3;
    } else if (_bmi > 18.5) {
      return str_level2;
    } else {
      return str_level1;
    }
  }

  String getRange() {
    if (_bmi > 39.9) {
      return str_range6;
    } else if (_bmi > 34.9) {
      return str_range5;
    } else if (_bmi > 29.9) {
      return str_range4;
    } else if (_bmi > 24.9) {
      return str_range3;
    } else if (_bmi > 18.5) {
      return str_range2;
    } else {
      return str_range1;
    }
  }

  String getInterpretation() {
    if (_bmi > 39.9) {
      return str_feed_level6;
    } else if (_bmi > 34.9) {
      return str_feed_level5;
    } else if (_bmi > 29.9) {
      return str_feed_level4;
    } else if (_bmi > 24.9) {
      return str_feed_level3;
    } else if (_bmi > 18.5) {
      return str_feed_level2;
    } else {
      return str_feed_level1;
    }
  }
}
