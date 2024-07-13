import 'package:xlp/main.dart';

import 'Question.dart';

class QuizBrain{

  int _numOfQustion=0;
  List<Question> _qustions=[
    Question(qustions:'ساخت برج ایفل در 31 مارس 1887 به پایان رسید', answers:false),
    Question(qustions:'رعد و برق قبل از شنیده شدن دیده می شود زیرا نور سریعتر از صدا حرکت می کند', answers:true),
    Question(qustions:'شهر واتیکان یک کشور است', answers:true),
    Question(qustions:'ملبورن پایتخت استرالیا است', answers:false)
  ];

  String getQustionText(){
    return _qustions[_numOfQustion].qustions;
  }
  bool getAnswer(){
    return _qustions[_numOfQustion].answers;
  }
  void nextQustion(){
    if (_numOfQustion<_qustions.length-1){
      _numOfQustion++;
    }
  }

  bool isFinishd(){
    if(_numOfQustion==_qustions.length-1){
      return true;
    }else{
      return false;
    }
  }

  void finshApp() {
    _numOfQustion=0;
  }
}