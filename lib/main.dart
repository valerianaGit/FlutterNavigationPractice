import 'package:flutter/material.dart';
//import 'second_route.dart';

/*void main() {
   runApp(MaterialApp(
     title: 'Navigation Basics',
     home: FirstRoute(),
   ));
   }
*/

void main() {
  runApp(MaterialApp(
title: 'Named Routes Demo',
initialRoute: '/',
routes: {
  '/': (context) => FirstRoute(),
  '/second': (context) => SecondRoute(),
},
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
               //Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()),);
               Navigator.pushNamed(context, '/second');
             },
           ),
         ),
         );
     }
   }

   class SecondRoute extends StatelessWidget { //git push -u developer [in commadLine -to push to GitHub.]
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



