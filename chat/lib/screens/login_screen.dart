import 'package:chat/screens/chat_screen.dart';
import 'package:chat/screens/welcome_screen.dart';
import 'package:chat/setvises/AuteServese.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  static const String id='login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailContoroler=TextEditingController();
  final TextEditingController _passwordContoroler=TextEditingController();
  String  erroe=' ';
  bool erroreIsEcord=false , showSpiner=false;

  late final GlobalKey<FormState> _formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(

            children:[ Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 150,),
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailContoroler,
                        style: inputTextStyl,
                        decoration: customInputDecoration.copyWith(hintText: 'Enter your email',labelText: 'Email'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) {
                          return email != null && EmailValidator.validate(email) ? null : 'Pleas enter a valid email';
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _passwordContoroler,
                        style: inputTextStyl,
                        decoration:customInputDecoration.copyWith(hintText: 'Enter your password',labelText: "Password"),
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (Password) {
                          return Password != null && Password.length>=6 ? null : 'Pleas enter a valid password';
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 24.0,
                ),
                Visibility(
                    visible: erroreIsEcord,
                    child: Text(erroe,style: eroresTextStyl,textAlign: TextAlign.center,)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Material(
                    elevation: 5.0,
                    color: buttenTextColor,
                    borderRadius: BorderRadius.circular(10.0),
                    child: MaterialButton(
                      onPressed: () async{
                       if(_formKey.currentState!.validate()){
                         try{
                           setState(() {
                             erroreIsEcord=false;
                             showSpiner=true;
                           });
                           await Auteservese().signInWithEmailAndPassword(
                               email: _emailContoroler.text,
                               password: _passwordContoroler.text).then((value){
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
                             erroe=e.toString().split('] ')[1];
                           });
                         }
                       }
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
                    Navigator.pushNamed(context, WelcomeScreen.id);
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
