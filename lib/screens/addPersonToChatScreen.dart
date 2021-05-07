import 'package:chatapp/screens/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddToChat extends StatefulWidget {

  String username;

  AddToChat(this.username);

  @override
  _AddToChatState createState() => _AddToChatState();
}

class _AddToChatState extends State<AddToChat> {

  String userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userName = widget.username;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: null),
        title: Text("New Message"),
        actions : <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.menu
            ),
            onPressed: null,
          )
        ]
      ),
      body: StreamBuilder(
              stream: Firestore.instance.collection('users').snapshots(),
              builder: (ctx, streamSnapshot){
                if(streamSnapshot.connectionState == ConnectionState.waiting)
                {
                  return Center(child: CircularProgressIndicator());
                }
                  
                final chatUsers = streamSnapshot.data.documents;
                print(chatUsers.length);
                return  ListView.builder(
                    
                    itemCount: chatUsers.length,
                    itemBuilder: (ctx, index) => chatUsers[index]["username"] == userName ? SizedBox(height: 10):
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20 , vertical: 10
                        ),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/user.png"),
                              radius: 30,
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      chatUsers[index]['username'],
                                      style: TextStyle(
                                        fontSize: 16,
                                
                                        fontWeight: FontWeight.w400
                                        )
                                      ),
                                  ),
                                  
                                ],
                            ),
                            ),
                            
                          ],
                        ),
                      )
                    
                    );
              
              }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: null),

    );
          }
 
      
}