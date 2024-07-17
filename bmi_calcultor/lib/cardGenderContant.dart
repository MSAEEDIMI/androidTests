import 'package:bmi_calcultor/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class cardContant extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final Color? color;

  cardContant({this.icon,this.label,this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size: iconCardSize,color: color,),
        SizedBox(height: 13,),
        Text(label!,style: textStyle,),
      ],
    );
  }
}
