import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/result_quiz.dart';
import 'package:ctse_assignment_1/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserCRUDModel extends ChangeNotifier {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<dynamic> insertUserData(Users? user) async {
    try {
      DocumentReference<Map<String, dynamic>> value =
      await FirebaseFirestore.instance.collection('User').add({
        'id': user?.id ?? '',
        'userName': user?.userName ?? '',
        'email': user?.email ?? '',
        'profileUrl': user?.profileUrl ?? '',
        'age': user?.age ?? '',
      });
      return true;
    } catch (e) {
      return false;
      print(e);
    }
  }

  Stream<List<Users>> getUserDetails(String id) {
    Stream<QuerySnapshot> streams =
    FirebaseFirestore.instance.collection('User').snapshots();

    return streams.map((event) => event.docs
        .map((doc) => Users(
        id: doc['id'].toString(),
        age: doc['age'].toString(),
        email: doc['email'].toString(),
        profileUrl: doc['profileUrl'].toString(),
        userName: doc['userName'].toString()
    ))
        .toList());
  }

  Future<dynamic> getLoginUser(String id) async {
    print(id);
    QuerySnapshot querySnapshot;
    Stream<QuerySnapshot> _quizList;
    List docs = [];
    List<Users> docs1 = [];

    try {
      querySnapshot = await _db
          .collection('User')
          .where('id', isEqualTo: id.toString())
          .get();

      // _quizList = FirebaseFirestore.instance.collection('quizes').snapshots();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          print(doc['id'].toString());
          Users b = Users(
              id: doc['id'].toString(),
              age: doc['age'].toString(),
              email: doc['email'].toString(),
              profileUrl: doc['profileUrl'].toString(),
              userName: doc['userName'].toString()
          );
          docs1.add(b);
        }
        return docs1;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getCorrectAnswers(String id) async {
    QuerySnapshot querySnapshot;
    Stream<QuerySnapshot> _quizList;

    try {
      querySnapshot = await _db
          .collection('result-quizes')
          .where('userId', isEqualTo: id.toString())
          .get();

      // _quizList = FirebaseFirestore.instance.collection('quizes').snapshots();
      if (querySnapshot.docs.isNotEmpty) {
        int? correctAns = 0;
        for (var doc in querySnapshot.docs.toList()) {
          correctAns = (correctAns! + doc['correct_answer']) as int?;
        }
        return correctAns;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getWrongAnswers(String id) async {
    QuerySnapshot querySnapshot;
    Stream<QuerySnapshot> _quizList;

    try {
      querySnapshot = await _db
          .collection('result-quizes')
          .where('userId', isEqualTo: id.toString())
          .get();

      // _quizList = FirebaseFirestore.instance.collection('quizes').snapshots();
      if (querySnapshot.docs.isNotEmpty) {
        int? wrong_answer = 0;
        for (var doc in querySnapshot.docs.toList()) {
          wrong_answer = (wrong_answer! + doc['wrong_answer']) as int?;
        }
        return wrong_answer;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getNoOfQuestions(String id) async {
    QuerySnapshot querySnapshot;
    Stream<QuerySnapshot> _quizList;

    try {
      querySnapshot = await _db
          .collection('result-quizes')
          .where('userId', isEqualTo: id.toString())
          .get();

      // _quizList = FirebaseFirestore.instance.collection('quizes').snapshots();
      if (querySnapshot.docs.isNotEmpty) {
        int? questions = 0;
        for (var doc in querySnapshot.docs.toList()) {
          questions = (questions! + doc['no_questions']) as int?;
        }
        return questions;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getHighestScore(String id) async {
    QuerySnapshot querySnapshot;
    Stream<QuerySnapshot> _quizList;

    try {
      querySnapshot = await _db
          .collection('result-quizes')
          .where('userId', isEqualTo: id.toString())
          .get();

      // _quizList = FirebaseFirestore.instance.collection('quizes').snapshots();
      if (querySnapshot.docs.isNotEmpty) {
        int highest = 0;
        for (var doc in querySnapshot.docs.toList()) {
          print(doc['correct_points']);
          if(doc['correct_points'] >= highest){
            highest = int.parse(doc['correct_points']);
          }
          //questions = (questions! + doc['no_questions']) as int?;
        }
        return highest;
      }
    } catch (e) {
      print(e);
    }
  }

  // Stream<int> getWrongAnswers1(String id) {
  //   int wrongAnswer = 0;
  //   Stream<QuerySnapshot> streams = FirebaseFirestore.instance
  //       .collection('result-quizes')
  //       .where('userId', isEqualTo: id.toString())
  //       .snapshots();
  //   streams.map((event) => event.docs
  //       .map((e) => {
  //     wrongAnswer = wrongAnswer + int.parse(e['wrong_answer'])
  //         //Object()
  //   }));
  //   return Stream.castFrom(wrongAnswer);
  //   //return wrongAnswer;
  //   // yeild wrong_answer;
  //   //wrongAnswer = (wrongAnswer! + e['wrong_answer'])
  // }

}
