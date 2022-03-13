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
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Question> docs1 = [];
  QuestionController _questionController = Get.put(QuestionController());

  late DatabaseService db;
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
              // docs1 = value,
              print('check is it working'),
              print(docs1[0].toJson()),
              print('ssss'),
            });
    // print('hello');
    // db = DatabaseService();
    // db.readQuizes().then((value) => {
    //       docs = value,
    //       print('hhhhh'),
    //       print(docs[0].toJson()),
    //       print('hhhhh salitha'),
    //       setState(() {
    //         docs = value;
    //       })
    //     });
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
              itemCount: 1,
              itemBuilder: (context, index) => QuestionCard(
                question: docs1[index],
                index: index,
              ),
            ),

            // child: PageView.builder(
            //   // Block swipe to next qn
            //   physics: NeverScrollableScrollPhysics(),
            //   controller: _questionController.pageController,
            //   onPageChanged: _questionController.updateTheQnNum,
            //   itemCount: docs.length,
            //   itemBuilder: (context, index) => QuestionCard(
            //     question: docs1[index],
            //     index: index,
            //   ),
            // ),
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
