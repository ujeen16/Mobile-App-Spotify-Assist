import 'package:flutter/material.dart';
import 'package:error_test/models/artist.dart';

class ArtistTile extends StatelessWidget {

  //final Artist artist;
  //ArtistTile({ this.artist });
  final String artist;
  ArtistTile({this.artist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.green[700],
            backgroundImage: AssetImage('assets/clipart2885328.png'),
          ),
          //this prints a list of artists
          //title: Text(artist.myArtists.toString()),
          title: Text(artist),
          subtitle: Text('following'),
        ),
      )
    );
  }
}