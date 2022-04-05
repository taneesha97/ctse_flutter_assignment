import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/user.dart';
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
              userName: doc['userName'].toString());
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

  int getWrongAnswers1(String id) {
    int? wrong_answer = 0;
    FirebaseFirestore.instance
        .collection('result-quizes')
        .where('userId', isEqualTo: id.toString())
        .snapshots()
        .map((event) => event.docs
        .map((e) => {
          print('wrongCount'),
          print(e['wrong_answer']),
    }));
    return wrong_answer;
  }

}
