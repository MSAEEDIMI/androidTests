import 'package:chat/components/massageBoxDecorate.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/naveBar.dart';
import 'package:chat/setvises/AuteServese.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String id ="chatScreen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _fierStore=FirebaseFirestore.instance;
  TextEditingController _massageContoroler=TextEditingController();
  void messageStream(){
    _fierStore.collection('massages').snapshots().listen((event) {
      for(var masseage in event.docs){
        print(masseage.data());
      }
    },);
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: NaveBar(),
      backgroundColor: chatBackgroundColor,
      appBar: AppBar(
        backgroundColor: chatBackgroundColor,
        leading: null,
        title:  Text('Chat',style: welcomeTitel.copyWith(color: Colors.lightBlueAccent),textAlign: TextAlign.center,),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream:_fierStore.collection('massages').orderBy('data',descending: true).snapshots(),
                builder: (context, snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return const Expanded(child: Center(child: CircularProgressIndicator(backgroundColor: Colors.cyan,),));
                  }
                  if(snapshot.hasData){
                    var massages=snapshot.data!.docs;
                    List<Widget> messageWigets=[];
                    for(var massage in massages){
                      var massageText=massage.get('text');
                      var sender=massage.get('sender');
                      Widget massageWidget= MessageBox(
                        massage: massageText,
                        sender: sender,
                        isMe: Auteservese().getCurrentUser!.email==sender
                      );
                      messageWigets.add(massageWidget);
                    }
                    return Expanded(child: ListView(reverse:true,children: messageWigets,));
                  }else{
                    return Center(child: Text('snapshut has no data'),);
                  }
                },
            ),

            Container(
              decoration: kMessageContainerDecoration,
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _massageContoroler,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _fierStore.collection('massages').add({
                        'data':DateTime.now().millisecondsSinceEpoch,
                        'text':_massageContoroler.text,
                        'sender':Auteservese().getCurrentUser!.email,
                      });
                      _massageContoroler.clear();
                      messageStream();
                    },
                    child: const Icon(Icons.send,
                        size: 30, color: kSendButtonColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


