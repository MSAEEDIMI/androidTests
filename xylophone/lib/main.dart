import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AudioCache.instance = AudioCache(prefix: '');
    final player=AudioPlayer();

    return MaterialApp (
      home:Scaffold(
        appBar: AppBar(title: Text("همینجوری",style: TextStyle(fontSize: 30,),),backgroundColor: Colors.cyan,),
        body: SafeArea(
          child:Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () async{
                  await player.stop();
                },
                    child: Text('stop',style: TextStyle(fontSize:50,color: Colors.black),)
                ),
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: ()  async {
                    await  player.play(AssetSource('mu/11.mp3'));
                },
                  child: Text('start',style: TextStyle(fontSize:50,color: Colors.blueGrey),)
                ),
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: ()  async {
                  await  player.play(AssetSource('mu/1.wav'));
                },
                    child: Text('diling',style: TextStyle(fontSize:50,color: Colors.black),)
                ),
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}
