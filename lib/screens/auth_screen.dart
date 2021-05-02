import 'package:chatapp/widgets/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {

  

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _auth = FirebaseAuth.instance;

  var _isLoading = false;

   void _submitAuthForm(String email, 
   String username, 
   String password,
    bool isLogin,
    BuildContext ctx) async
  {
    AuthResult result;
    try
    {
      setState(() {
        _isLoading = true;
      });
          if(isLogin)
        {
          result = await _auth.signInWithEmailAndPassword(email: email, password: password);
        }
        else
        {
          result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
          Firestore.instance.collection('users').document(result.user.uid).setData({
            'username' : username,
            'email' : email
          });
        }
      }
      catch(err)
      {
        setState(() {
        _isLoading = false;
      });
        var message = 'An error occured.';
        if(err.message != null)
        {
          message = err.message;
        }

        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
          )
        );
      }
        
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}