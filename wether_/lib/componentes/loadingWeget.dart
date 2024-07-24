import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loadingweget extends StatelessWidget {
  const Loadingweget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          SpinKitSpinningLines(color: Colors.yellowAccent,size: 200,),
          SizedBox(height: 50,),
          Text("Loading Data ...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
