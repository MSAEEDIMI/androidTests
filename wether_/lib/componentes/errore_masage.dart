import 'package:flutter/material.dart';
import 'package:wether_/utilites/constants.dart';



class errore_Masage extends StatelessWidget {

  final String title,massage;
  errore_Masage({required this.title,required this.massage});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_sharp,size: 150,color:partsColor3,),
            const SizedBox(height: 20,),
            Text(title,style: tempDetaleTextStyle,textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
            Text(massage,style: degerrDiscrptionTextStyle,textAlign: TextAlign.center,)
          ],
      
      
      
        ),
      ),
    );
  }
}
