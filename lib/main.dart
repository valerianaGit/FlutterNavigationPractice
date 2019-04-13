import 'package:flutter/material.dart';
//import 'second_route.dart';

/*void main() {
   runApp(MaterialApp(
     title: 'Navigation Basics',
     home: FirstRoute(),
   ));
   }
*/

/*void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => FirstRoute(),
      '/second': (context) => SecondRoute(),
      ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
    },
  ));
} 

class FirstRoute extends StatelessWidget { 
  final String title;                                 
    final String message;                              
    ScreenArguments(this.title,
        this.message);                                 
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
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {     
  static const routeName = '/extractArguments';
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
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
      )),
    );
  }
}
*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final ScreenArguments args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
      },
      title: 'Navigation with Arguments',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {      //1 . - DEFINE THE HOME SCREEN, LIKE SO 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning Data Demo'),
      ),
      body: Center(
        child: SelectionButton()),
      );
    
  }
}


class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}


class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';
  final String title;
  final String message;
  const PassArgumentsScreen({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
class ScreenArguments {               
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class SelectionButton extends StatelessWidget {   //2. - ADD BUTTON THAT LAUNCHES A SELECTION SCREEN
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option'),
    );
  }
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen()),);
    Scaffold.of(context)                                     //5 . - SHOW SNACKBAR WITH SELECTION
    ..removeCurrentSnackBar()      
    ..showSnackBar(SnackBar(content: Text('$result')));
  }
}
                                                         //3 . - SHOW SELECTION SCREEN WITH 2 BUTTONS
class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an Option'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                 Navigator.pop(context, 'Yep!');          //4 . - onPressed {close selection screen}
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                 Navigator.pop(context, 'Nope');
                },
                child: Text('Nope'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
