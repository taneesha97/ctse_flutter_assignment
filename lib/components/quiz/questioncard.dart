import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/QuestionController.dart';
import '../../models/quiz.dart';
import 'options.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;
  //comment

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromARGB(196, 151, 151, 163),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
                text: "${question.id}",
                style: Theme.of(context).textTheme.headline6,
                children: [
                  TextSpan(
                    text: "/10",
                    style: Theme.of(context).textTheme.headline6,
                  )
                ]),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.blueGrey),
          ),
          SizedBox(
            height: 8,
          ),
          Image.asset(
            "assets/images/movie1.jpg",
            height: 150,
            width: 300,
          ),
          SizedBox(
            height: 8,
          ),
          ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) => Options(
                    index: index,
                    text: question.options[index],
                    press: () => _controller.checkAns(question, index),
                  )),
        ],
      ),
    );
  }
}
