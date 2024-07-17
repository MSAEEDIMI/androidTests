import 'package:bmi_calcultor/HomePage.dart';
import 'package:bmi_calcultor/result_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BmiCal());

class BmiCal extends StatelessWidget {
  const BmiCal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(BuildContext context)=> const  Homepage(),
        '/resultPage':(BuildContext context)=> ResultPage()
      },
      theme: ThemeData.dark().copyWith(
                primaryColor: Colors.black,
                scaffoldBackgroundColor:Color(0xff23232C),
      ),
    );
  }
}
