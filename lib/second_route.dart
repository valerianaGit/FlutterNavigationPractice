import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget { //working fine :)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Second Route'),
    ),
    body: Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Go Back to route 1'),
      )
    ),
    );
  }
}
