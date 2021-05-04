import 'package:chatapp/screens/auth_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit : StackFit.expand,
        children : <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xff4682B4),
              gradient: LinearGradient(
                colors: [new Color(0xff7DF9FF), new Color(0xff4682B4)],
                begin: Alignment.topCenter,
                ),
            )
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                CircleAvatar(
                  radius: 105.0,
                  child: Image.asset("assets/icon.png"),
                     
                ),
                SizedBox(height : 50),

                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Welcome To Chat App!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28
                    ),
                  ),
                ),

                SizedBox(height : 5),

                
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                      "Social Messaging app to connect with your friends.",
                      textAlign: TextAlign.center,
        
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                ),
                
                SizedBox(height : 10),

                Container(
                  width: double.infinity,
                  color: new Color(0xff212825),
                  height: 70,
                margin: EdgeInsets.only(top: 40),  
                  child: MaterialButton(
                    elevation: 0,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28
                        ),
                        ),
                        SizedBox(width : 10),
                        Icon(Icons.arrow_forward_ios,
                        color: Colors.white,
                        )

                      ],
                    ),
                    onPressed: ()
                    {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => AuthScreen()));
                    }),
                  ),
                
            ],
          )
        ]
      )
    );
  }
}