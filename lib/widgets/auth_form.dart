import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {

  AuthForm(this.submitFn, this.isLoading);
  final bool isLoading;
  final void Function (String email, String username, String password, bool isLogin, BuildContext ctx) submitFn;
  
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';


  void _submit()
  {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if(isValid)
    {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userName.trim(), _userPassword.trim(), _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      key: ValueKey('email'),
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      enableSuggestions: false,
                      validator: (value)
                      {
                        if(value.isEmpty || !value.contains('@'))
                        {
                          return 'Please enter valid Email';
                        }
                        else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address'
                      ),
                      onSaved: (value)
                      {
                        _userEmail = value;
                      },
                    ),
                    if(!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value)
                      {
                        if(value.isEmpty || value.length < 7)
                        return 'Please enter atleast 7 characters';
                        else
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username'
                        ),
                        onSaved: (value)
                      {
                        _userName = value;
                      },
                    ),
                    TextFormField(
                      key: ValueKey('password'),
                      validator: (value)
                      {
                        if(value.isEmpty || value.length < 7){
                          return 'Please enter atleat 7 characters';
                        }
                        else
                        {
                          return null;
                          }
                      },
                      decoration: InputDecoration(
                        labelText : 'Password',
                      ),
                      onSaved: (value)
                      {
                        _userPassword = value;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 15),

                    if(widget.isLoading) CircularProgressIndicator(),
                    if(!widget.isLoading)
                    RaisedButton(
                      child: Text(_isLogin ? "Login" : "Sign Up"),
                      onPressed: _submit
                    ),
                    if(!widget.isLoading)
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(_isLogin ? "Create New Account" : "Already have an Account"),
                      onPressed: (){
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    
                    )
                  ]
                )
                ),
            ),        
          ),
        ),
      );
  }
}