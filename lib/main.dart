

import 'package:ctse_assignment_1/screens/Sample%20Screen/sampleScreen.dart';

import 'package:ctse_assignment_1/screens/index_page.dart';
import 'package:ctse_assignment_1/screens/leader_board.dart';
import 'package:ctse_assignment_1/screens/movie_wiki.dart';
import 'package:ctse_assignment_1/screens/quice_configuration_screen.dart';
import 'package:ctse_assignment_1/screens/quiz_screen.dart';
import 'package:ctse_assignment_1/screens/score_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/movieWiki': (context) => const MovieWiki(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/quizScreen': (context) => QuizScreen(),
        '/samplescreen': (context) => SampleScreen(),
        '/scorescreen': (context) => ScorePage(),
        '/formscreen': (context) => DropDown(),
      },
      home: const IndexPage(),
    );
  }
}

