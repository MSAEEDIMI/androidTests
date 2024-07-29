import 'dart:ui';

import 'package:chat/components/rounded_button.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:chat/setvises/AuteServese.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id='regester';


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  late var ChekePas;
  final TextEditingController _emailContoroler=TextEditingController();
  final TextEditingController _passContoroler=TextEditingController();
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  String  erroe=' ';
  bool erroreIsEcord=false , showSpiner=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:ListView(
            children:[ Column(
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
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: inputTextStyl,
                        decoration:customInputDecoration.copyWith(hintText: 'Enter your email',labelText: "Email"),
                        controller: _emailContoroler,
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: inputTextStyl,
                  decoration:customInputDecoration.copyWith(hintText: 'Enter your password',labelText: "Password"),
                  controller: _passContoroler,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (Password) {
                    return Password != null && Password==ChekePas ? null : 'the password not mach';
                  },
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Visibility(
                    visible: erroreIsEcord,
                    child: Text(erroe,style: eroresTextStyl,textAlign: TextAlign.center,)),
                RundedButten(
                    color: buttenTextColor,
                    onPreesd:() async{
                        if(_formkey.currentState!.validate()){
                          try{
                            setState(() {
                              erroreIsEcord=false;
                              showSpiner=true;
                            });
                            await Auteservese().createUserWithEmailAndPassword(
                                email: _emailContoroler.text,
                                password: _passContoroler.text).then((value){
                              Navigator.pop(context);
                              Navigator.pushNamed(context, ChatScreen.id);
                            });
                            setState(() {
                              showSpiner=false;
                            });
                          }catch(e){
                           setState(() {
                             showSpiner=false;
                             erroreIsEcord=true;
                             // erroe=e.toString().split('] ')[1];
                             print(e);
                           });
                          }
                        }
                    }, titel:'Register'),
                const SizedBox(height: 8),
                IconButton(
                  icon: const Icon(Icons.arrow_back,color:textColor,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),]
          ),
        ),
      ),
    );
  }
}
