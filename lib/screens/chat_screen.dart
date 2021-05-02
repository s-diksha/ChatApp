import 'package:chatapp/widgets/chat/messages.dart';
import 'package:chatapp/widgets/chat/new_messaages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  // @override
  // void initState()
  // {
  // 
  //   super.initState();
  //   final fbm = FirebaseMessaging();
  //   fbm.requestNotificationPermissions();
  //   fbm.configure(
  //     onMessage: (msg)
  //     {
  //       print(msg);
  //       return;
  //     },
  //     onLaunch : (msg)
  //     {
  //       print(msg);
  //       return;
  //     },
  //     onResume : (msg)
  //     {
  //       print(msg);
  //       return;
  //     },
  //   );
    
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        actions: <Widget>[
          DropdownButton(
            underline: Container(),
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,),
            
            items: [
              DropdownMenuItem(
                child: Container(
                  child : Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text("Logout"),
                    ]
                  )
              ),
              value: "Logout",
              )
            ], onChanged: (itemIdentifier) {
              if(itemIdentifier == "Logout")
              {
                FirebaseAuth.instance.signOut();
              }
            },
             )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Messages()
              ),
              NewMessages()
          ]

        )
      ),
          // body: StreamBuilder(
          //   stream : Firestore.instance.
          //   collection('chats/mmYrg3gyqZdD9g8nFTyW/messages')
          //   .snapshots()
          //   , builder: (ctx, streamSnapshot)
          //     {
          //       if(streamSnapshot.connectionState == ConnectionState.waiting)
          //       {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }
          //       final documents = streamSnapshot.data.documents;
          //     return ListView.builder(
          //           itemCount: documents.length,
          //           itemBuilder: (ctx, index) => Container(
          //             padding: EdgeInsets.all(10),
          //             child: Text(documents[index]['text'])
          //           ),
          //     );
        
          //     }),
          
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: ()
        //   {
        //     Firestore.instance.collection('chats/mmYrg3gyqZdD9g8nFTyW/messages').add({
        //       'text' : 'Added by click'
        //     });           
        //   }
        //   ),
    );
  }
}