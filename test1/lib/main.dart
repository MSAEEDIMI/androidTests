import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const HomeScreen());
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(

                radius: 100,
                backgroundImage: AssetImage('images/mypic.jpg'),
              ),
            Text('mohammad saeedi'.toUpperCase(),style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'dancing'
              ),
            ),
            Text('coumputer enginearing'.toUpperCase(),style: TextStyle(
              letterSpacing: 2.5,
              fontFamily: 'rel',
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),
            SizedBox(height: 12,child: Container(height:2 ,color: Colors.black45,margin: EdgeInsets.all(5),),),

            // esay form

            Card(
              elevation: 0,
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 35),
              color: Colors.white,
              child: ListTile(
                leading:Icon(Icons.phone),
                title: Text('09383795866',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black54 ),),
              )
              ),
            Card(
                elevation: 0,
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 35),
                color: Colors.white,
                child: ListTile(
                  leading:Icon(Icons.email),
                  title: Text('MohammadSaeedimir',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black54 ),),
                )
            ),

            // dificalt form

            // Card(
            //   elevation: 0,
            //   margin: EdgeInsets.symmetric(vertical: 10,horizontal: 35),
            //   color: Colors.white,
            //   child: Padding(
            //     padding: const EdgeInsets.all(10),
            //     child: Row(children: [
            //       Icon(Icons.telegram_rounded),
            //       SizedBox(width: 20,),
            //       Text('@MohammadSaeedi',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black54 ),)
            //     ],),
            //   ),
            // ),


          ],
        )
      ),
    ));
  }
}



