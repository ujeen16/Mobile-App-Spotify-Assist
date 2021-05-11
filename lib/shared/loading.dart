import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget  {
  @override 
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      child: Center(
        child: SpinKitCubeGrid(
          color: Colors.green,
          size: 50.0,
        ),
      ),
    );
  }
}