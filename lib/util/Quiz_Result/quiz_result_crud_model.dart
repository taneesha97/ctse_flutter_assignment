

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/quiz.dart';
import '../../models/result_quiz.dart';

class QuizResultCrudModel extends ChangeNotifier {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  int noCorrectAnswers = 0;
  int AnsweredQuestions = 0;
  int noWrongAnswers = 0;


  Future<dynamic> readQuizResultsByID(String id) async {
    QuerySnapshot querySnapshot;
    List<ResultQuiz> docs1 = [];
    try {
      querySnapshot = await _db
          .collection('result-quizes').where(FieldPath.documentId, isEqualTo: id).get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {

          ResultQuiz b = ResultQuiz(
              id: doc['id'],
              correct_answer : doc['correct_answer'],
              no_questions : doc['no_questions'],
              wrong_answer : doc['wrong_answer'],
              userId : doc['userId'].toString());


          docs1.add(b);
        }
        return docs1;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateValues(
      Question question, String selectedIndex, String QuizID1) async {
    // valueSet = _controller.checkCorrectWrongAnswers(question, selectedIndex.toString())!;
    if (question.answer! == (int.parse(selectedIndex) + 1).toString()) {
      noCorrectAnswers++;
      AnsweredQuestions++;
    } else if (question.answer! != (int.parse(selectedIndex) + 1).toString()) {
      noWrongAnswers++;
      AnsweredQuestions++;
    }
    try {
      await FirebaseFirestore.instance
          .collection('result-quizes')
          .doc(QuizID1)
          .update({
        'correct_answer': noCorrectAnswers ?? 0,
        'wrong_answer': noWrongAnswers ?? 0,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> ReAttemptQuizResult(String QuizID1) async {

    QuerySnapshot querySnapshot;

    try {
      querySnapshot = await _db
          .collection('result-quizes').where(FieldPath.documentId, isEqualTo: QuizID1).get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          if(doc['id'] == 0){
            await FirebaseFirestore.instance
                .collection('result-quizes')
                .doc(QuizID1)
                .update({
              'id': 1 ?? '',
              'correct_answer': 0,
              'wrong_answer': 0,
            });
          }else if(doc['id'] == 1){
            await FirebaseFirestore.instance
                .collection('result-quizes')
                .doc(QuizID1)
                .update({
              'id': 2 ?? '',
              'correct_answer': 0,
              'wrong_answer': 0,
            });

          }else if(doc['id'] == 2){
            await FirebaseFirestore.instance
                .collection('result-quizes')
                .doc(QuizID1)
                .update({
              'id': 3 ?? '',
              'correct_answer': 0,
              'wrong_answer': 0,
            });
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }


  Future<dynamic> insertQuizData(int noQuestions, String userId) async {
    try {
      DocumentReference<Map<String, dynamic>> value =
      await FirebaseFirestore.instance.collection('result-quizes').add({
        'id': 0,// need to changed to reattempt id
        'no_questions': noQuestions ?? 0,
        'userId': userId ?? '',
        'correct_answer': 0,
        'wrong_answer': 0,
      });
      return value.id.toString();
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> deleteQuizResult(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('result-quizes')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }


}