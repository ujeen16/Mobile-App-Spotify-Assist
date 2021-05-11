import 'package:flutter/material.dart';
//this has been phased out
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:error_test/models/user.dart';
import 'package:error_test/models/artist.dart';
import 'package:error_test/screens/home/artist_tile.dart';

class  ArtistList extends StatefulWidget {
  @override
  _ArtistListState createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  @override
  Widget build(BuildContext context) {

    //phase out from querysnapshot to list of artists
    final artists = Provider.of<List<Artist>>(context) ?? [];

    //artists.forEach((artist) {
    //  print(artist.artists);
    //  print(artist.porter);
    //});
    //print(artists.documents);

    //this is for testing*****************
    //artists.forEach((artist) {
    //  print(artist.porter);
  //  });

    //check list of users for the user when they equal its the user
    //then display every collection that user has
/*
    final user = Provider.of<User>(context);
    for (var doc in artists.documents) {
      if (user.uid == doc.documentID){
        print(doc.data);
        }

      }
  */
    final user = Provider.of<User>(context);
    //print(user.uid);
    //print(artists.length);
    //print(artists.first.myArtists.length);
    //print(artists.length);
    //print(artists.first.curuid);
    //print('artists curuid[1]   ' + artists[1].curuid);
    //print('artists curuid[0]   ' + artists[0].curuid);
    //print('user.uid   ' + user.uid);
    //artists.forEach((artist) {
    //  print(artist.myArtists);
    //  print(artist.curuid);
    //});
    List count(){
      for (int num = artists.length; num > 0 ; num--) {
      //this cycles through all users
        if (artists[num-1].curuid == user.uid) {
          //this checks the user id vs the curuid by index
          //it finds the actual index of the user
          //returns num of elements in the list of artists
          int numItems = artists[num-1].myArtists.length;
          int index = num - 1;
          return [numItems, index];
        }
      }
    }
    List helper = count();
    final int number_of_items = helper[0];
    final int proper_index = helper[1];

    return ListView.builder(
      itemCount: number_of_items,
      itemBuilder: (context, index) {
          return ArtistTile(artist: artists[proper_index].myArtists[index]);
          //print(artists[index].curuid);
          //print(user.uid);
          /*
          print("blah");
          print("this is index");
          print(index);
          //print(artists[1].myArtists.length);
          for (int num = artists.length; num > 0 ; num--) {
            print('idk');
            print(num);
            print("this is index");
            print(index);
            print(artists[num-1].curuid);
            if (user.uid == artists[num-1].curuid){
              print('match');
            }
            else {
              print('no match');
            }
            if (artists[num - 1].curuid == user.uid) {
              print("list testing");
              print(artists[num-1].myArtists[0]);
              return ArtistTile(artist: artists[num-1].myArtists[index]);
          }}
          
          print('something went wrong');
          //return ArtistTile(artist: artists[0]);
          return ArtistTile(artist: artists[0].myArtists[0]);
          */
      },
    );
    //return Container(

      
    //);
  }
}
