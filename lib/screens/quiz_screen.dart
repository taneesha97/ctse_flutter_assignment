import 'package:ctse_assignment_1/components/audio_quizes/audio_quiz_body.dart';
import 'package:ctse_assignment_1/components/quiz/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/QuestionController.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Movie Categories"),
        ),
      ),
      body: Body(),
    );
  }
}
