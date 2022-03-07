import 'package:ctse_assignment_1/Controllers/QuestionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/quiz.dart';
import '../progressbar.dart';
import 'questioncard.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QuestionController _questionController = Get.put(QuestionController());

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
              itemBuilder: (context, index) =>
                  QuestionCard(question: _questionController.questions[index], index: index,),
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
