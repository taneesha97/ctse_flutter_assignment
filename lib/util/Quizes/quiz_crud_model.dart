import 'package:ctse_assignment_1/models/quiz.dart';
import 'package:ctse_assignment_1/models/result_quiz.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../Controllers/QuestionController.dart';

class QuizCrudModel extends ChangeNotifier {
  // Steam Data For the Movies.

  //QuerySnapshot querySnapshot = FirebaseFirestore.instance.collection('quizes').get() as QuerySnapshot<Object?>;
  final Stream<QuerySnapshot> _quizList =
      FirebaseFirestore.instance.collection('quizes').snapshots();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final QuestionController _controller = Get.put(QuestionController());

  late List<int?> valueSet;

  String QuizID = '';

  int noCorrectAnswers = 0;
  int AnsweredQuestions = 0;
  int noWrongAnswers = 0;

  Future<dynamic> readQuizes() async {
    QuerySnapshot querySnapshot;
    Stream<QuerySnapshot> _quizList;
    List docs = [];
    List<Question> docs1 = [];

    try {
      querySnapshot = await _db.collection('quizes').get();
      // _quizList = FirebaseFirestore.instance.collection('quizes').snapshots();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Question b = Question(
              id: doc['id'].toString(),
              question: doc['question'].toString(),
              answer: doc['answer'].toString(),
              options: doc['options'],
              imageUri: doc['imageUri'].toString());
          docs1.add(b);
        }
        return docs1;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> readQuizesByGrouping(String category) async {
    QuerySnapshot querySnapshot;
    Stream<QuerySnapshot> _quizList;
    List docs = [];
    List<Question> docs1 = [];

    try {
      querySnapshot = await _db
          .collection('quizes')
          .where('category', isEqualTo: category)
          .get();
      // _quizList = FirebaseFirestore.instance.collection('quizes').snapshots();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Question b = Question(
              id: doc['id'].toString(),
              question: doc['question'].toString(),
              answer: doc['answer'].toString(),
              options: doc['options'],
              imageUri: doc['imageUri'].toString());
          docs1.add(b);
        }
        return docs1;
      }
    } catch (e) {
      print(e);
    }
  }

}
