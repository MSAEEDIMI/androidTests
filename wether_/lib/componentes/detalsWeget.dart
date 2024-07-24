import 'package:flutter/material.dart';
import 'package:wether_/utilites/constants.dart';

class card_Style extends StatelessWidget {
  String? temp,discription;
  card_Style({required this.temp,required this.discription});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [Text('$temp',style: tempDetaleTextStyle,),SizedBox(width: 5,),Visibility(visible:discription=="WIND"?true:false,child: Text('km/hr',style:tempDetaleTiteleTextStyle,))],),SizedBox(height: 10,),Text("$discription",style: tempDetaleTiteleTextStyle,)],);
  }
}