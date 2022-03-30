import 'package:ctse_assignment_1/Controllers/QuestionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/quiz.dart';
import '../../styles.dart';
import '../../util/Quizes/quiz_crud_model.dart';
import '../progressbar.dart';
import 'questioncard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  int time, noOfQuestions;
  String category;
  Body(
      {Key? key,
      required this.time,
      required this.noOfQuestions,
      required this.category})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Question> docs1 = [];
  late QuestionController _questionController;
  //late AnimationController controller;

  List<Question> docs = [];
  BuildContext? context1;

  @override
  void initState() {
    super.initState();

    Provider.of<QuizCrudModel>(context, listen: false)
        .readQuizesByGrouping(widget.category)
        .then((value) => {
              //print(value),
              setState(() {
                docs1 = value;
              }),
              // docs1 = value
            });
    _questionController = Get.put(QuestionController());

    _questionController.setQuestionParameter(
        widget.noOfQuestions, widget.time, widget.category);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          // Text("Movie Categories", style: Styles.textSectionHeader),

          SizedBox(
            height: 10,
          ),
          Flexible(
            child: PageView.builder(
              // Block swipe to next qn
              physics: NeverScrollableScrollPhysics(),
              controller: _questionController.pageController,
              onPageChanged: _questionController.updateTheQnNum,
              itemCount: widget.noOfQuestions,
              itemBuilder: (context, index) => QuestionCard(
                question: docs1[index]!,
                index: index,
                itemCount: widget.noOfQuestions,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          ProgressBar(time: widget.time),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    ));
  }
}
