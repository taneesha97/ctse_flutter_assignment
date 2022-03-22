

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

  QuestionCard({Key? key, required this.question, required this.index, required this.itemCount})
      : super(key: key);
  // const QuestionCard({Key? key, required this.index}) : super(key: key);

  final Question question;
  final LocalStorage storage = new LocalStorage('localstorage_app');


  final String image = 'assets/images/movie1.jpg';
  //comment

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    onPress(Question question, int selectedIndex, String? questionID) {

      final QuizID = storage.getItem('QuizID');
      print(QuizID);
      print('questionCard');
      Provider.of<QuizResultCrudModel>(context, listen: false).updateValues(question, selectedIndex.toString(), QuizID);
      _controller.checkAns(question, selectedIndex.toString());
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(196, 151, 151, 163),
          borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                  text: "${index + 1}",
                  //text: "${question.id}",
                  style: Theme.of(context).textTheme.headline6,
                  children: [
                    TextSpan(
                      text: "/${itemCount}",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ]),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                //movieList[index].title.toString()
                question.question.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                if (question.imageUri.toString() != "") ...[
                  Image.network(
                    question.imageUri.toString(),
                    height: 170,
                    width: 150,
                  ),
                ] else ...[
                  SizedBox(
                    height: 2,
                  ),
                ],
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (context, index1) => Options(
                            index: index1,
                            text: question.options![index1],
                            press: () => onPress(question, index1, question.id),
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
