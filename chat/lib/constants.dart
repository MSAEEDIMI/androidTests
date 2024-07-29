import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const textColor = Color(0xff211F20);
const textChatColor = Color(0xfffefefe);
const kChatEmailColor = Colors.white54;
const kSenderBoxColor = Colors.white12;
const buttenTextColor = Color(0xff9dd4ba);
const kSendButtonColor = Colors.blue;
var kRegisterButtonColor = Color(0xff8AC5A9);
const kBackgroundColor = Color(0xffEEEBD8);
const chatBackgroundColor = Color(0xef171705);

var kSendButtonTextStyle =TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
var welcomeTitel = GoogleFonts.blackOpsOne(
  color: textColor,
  fontWeight: FontWeight.bold,
  fontSize: 35,
);
var buttmTextStyl = GoogleFonts.righteous(
  color: textColor,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);
var chatsTextStyl = GoogleFonts.righteous(
  color: textChatColor,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);
var inputTextStyl = GoogleFonts.righteous(
  color: textColor,
  fontWeight: FontWeight.w300,
  fontSize: 16,
);
var eroresTextStyl = GoogleFonts.righteous(
  color: Colors.red,
  fontWeight: FontWeight.w100,
  fontSize: 13,
);
var naveBarTextStyl = GoogleFonts.righteous(
  color: Colors.red,
  fontWeight: FontWeight.w100,
  fontSize: 18,
);
const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.white60, width: 1),
  ),
);

const customInputDecoration= InputDecoration(
  hintText: 'somting',
  hintStyle: TextStyle(color: Colors.black26),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);