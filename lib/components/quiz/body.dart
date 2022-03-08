import 'package:ctse_assignment_1/Controllers/QuestionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/quiz.dart';
import '../../util/Quizes/quiz_crud_model.dart';
import '../progressbar.dart';
import 'questioncard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QuestionController _questionController = Get.put(QuestionController());
    Stream<QuerySnapshot> movies =
        Provider.of<QuizCrudModel>(context, listen: false).quizesList;
    print(movies);

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
              itemCount: _questionController.questions.length,
              itemBuilder: (context, index) => QuestionCard(
                question: _questionController.questions[index],
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
