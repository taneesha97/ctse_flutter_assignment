import 'package:ctse_assignment_1/components/quiz/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/QuestionController.dart';

class QuizScreen extends StatefulWidget {

  int time, noOfQuestions;
  String cattegory;
  QuizScreen({Key? key, required this.time, required this.noOfQuestions, required this.cattegory})
      : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Body(time: widget.time, noOfQuestions: widget.noOfQuestions, category: widget.cattegory ),
    );
  }
}
