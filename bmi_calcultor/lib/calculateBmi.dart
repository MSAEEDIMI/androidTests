import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Calculate_Bmi{
  final int? hight;
  final int? weght;
  double? _bmi;
Calculate_Bmi({@required this.hight,@required this.weght});

String calculteBmi(){
  _bmi=weght!/pow(hight!/100, 2);
  return _bmi!.toStringAsFixed(1);
}

String getInterpreter(){
  if(_bmi! >= 25){
      return 'You have higher than normal body weight.Try to exersise more';
  }else if(_bmi!<=18.5){
      return 'You have lower than normal body weight.Try eat a bit more';
  }else{
      return 'You have normal body weight. good job!';
  }
}
String getResult(){
  if(_bmi! >= 25){
    return 'Overweight';
  }else if(_bmi!<=18.5){
    return 'Underweight';
  }else{
    return 'Normal';
  }

}
}