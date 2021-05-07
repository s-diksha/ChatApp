import 'package:chatapp/screens/auth_screen.dart';
import 'package:chatapp/screens/chatListScreen.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
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
        builder: ( (ctx, userSnapshot) {
          // if(userSnapshot.connectionState == ConnectionState.waiting)
          // {
          //   return SplashScreen();
          // }
          if(userSnapshot.hasData)
          {
            print("User snap data");
            print(userSnapshot.data);
            //return ChatScreen();
            //return ChatListScreen("sdiksha");
          }
          //return AuthScreen();
          return SplashScreen();
        })
      ),
     );
  }
}



