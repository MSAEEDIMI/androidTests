import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  String? massage,sender;
  bool? isMe;
  MessageBox({super.key,this.massage,this.sender,this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: isMe! ? Alignment.centerLeft:Alignment.centerRight,
        child: Material(
            borderRadius: BorderRadius.only(
              bottomRight: isMe! ? Radius.circular(10):Radius.circular(0),
              bottomLeft: isMe! ? Radius.circular(0):Radius.circular(10),
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            color: isMe! ? Colors.redAccent:Colors.blueAccent,
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: isMe!?CrossAxisAlignment.start:CrossAxisAlignment.end,
                children: [
                  Text('$sender',style: chatsTextStyl.copyWith(color: Colors.white60,fontWeight: FontWeight.w100,fontSize: 12),),
                  SizedBox(height: 8,),
                  Text('$massage',style: chatsTextStyl,),
                ],
              ),
            )
        ),
      ),
    );
  }
}
