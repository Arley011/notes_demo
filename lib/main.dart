import 'package:flutter/material.dart';
import './screens/notes_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List of notes',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(4, 159, 175, 1),
          accentColor: Color.fromRGBO(165, 234, 241, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoCondenced',
            ),
          ),
      ),
      home: NotesListScreen(),
    );
  }
}
