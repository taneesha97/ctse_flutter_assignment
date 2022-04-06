

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/user_history_model.dart';
import 'package:flutter/material.dart';

import '../../models/result_quiz.dart';

class UserHistoryCrudModel extends ChangeNotifier {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<dynamic> readUserHistory() async {
    QuerySnapshot querySnapshot;
    Stream<QuerySnapshot> _quizList;
    List docs = [];
    List<UserHistoryModel> docs1 = [];

    try {
      querySnapshot = await _db.collection('user_history').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          UserHistoryModel b = UserHistoryModel(
            // id: doc['id'].toString(),
              id: doc.id,
              score: doc['Score'],
              Quiz_ID: doc['Quiz ID'].toString());

          docs1.add(b);
        }
        print(docs1);
        return docs1;
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<dynamic> readUserHistoryDetails(String uID) async {
  //   QuerySnapshot querySnapshot;
  //   List<ResultQuiz> docs1 = [];
  //   try {
  //     querySnapshot = await _db
  //         .collection('result-quizes')
  //         .where('userId', isEqualTo: uID)
  //         .get();
  //     if (querySnapshot.docs.isNotEmpty) {
  //       for (var doc in querySnapshot.docs.toList()) {
  //         ResultQuiz b = ResultQuiz(
  //             id: doc.id,
  //             correct_answer: doc['correct_answer'],
  //             no_questions: doc['no_questions'],
  //             wrong_answer: doc['wrong_answer'], //correct_points
  //             userId: doc['userId'].toString(),
  //             correct_points: doc['correct_points'],
  //             date: doc['date'].toString(),
  //             category: doc['category'].toString()
  //         );
  //         //
  //
  //         docs1.add(b);
  //       }
  //       return docs1;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Stream<List<ResultQuiz>> readUserHistoryDetails(String uID) {
    Stream<QuerySnapshot> streams =
    FirebaseFirestore.instance.collection('result-quizes')
        .where('userId', isEqualTo: uID).snapshots();

    return streams.map((event) => event.docs
        .map((doc) => ResultQuiz(
        id: doc.id,
        correct_answer: doc['correct_answer'],
        no_questions: doc['no_questions'],
        wrong_answer: doc['wrong_answer'], //correct_points
        userId: doc['userId'].toString(),
        correct_points: doc['correct_points'],
        date: doc['date'].toString(),
        category: doc['category'].toString()
    ))
        .toList());
  }


}