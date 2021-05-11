import 'package:error_test/models/user.dart';
import 'package:error_test/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on the FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //IMPORTANT IMPORTANT IMPORTANT
  //SIGN IN AND REGISTER ARE BACKWARDS OF LABELS!!!
  // sign in with email and password
  //take two parameters. asyncronous. get auth result and await on auth instance
  //signInWithEmailAndPassword is a firebase method
  //swap fire base user to custom class user
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
    
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //List empty = [];
      //await DatabaseService(uid: user.uid).updateUserData(user.uid.toString(), '');
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  
  // register with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      //creates a new user
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create document for user in fire base
      List empty = [];
      //print(empty);
      await DatabaseService(uid: user.uid).updateUserData(user.uid.toString(), empty);
      
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}