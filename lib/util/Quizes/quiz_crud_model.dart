import 'package:ctse_assignment_1/models/quiz.dart';
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
      _quizList = FirebaseFirestore.instance.collection('quizes').snapshots();
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

  Future<dynamic> readQuizes1() async {
    // StreamBuilder<QuerySnapshot>(
    //   stream: _quizList,
    //   builder: (context, snapshot) =>
    //     // if (snapshot.hasError) {
    //     //   return const Text('Something went wrong');
    //     // }

    //     // if (snapshot.connectionState == ConnectionState.waiting) {
    //     //   return const Text("Loading");
    //     // }

    //     // return ListView(
    //     //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
    //     //     Map<String, dynamic> data =
    //     //         document.data()! as Map<String, dynamic>;
    //     //     return ListTile(
    //     //       title: Text(data['full_name']),
    //     //       subtitle: Text(data['company']),
    //     //     );
    //     //   }).toList(),
    //     // );

    // );
  }


  Future<void> updateValues(Question question, String selectedIndex) async {
    // valueSet = _controller.checkCorrectWrongAnswers(question, selectedIndex.toString())!;

    if(question.answer! == (int.parse(selectedIndex) + 1).toString()){
      noCorrectAnswers++;
      AnsweredQuestions++;
    }else if(question.answer! != (int.parse(selectedIndex) + 1).toString()){
      noWrongAnswers++;
      AnsweredQuestions++;
    }
    print(selectedIndex + '1');
    print('hiww');
    print(noCorrectAnswers);
    print(AnsweredQuestions);
    print(noWrongAnswers);
    print('hsss');
    try {
      await FirebaseFirestore.instance.collection('result-quizes').doc('ldGIa8qq6vyyKAPUepOa').update({
        'id': question.id ?? '',
        'no_questions': AnsweredQuestions ?? 0,
        'userId': 1 ?? '',
        'correct_answer': AnsweredQuestions ?? 0,
        'wrong_answer': noWrongAnswers ?? 0,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> create(String id, int no_questions, String userId, int correct_answer, int wrong_answer) async {
    try {
      await FirebaseFirestore.instance.collection('quizes').add({
        'id': id,
        'no_questions': no_questions,
        'userId': userId,
        'correct_answer': correct_answer,
        'wrong_answer': wrong_answer,
      });
    } catch (e) {
      print(e);
    }
  }

  // Getter for the User Steam.
  Stream<QuerySnapshot> get quizesList {
    return _quizList;
  }
}
