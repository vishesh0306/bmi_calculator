import 'dart:math';
import 'package:bmi_calculator/main.dart';
class CalculatorBrain{

  CalculatorBrain(
    this.height,
    this.weight,
  ): _bmi = -1.0;

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){

    if(_bmi > 25){
      return 'OverWeight';
    }
    else if(_bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){
    if(_bmi > 25){
      return 'Kam Khaya kijiye!! :) ';
    }
    else if(_bmi > 18.5){
      return 'Congo, You have a very good BMI';
    }
    else{
      return 'Khana nahi milta kya :(  ?';
    }
  }

}