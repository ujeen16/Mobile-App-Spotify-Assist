import 'package:error_test/services/auth.dart';
import 'package:error_test/shared/constants.dart';
import 'package:error_test/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //when this is true the program is waiting for input from server 
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    //logic: if loading is true display Loading if false then the Scaffold
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleView();
            }
          )
        ],
      ),
      resizeToAvoidBottomInset : false,
      body:  
        Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child:Stack(
                  children : <Widget>[
                      Container(
                          //this is the logo at the top
                          padding:EdgeInsets.fromLTRB(30.0, 42.0, 0.0, 0.0),
                          child : Text('Welcome To Spotify',
                              style: TextStyle(
                                  fontSize : 40.0, fontWeight : FontWeight.bold)),
                          ),
                      Container(
                          //this is the logo at the top
                          padding:EdgeInsets.fromLTRB(70.0, 85.0, 0.0, 0.0),
                          child : Text('Pocket Playlist',
                              style: TextStyle(
                                  fontSize : 40.0, fontWeight : FontWeight.bold)),
                          ),
                       Container(
                          padding: EdgeInsets.fromLTRB(340.0, 75.0, 0.0, 0.0),
                          child : Text('!',
                            style: TextStyle(
                                  fontSize : 53.0,
                                  fontWeight : FontWeight.bold,
                                color : Colors.green[800])),
                         ),   
        Container(
        padding:  EdgeInsets.symmetric(vertical: 150.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }           
              ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Password'),
              obscureText: true,
              validator: (val) => val.length < 7 ? 'Enter a password with atleast 7 characters' : null,
              onChanged: (val) {
                setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0),
              //was Raised Button now Elevated Button
              RaisedButton(
                color: Colors.green[800],
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white)
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    //idk why but sign in method is registering and register is signing in?????
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    //dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    //once loading has finished end loading screen and display error in this case
                    if (result == null) {
                      setState(() {
                        error = 'could not sign in using user and password';
                        loading = false;
                      });
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
       ),   
                    ],
                    ),
              ),
        ],
      ),
    );
  }
}
