import 'package:bmi_calcultor/calculateBmi.dart';
import 'package:bmi_calcultor/cardGenderContant.dart';
import 'package:bmi_calcultor/constants.dart';
import 'package:bmi_calcultor/result_page.dart';
import 'package:bmi_calcultor/styleCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



enum Gender{
 meal,femail
}

Gender? selectGender;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 Gender? selectedGender;
 int hight=50;
 int age=0;
 double weight=0;
 Color finishd = Colors.teal;
 Color finishd1 =Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff23232C),Color(0xff23232C)],begin: Alignment.topCenter,end: Alignment.bottomCenter)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                child: Container(
                    decoration:BoxDecoration(
                      color: Color(0xffFAF3EB),
                      borderRadius: BorderRadius.circular(10),
                ),child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("-BMI-",style: TextStyle(fontSize: 30,color: Color(0xff1A434E),fontFamily: 'head_bold'),)],)),
              ),
            ),
            Expanded(
                flex: 5,
                child: Row(children: [
                  Expanded(child: cardStyle(
                    onPeresd: () {
                      setState(() {
                        selectedGender=Gender.meal;
                      });
                    },
                    color: selectedGender==Gender.meal ? activeColor: inActiveColor,
                    child: cardContant(color: Colors.black54,icon: FontAwesomeIcons.mars,label: 'MEAL'),
                  )
                  ),
                  Expanded(child: cardStyle(
                    onPeresd: () {
                      setState(() {
                        selectedGender=Gender.femail;
                      });
                    },
                    color: selectedGender==Gender.femail ? activeColor : inActiveColor ,
                    child: cardContant(color: Colors.black54,icon: FontAwesomeIcons.venus,label: 'FEMEAL'),
                  )
                  ),
            ],)
            ),
            Expanded(
              flex: 5,
              child: cardStyle(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("HIGHT",style: textStyle,),
                  SizedBox(height: 14,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(hight.toString(),style: textStyleBold,),
                      Text("cm",style: textStyle,)],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 30,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 40),
                    ),
                    child: Slider(
                      thumbColor: Colors.red,
                      activeColor: Colors.blueGrey.shade900,
                      inactiveColor: Colors.blueGrey.shade300,
                      value:hight.toDouble(),
                      min: 50,
                      max: 250,
                      onChanged: (double newValue) {
                        setState(() {
                          hight = newValue.round()  ;
                        });
                    },),
                  )
                ],),
              )
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                Expanded(child: cardStyle(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("AGE", style: textStyle,),
                  Text('$age',style: textStyleBold,),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedIconBouten(
                        onPressed: () => setState(() {
                          age+=3;
                        }),
                        iconData: FontAwesomeIcons.plus,),
                      SizedBox(width: 20,),
                      RoundedIconBouten(
                        onPressed: () => setState(() {
                          age=age>0?age-1:0;
                        }),
                        iconData: FontAwesomeIcons.minus,)
                    ],)
                ],),)
                ),
                Expanded(child: cardStyle(child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT", style: textStyle,),
                    Text('$weight kg',style: textStyleBold,),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedIconBouten(
                          onPressed:()=> setState(() {
                            weight+=5;
                          }),
                          iconData: FontAwesomeIcons.plus,),
                        SizedBox(width: 20,),
                        RoundedIconBouten(
                          onPressed: () => setState(() {
                            weight=weight>0? weight-1: 0;
                          }),
                          iconData: FontAwesomeIcons.minus,)
                      ],)
                  ],),)
                ),
              ],
            ),
            ),
            Expanded(
                flex: 2,
                child: cardStyle(
                  onPeresd: () {
                    Calculate_Bmi calcoulatBmi=Calculate_Bmi(hight: hight, weght: weight.round());
                    setState(() {
                      if (finishd==Colors.teal){
                        finishd = Colors.blueGrey;
                        finishd1 =Colors.teal;
                      } else{
                         finishd = Colors.teal;
                         finishd1 =Colors.blueGrey;
                      }
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>ResultPage(bmiResult: calcoulatBmi.calculteBmi(),
                      interpreteation: calcoulatBmi.getInterpreter(),resultText: calcoulatBmi.getResult(),resultColor: Colors.greenAccent,),));
                  },
                  gradient: LinearGradient(colors:[finishd,finishd1,],begin:Alignment.bottomCenter,end:  Alignment.topCenter),
                  child: Center(child: Text('Calculate',style: textStyleBold.copyWith(fontSize: 35),)),
                )
            ),
          ],
          ),
      ),
    ),
    );
  }
}
class RoundedIconBouten extends StatelessWidget {
  final IconData? iconData;
  final VoidCallback? onPressed;

  RoundedIconBouten({required this.iconData,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      elevation: 8,
      constraints: BoxConstraints.tightFor(height: 60,width: 60),
      fillColor: Colors.red,
      shape: CircleBorder(),
      onPressed: onPressed,
      onLongPress: onPressed,
    );
  }
}




