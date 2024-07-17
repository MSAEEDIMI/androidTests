import 'package:bmi_calcultor/constants.dart';
import 'package:bmi_calcultor/styleCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultPage extends StatelessWidget {
  final String? bmiResult,resultText,interpreteation;
  final Color? resultColor;
  ResultPage({@required this.bmiResult,@required this.interpreteation,@required this.resultText,@required this.resultColor});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(title: Text('ResultPage',style:textStyle,),backgroundColor: Colors.white70,elevation: 15,),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // SizedBox(height: 20,),
              Expanded(
                  flex:1,
                  child: Center(
                    child: cardStyle(child: Text('Result Page',style: TextStyle(fontFamily: 'head_bold',fontSize: 50),
                    ),color: Color(0xff23232C)),
                  )),
              Expanded(flex:5,child: cardStyle(
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('$resultText',style: textStyle.copyWith(color: resultColor!,fontSize: 40),),
                            Text('$bmiResult',style: textStyleBold.copyWith(fontSize: 80),),
                            Text('Normal BMI range\n18.5_25',style: textStyle.copyWith(fontSize: 30),textAlign: TextAlign.center,),
                            Text('$interpreteation',style: textStyle.copyWith(fontSize: 30),textAlign: TextAlign.center,),
                      ],
                    )),
                      Expanded(
                        flex: 1,
                        child: cardStyle(
                          onPeresd: () {
                            Navigator.pushNamed(context, '/');
                          },
                          color: Colors.red,
                          child: Center(child: Text('RE-Calculate',style: textStyleBold.copyWith(fontSize: 30),)),
                                            ),
                      )
                  ],
                ),
              ))

            ],
          )),
    );
  }
}
