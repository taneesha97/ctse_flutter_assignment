import 'package:ctse_assignment_1/util/Quiz_Result/quiz_result_crud_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import '../../Controllers/QuestionController.dart';
import '../../models/quiz.dart';
import '../../util/Quizes/quiz_crud_model.dart';
import 'options.dart';

class QuestionCard extends StatelessWidget {
  final int index;
  final int itemCount;
  final Question question;

  QuestionCard(
      {Key? key,
      required this.question,
      required this.index,
      required this.itemCount})
      : super(key: key);
  // const QuestionCard({Key? key, required this.index}) : super(key: key);

  final LocalStorage storage = new LocalStorage('localstorage_app');

  //final String image = 'assets/images/movie1.jpg';
  //comment

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    onPress(Question question, int selectedIndex, String? questionID) {
      final QuizID = storage.getItem('QuizID');
      print(QuizID);
      print('questionCard');
      Provider.of<QuizResultCrudModel>(context, listen: false)
          .updateValues(question, selectedIndex.toString(), QuizID);
      _controller.checkAns(question, selectedIndex.toString());
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(196, 151, 151, 163),
              Colors.white,
            ],
          )),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // SizedBox(
              //   height: 4,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent, shape: BoxShape.circle),
                    child: Text.rich(
                      TextSpan(
                        text: "${index + 1}",
                        //text: "${question.id}",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      //movieList[index].title.toString()
                      question.question.toString(),
                       style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),

              // SizedBox(
              //   height: 8,
              // ),

              SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  if (question.imageUri.toString() != "") ...[
                    Image.network(
                      question.imageUri.toString(),
                      height: 150,
                      width: 170,
                    ),
                  ] else ...[

                    Image.network(
                      'https://cdn1.vectorstock.com/i/1000x1000/50/20/no-photo-or-blank-image-icon-loading-images-vector-37375020.jpg',
                      height: 150,
                      width: 170,
                    ),
                  ],
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        itemBuilder: (context, index1) => Options(
                              index: index1,
                              text: question.options![index1],
                              press: () =>
                                  onPress(question, index1, question.id),
                            )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
