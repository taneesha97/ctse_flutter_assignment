import 'package:ctse_assignment_1/Controllers/QuestionController.dart';
import 'package:ctse_assignment_1/service/quiz_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/quiz.dart';
import '../../util/Quizes/quiz_crud_model.dart';
import '../progressbar.dart';
import 'questioncard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Question> docs1 = [];
  QuestionController _questionController = Get.put(QuestionController());

  List<Question> docs = [];

  @override
  void initState() {
    super.initState();
    Provider.of<QuizCrudModel>(context, listen: false)
        .readQuizes()
        .then((value) => {
              setState(() {
                docs1 = value;
              }),
              // docs1 = value
            });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Flexible(
            child: PageView.builder(
              // Block swipe to next qn
              physics: NeverScrollableScrollPhysics(),
              controller: _questionController.pageController,
              onPageChanged: _questionController.updateTheQnNum,
              itemCount: docs1.length,
              itemBuilder: (context, index) => QuestionCard(
                question: docs1[index],
                index: index,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          ProgressBar(),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    ));
  }
}
