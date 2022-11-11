import 'dart:math';

class Calculations {
  Calculations({required this.weight, required this.height});
  final int height;
  final int weight;
  late double _bmi;

  String BMICalculation() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You have more than normal body weight. try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good luck!";
    } else {
      return "You have more than normal body weight. You can eat a bit more";
    }
  }
}
