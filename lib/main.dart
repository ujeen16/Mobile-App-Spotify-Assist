import 'package:flutter/material.dart';
import 'package:error_test/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:error_test/services/auth.dart';
import 'package:error_test/models/user.dart';

//this starts program
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home:  Wrapper(),
        ),
    );
  }
}
   

