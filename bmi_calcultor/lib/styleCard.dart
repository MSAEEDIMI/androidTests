
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class cardStyle extends StatelessWidget {
  VoidCallback? onPeresd;
  Widget? child;
  Color? color;
  LinearGradient? gradient;
  cardStyle({this.color,this.child,this.onPeresd,this.gradient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPeresd,
      child: Container(
        child: child,
        decoration: BoxDecoration(
            gradient:  gradient,
            color: color ?? Color(0xffFEFEFE),
            borderRadius: BorderRadius.circular(10)
        ),
        margin:EdgeInsets.all(10),
      ),
    );
  }
}
