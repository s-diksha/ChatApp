import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {

  final _textControll = new TextEditingController();
  var _enteredMessage = '';

   void _sendMessage() async
  {
    FocusScope.of(context).unfocus();
     final user = await FirebaseAuth.instance.currentUser();
     final userData = await Firestore.instance.collection('users').document(user.uid).get();

    Firestore.instance.collection('chat').add({
      "text" : _enteredMessage,
      "createdAt" : Timestamp.now(),
      "userID" : user.uid,
      "username" : userData['username']
    });
    _textControll.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textControll,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                labelText: "Send a message",
                
              ),
              onChanged: (value)
              {
                setState(() {
                  _enteredMessage = value;
                });
              },
            )
            ),
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.send),
              onPressed: ()
              {
                if(_enteredMessage.trim().isNotEmpty)
                        _sendMessage();
              })
        ],
      )
    );
  }
}