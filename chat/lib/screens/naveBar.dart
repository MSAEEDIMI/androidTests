import 'package:chat/constants.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/welcome_screen.dart';
import 'package:chat/setvises/AuteServese.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NaveBar extends StatelessWidget {
  const NaveBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          ListTile(leading: const Icon(Icons.exit_to_app_outlined),title: Text("Exit",style: naveBarTextStyl,),onTap:() {
            Auteservese().signOut();
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushNamed(context, WelcomeScreen.id);
          })
        ],
      ),
    );
  }
}
