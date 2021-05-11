import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/cupertino.dart';
import 'package:error_test/models/artist.dart';
import 'package:error_test/models/user.dart';


class DatabaseService{

  //uid to be passed into the document below
  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference artistCollection = Firestore.instance.collection('artists');

  //used in the updating of data in the settings tab which updates artist
  /*
  Future updateUserData(String artist) async{
    return await artistCollection.document(uid).setData({
      'artist': artist,
    });
  }
}
*/
  //this will take a string and update a collection in a uid of the user
  //would like to be able to do this on every attempt of update button
  //String myArtists;
  Future<void> updateUserData(String curuid,List<dynamic> myArtist) async{
    return await artistCollection.document(uid).setData({
      'curuid': curuid,
      'myArtists': myArtist,
    });
  }

  // Artist list from snapshot
  List<Artist> _artistListFromSnapshot(QuerySnapshot snapshot) {
    //print(doc.data['myArtists']);
    return snapshot.documents.map((doc){
      return Artist(
        //porter: doc.data['porter'] ?? '',
        myArtists: doc.data['myArtists'] ?? [],
        curuid: doc.data['curuid'] ?? '',
      );
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      myArtists: snapshot.data['myArtists'],
    );
  }

   // get artists stream
   Stream<List<Artist>> get artists {
     return artistCollection.snapshots()
     .map(_artistListFromSnapshot);
   }

   //get the user doc stream
   Stream<UserData> get userData {
     return artistCollection.document(uid).snapshots()
     .map(_userDataFromSnapshot);
   }

   //the get artists stream is attempting to phase this code out 
/*
  Stream<QuerySnapshot> get artists {
    return artistCollection.snapshots();
  }
  */
}