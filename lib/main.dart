import 'package:chatapp/screens/auth_screen.dart';
import 'package:chatapp/screens/chatListScreen.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final FirebaseAuth auth = FirebaseAuth.instance;
    var uid ;

  Future<String> inputData() async {
    final FirebaseUser user = await auth.currentUser();
     uid = user.uid;
     print("User snap data");
      print(uid);
      final userData = await Firestore.instance.collection('users').document(uid).get();
     

  }

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.lightBlue,
        accentColor: Colors.blue,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.lightBlue,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius : BorderRadius.circular(20)
          )
        )
      ),
       home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged, 
        builder: ( (ctx, userSnapshot){
          // if(userSnapshot.connectionState == ConnectionState.waiting)
          // {
          //   return SplashScreen();
          // }
          // else
          // {
            if(userSnapshot.hasData)
            {
              return ChatScreen();
            }
          return AuthScreen();
                
          //}
            
          
        })
      ),
     );

  
  }

   
}




