
import 'package:chat/components/rounded_button.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id='welcome';



  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,duration:const Duration(seconds: 5),);
    animation=CurvedAnimation(parent: controller, curve: Curves.easeOutCirc);
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kBackgroundColor.withOpacity(controller.value),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DefaultTextStyle(
                  style: welcomeTitel,
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText('M.Sa',speed: Duration(seconds: 1)),
                    ],
                  ),
                ),
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0* animation.value,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                DefaultTextStyle(
                  style: welcomeTitel,
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText('M.Sh',speed: Duration(seconds: 1)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0 ,
            ),
            RundedButten(
                color: kRegisterButtonColor,
                titel: 'Log in',
                onPreesd: () => Navigator.pushNamed(context,LoginScreen.id),),
            RundedButten(
              color: buttenTextColor,
              titel: 'Register',
              onPreesd: () => Navigator.pushNamed(context, RegistrationScreen.id),),
          ],
        ),
      ),
    );
  }
}

