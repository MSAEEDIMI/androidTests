
import 'dart:ffi';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title:'mohammad',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String stateMent='\u{25B6}';
  var addres=Random();
  @override
  Widget build(BuildContext context) {
    List state=['انجام بده','انجام نده ','انجام ندی بهتره','هر طور دوست داری','از دوست دخترت بپرس','از دوست پسرت بپرس','نمدونم والا','برو بابا مارو اسکل کردی','برو مزاحم نشو'];
    Random adrees=Random();
    return Scaffold(
        backgroundColor: Color(0xFFBCEDDF),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.blueGrey,
          title: Center(child: Text( '\u{1F642} حل دوراهی'.toUpperCase(),style:TextStyle(fontWeight: FontWeight.bold ,fontFamily: 'hederFont',fontSize: 30),)),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      stateMent=state[adrees.nextInt(adrees.nextInt(10))];
                    });
                  },
                  child: CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.blueGrey ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$stateMent ',style: TextStyle(fontFamily: 'bodyFont',fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60,),
          FloatingActionButton.extended(
            elevation: 0,
            onPressed: () {
            setState(() {
              stateMent='\u{25B6}';
            });
          },label: Text("باز گردانی   \u{21BA}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'hederFont'),),
          )
        ],
      ),



    );
  }
}