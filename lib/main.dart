import 'package:flutter/material.dart';
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
/*
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

class HomeScreen extends StatelessWidget {       
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

class SelectionButton extends StatelessWidget {  
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
    Scaffold.of(context)                                     
    ..removeCurrentSnackBar()      
    ..showSnackBar(SnackBar(content: Text('$result')));
  }
}
                                                         
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
                 Navigator.pop(context, 'Yep!');          
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
*/


class Todo {                                   //1 . - Define a Model for Todo, has title and description
  final String title;
  final String description;
  Todo(this.title, this.description);
}

void main() {                                 // generate the list view in the main function 
  runApp(MaterialApp(
    title: 'Passing Data',
    home: TodosScreen(
      todos: List.generate(
        20, (i) => Todo(
          'Todo $i',
          'A description of what needs to be done for Todo $i',
        ),),
    ),
    ));
}

class TodosScreen extends StatelessWidget {  
  final List<Todo> todos;
  TodosScreen({Key key, @required this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Todos'),
     ),
     body: ListView.builder(  
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todos[index].title),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(todo: todos[index]),),);
          },
        );
      },
    ),
   );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;
  DetailScreen({Key key, @required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(todo.description),
      ),
    );
  }
}