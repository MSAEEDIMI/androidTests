import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('dice'),
              backgroundColor: Colors.blue,
            ),
            body: DisePage(),
        ),
      ),
    );
  }
}

class DisePage extends StatefulWidget {
  const DisePage({super.key});

  @override
  State<DisePage> createState() => _DisePageState();
}

class _DisePageState extends State<DisePage> {
  int dicNum=1;
  int dicNum1=1;
  void changeDiceFace(){
    var randoma = Random();
    dicNum=(randoma.nextInt(6)+1);
    dicNum1=randoma.nextInt(6)+1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Row(
          children: [
            Expanded(child: TextButton(
                onPressed: (){
                  setState(() {
                    changeDiceFace();
                  });
                },
                child: Image.asset('imeges/$dicNum.png')),),
            Expanded(
              child: TextButton(
                  onPressed: (){
                    setState(() {
                      changeDiceFace();
                    });
                  },
                  child: Image.asset('imeges/$dicNum1.png')),)
          ],
        ),
      ),


    );
  }
}
