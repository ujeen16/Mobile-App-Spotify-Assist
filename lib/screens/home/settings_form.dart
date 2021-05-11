import 'package:flutter/material.dart';
import 'package:error_test/shared/constants.dart';
import 'package:error_test/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:error_test/models/user.dart';
import 'package:provider/provider.dart';
import 'package:error_test/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  @override 
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  //make a List<String> artists = []
  //values would need to be added by the user
  //
  //this is what is updated using the form field
  String _currentName;

  //form values 

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData){

          UserData userData = snapshot.data;

          return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Update your artist settings',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.green[800],
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                //there is a string in _currentName this is the artist which is to 
                //be an attempted upload to the firebase and added album
                //NEED CODE TO NOT PRINT BUT CREATE A NEW COLLECTION IN FIREBASE
                onPressed: () async {
                  print(_currentName + 'working');
                  /*
                  if (_formKey.currentState.validate()) {
                    await DatabaseService(uid: user.uid).updateUserData(
                      user.uid,
                      _currentName
                      );                    
                  }
                  */
                  print(_currentName);
                  List nxtArtistList = [];
                  //this is all artists being followed
                  for (int i = 0; i < userData.myArtists.length; i++ ) {
                    print(userData.myArtists[i]);
                    nxtArtistList.add(userData.myArtists[i]);
                    print(nxtArtistList);
                  }
                  
                  //FirebaseUser user = result.user;
                  //await DatabaseService(uid: user.uid).updateUserData('new artist');
                }
              )
            ],
          ),
        );
        } else {
          return Loading();
        }
        
      }
    );
  }
}