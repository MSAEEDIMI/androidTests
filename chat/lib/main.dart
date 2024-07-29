import 'package:chat/firebase_options.dart';
import 'package:chat/lib/screens/welcome_screen.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/registration_screen.dart';
import 'package:chat/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';


import 'constants.dart';
import 'package:flutter/material.dart';

void main() async{
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(Chat());
}

class Chat extends StatelessWidget {
  Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context)=> WelcomeScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        ChatScreen.id:(context)=>ChatScreen(),
      },
    );
  }
}
