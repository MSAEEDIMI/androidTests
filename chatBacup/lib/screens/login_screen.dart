import 'package:email_validator/email_validator.dart';
import 'package:flutter/scheduler.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  static const String id='login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
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
              height: 48.0,
            ),
            TextFormField(
              style: inputTextStyl,
              decoration: customInputDecoration.copyWith(hintText: 'Enter your email',labelText: 'Email'),
              onChanged: (value) {
                //Do something with the user input
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) {
                return email != null && EmailValidator.validate(email) ? null : 'Pleas enter a valid email';
              },
            ),
            const SizedBox(
              height: 16,
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
                return Password != null && Password.length>=6 ? null : 'Pleas enter a valid password';
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Material(
                elevation: 5.0,
                color: buttenTextColor,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  onPressed: () {
                    //Implement login functionality
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                    style: buttmTextStyl,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
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
