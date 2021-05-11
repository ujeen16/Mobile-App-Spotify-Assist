import 'package:error_test/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:error_test/services/auth.dart';
import 'package:error_test/shared/loading.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  //access validation with global key
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        elevation: 0.0,
        title: Text('Sign up'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () {
              widget.toggleView();
            }
          )
        ],
      ),
      resizeToAvoidBottomInset : false,
      body: 
        //this is what adds the text at the top 
        Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          children : <Widget>[
                    Container(
                        child:Stack(
                            children : <Widget>[
                                Container(
                                    //sign up is located here
                                    padding:EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
                                    child : Text(
                                        'Create Account',
                                        style:
                                TextStyle(fontSize : 50.0, fontWeight : FontWeight.bold),
                                    ),
                                    ),
      Container(
        padding:  EdgeInsets.symmetric(vertical: 150.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                //this is defined in shared constants folder/file
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                //look at value if true first option else null
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }           
              ),   
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Password'),
              obscureText: true,
              //turnery operator checking if password is at least 7 chars
              validator: (val) => val.length < 7 ? 'Enter a password with atleast 7 characters' : null,
              onChanged: (val) {
                setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              //was RaisedButton now is ElevatedButton
              RaisedButton(
                color: Colors.green[800],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  //if true than valid form else false means non valid
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    //idk why but sign in method is registering and register is signing in?????
                    //dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {    
                        loading = false;
                        error = 'please enter a valid email';
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