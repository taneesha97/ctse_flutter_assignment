
import 'package:ctse_assignment_1/screens/quiz_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter app",
      home: QuizScreen(),
      // routes: <String, WidgetBuilder>{
      //   '/first': (context) => HomePage(),
      //   '/second': (context) => SecondScreen("Second Screen"),
      // },
      
    );
  }
}

