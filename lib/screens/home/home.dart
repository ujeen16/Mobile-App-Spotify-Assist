import 'package:error_test/screens/home/settings_form.dart';
import 'package:flutter/material.dart';
import 'package:error_test/services/auth.dart';
import 'package:error_test/services/database.dart';
import 'package:provider/provider.dart';
//this is not needed after phase out
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:error_test/screens/home/artist_list.dart';
import 'package:error_test/models/artist.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    //this is the settings widget that updates artists
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    //Phase out changing from Querysnapshot to list artist
    return StreamProvider<List<Artist>>.value(
        value: DatabaseService().artists,
        child: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text('Pocket Playlist'),
          backgroundColor: Colors.green[800],
          elevation: 0.0,
          actions: <Widget>[
            //this was FlatButton now TextButton 
            //I undid this change reverted flutter version
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/jing.fm-baby-its-cold-outside-2174728.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ArtistList()
          ),
      ),
    );
  }
}