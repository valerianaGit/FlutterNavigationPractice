import 'package:flutter/material.dart';
import 'second_route.dart';

void main() {
   runApp(MaterialApp(
     title: 'Navigation Basics',
     home: FirstRoute(),
   ));
   }

   class FirstRoute extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: Text('First Route - VC'),
         ),
         body: Center(
           child: RaisedButton(
             child: Text('Second Route this way!'),
             onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()),
               );
             },
           ),
         ),
         );
     }
   }



