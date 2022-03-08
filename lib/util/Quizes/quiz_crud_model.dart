import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizCrudModel extends ChangeNotifier{

  // Steam Data For the Movies.
  final Stream<QuerySnapshot> _quizList = FirebaseFirestore.instance.collection('quizes').snapshots();

  // Getter for the User Steam.
  Stream<QuerySnapshot> get quizesList {
    return _quizList;
  }
}