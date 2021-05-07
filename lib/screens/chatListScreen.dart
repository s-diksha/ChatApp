import 'package:chatapp/screens/addPersonToChatScreen.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {
  String username;

  ChatListScreen(this.username);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {

  String userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Username is ");
    
    userName = widget.username;
    print(userName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: null),
        title: Text("Chats"),
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
              stream: Firestore.instance.collection('chat').orderBy('createdAt', descending: true).snapshots(),
              builder: (ctx, streamSnapshot){
                if(streamSnapshot.connectionState == ConnectionState.waiting)
                {
                  return Center(child: CircularProgressIndicator());
                }
                  
                final chatUsers = streamSnapshot.data.documents;
                
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
                                      chatUsers[index]['username'] ,
                                      style: TextStyle(
                                        fontSize: 16,
                                
                                        fontWeight: FontWeight.w400
                                        )
                                      ),
                                  ),
                                  
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Opacity(
                                      opacity: 0.64,
                                      child: Text(chatUsers[index]['text'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                        )
                                      ),
                                  )
                                ],
                            ),
                            ),
                            
                            Text("1:11 pm"),
                            
                          ],
                        ),
                      )
                    
                    );
              
              }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: ()
        {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => AddToChat(userName) ),);
        }),

    );
          }
 
      
}