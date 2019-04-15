import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'hero_animations.dart';
import 'navigate_to_new_screen_and_back.dart';
import 'navigate_with_names_routes.dart';
import 'pass_arguments_to_a_named_route.dart';
import 'return_data_from_a_screen.dart';
import 'send_data_to_a_new_screen.dart';

//hero animations
void main() => runApp(HeroApp());

//Navigate to a new screen and back
// void main() {
//   runApp(MaterialApp(
//     title: 'Navigation Basics',
//     home: FirstRoute(),
//   ));
// }

//navigate with named routes
// void main() {
//   runApp(MaterialApp(
//     title: 'Named Routes Demo',
//     // Start the app with the "/" named route. In our case, the app will start
//     // on the FirstScreen Widget
//     initialRoute: '/',
//     routes: {
//       // When we navigate to the "/" route, build the FirstScreen Widget
//       '/': (context) => FirstScreen(),
//       // When we navigate to the "/second" route, build the SecondScreen Widget
//       '/second': (context) => SecondScreen(),
//     },
//   ));
// }

//pass arguments to a named route
//void main() => runApp(MyApp());

//Return data from a screen 
// void main() {
//   runApp(MaterialApp(
//     title: 'Returning Data',
//     home: HomeScreen(),
//   ));
// }

//send data to a new screen
// void main() {
//   runApp(MaterialApp(
//     title: 'Passing Data',
//     home: TodosScreen(
//       todos: List.generate(
//         20,
//         (i) => Todo(
//               'Todo $i',
//               'A description of what needs to be done for Todo $i',
//             ),
//       ),
//     ),
//   ));
// }