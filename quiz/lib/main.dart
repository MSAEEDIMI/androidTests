
import 'package:flutter/material.dart';
import 'package:xlp/Quiz_brin.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuizBrain quizBrain=QuizBrain();
void main() => runApp(Quiz());


class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}



class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int greenLight=0,redLight=0;
  List<Icon> score=[];

  void showAlart(String none,Icon icon){
    showDialog(
      context: context,
      builder:(context) => AlertDialog(
        contentPadding: EdgeInsets.all(2),
        title: icon,
        content: Text(textAlign: TextAlign.center,none),
        contentTextStyle: TextStyle(fontSize: 25,color: Colors.black,),
        actions: [
          TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                setState(() {
                  none ='Not Make it';
                  greenLight=0;
                  redLight=0;
                  score.clear();
                });
              }, child:Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("مرحله بعد",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),Icon(Icons.navigate_next_sharp)],)),
          TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  greenLight=0;
                  redLight=0;
                  Navigator.pop(context);
                  score.clear();
                });
              }, child:Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("دوباره",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),Icon(Icons.refresh,size: 20,)],)),
        ],
      ),
    );
    score.clear();
  }

  void recognizeWener(){
    if (redLight<=greenLight){
      greenLight=0;
      redLight=0;
      showAlart('درود بر خرد تو', Icon(Icons.gpp_good,size: 40,color: Colors.greenAccent,));
    }else{
      greenLight=0;
      redLight=0;
      showAlart('یبار دیگه امتحان کن ',Icon(Icons.gpp_bad,size: 40,color: Colors.pinkAccent,),);
    }
  }

  void steScore(bool userAnswer){
    if (quizBrain.isFinishd()){
      recognizeWener();
      quizBrain.finshApp();
    }else{
      if(score.length<15) {
        if (quizBrain.getAnswer() == userAnswer) {
          score.add(Icon(Icons.gpp_good, color: Colors.green.shade900,));
          greenLight++;
        } else {
          score.add(Icon(Icons.gpp_bad, color: Colors.red.shade900,));
          redLight++;
        }
      }
    }


  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            flex: 1,
            child: Container(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: score,
            ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade200, Colors.red.shade200]),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),

          Expanded(
            flex: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(quizBrain.getQustionText(),textAlign: TextAlign.center ,style: TextStyle(color: Colors.white,fontSize: 28,),)),
            ),
          ),

          Expanded(
            flex: 4,
            child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  steScore(true);
                  quizBrain.nextQustion();
                  print(greenLight);
                }
                );
              },
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(20),bottomLeft: Radius.zero,bottomRight: Radius.circular(50))),
                  backgroundColor: Colors.green
              ),
              child:Text('درست',style: TextStyle(color: Colors.white,fontSize: 30),),
            ),
          ),
          ),

          Expanded(
            flex: 4,
            child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  steScore(false);
                  quizBrain.nextQustion();
                  print(redLight);
                });
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(50),bottomLeft: Radius.circular(50),bottomRight: Radius.zero)),
                backgroundColor: Colors.red,
              ),
              child:Text('غلط',style: TextStyle(color: Colors.white,fontSize: 30),),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
