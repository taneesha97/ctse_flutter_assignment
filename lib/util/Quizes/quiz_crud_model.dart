import 'package:ctse_assignment_1/models/quiz.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizCrudModel extends ChangeNotifier {
  // Steam Data For the Movies.

  //QuerySnapshot querySnapshot = FirebaseFirestore.instance.collection('quizes').get() as QuerySnapshot<Object?>;
  final Stream<QuerySnapshot> _quizList =
      FirebaseFirestore.instance.collection('quizes').snapshots();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<dynamic> readQuizes() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    List<Question> docs1 = [];

    try {
      querySnapshot = await _db.collection('quizes').get();
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

  // Getter for the User Steam.
  Stream<QuerySnapshot> get quizesList {
    return _quizList;
  }
}
