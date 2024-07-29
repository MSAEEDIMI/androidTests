import 'dart:ui';

import 'package:chat/components/rounded_button.dart';
import 'package:email_validator/email_validator.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id='regester';


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  late var ChekePas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 250.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            TextFormField(
              style: inputTextStyl,
              decoration:customInputDecoration.copyWith(hintText: 'Enter your email',labelText: "Email"),
              onChanged: (value) {
                //Do something with the user input
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) {
                return email != null && EmailValidator.validate(email) ? null : 'Pleas enter a valid email';
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: inputTextStyl,
              decoration:customInputDecoration.copyWith(hintText: 'Enter your password',labelText: "Password"),
              onChanged: (value) {
                //Do something with the user input
              },
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (Password) {
                ChekePas=Password;
                return Password != null && Password.length>=6 ? null : 'Pleas enter a valid password';
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: inputTextStyl,
              decoration:customInputDecoration.copyWith(hintText: 'Enter your password',labelText: "Password"),
              onChanged: (value) {
                //Do something with the user input
              },
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (Password) {
                return Password != null && Password==ChekePas ? null : 'the password not mach';
              },
            ),
            const SizedBox(
              height: 18.0,
            ),
            RundedButten(
                color: buttenTextColor,
                onPreesd:() {

                }, titel:'Register'),
            const SizedBox(height: 8),
            IconButton(
              icon: const Icon(Icons.arrow_back,color:textColor,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
