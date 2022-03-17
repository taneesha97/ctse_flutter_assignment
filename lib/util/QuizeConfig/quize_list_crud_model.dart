import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/quize_list_model.dart';
import 'package:flutter/cupertino.dart';

class QuizListCrudModel extends ChangeNotifier {
  // Steam Data For the Movies.

  //QuerySnapshot querySnapshot = FirebaseFirestore.instance.collection('quizes').get() as QuerySnapshot<Object?>;
  final Stream<QuerySnapshot> _quizList =
  FirebaseFirestore.instance.collection('quice_list').snapshots();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // final QuestionController _controller = Get.put(QuestionController());

  late List<int?> valueSet;

  String QuizID = '';

  // int noCorrectAnswers = 0;
  // int AnsweredQuestions = 0;
  // int noWrongAnswers = 0;

  Future<dynamic> readQuizList() async {
    QuerySnapshot querySnapshot;
    Stream<QuerySnapshot> _quizList;
    List docs = [];
    List<QuizList> docs1 = [];

    try {
      querySnapshot = await _db.collection('quice_list').get();
      _quizList = FirebaseFirestore.instance.collection('quice_list').snapshots();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          QuizList b = QuizList(
              id: doc['id'].toString(),
              category: doc['category'].toString(),
              time: doc['time'],
              questions: doc['questions']);

          docs1.add(b);
        }
        return docs1;
      }
    } catch (e) {
      print(e);
    }
  }




  // Future<void> updateValues(Question question, String selectedIndex, String QuizID1) async {
  //   // valueSet = _controller.checkCorrectWrongAnswers(question, selectedIndex.toString())!;
  //   if(question.answer! == (int.parse(selectedIndex) + 1).toString()){
  //     noCorrectAnswers++;
  //     AnsweredQuestions++;
  //   }else if(question.answer! != (int.parse(selectedIndex) + 1).toString()){
  //     noWrongAnswers++;
  //     AnsweredQuestions++;
  //   }
  //   try {
  //     await FirebaseFirestore.instance.collection('result-quizes').doc(QuizID1).update({
  //       'id': question.id ?? '',
  //       'no_questions': AnsweredQuestions ?? 0,
  //       'userId': 1 ?? '',
  //       'correct_answer': noCorrectAnswers ?? 0,
  //       'wrong_answer': noWrongAnswers ?? 0,
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<dynamic> insertQuizData(String id, int noQuestions, String userId, int correctAnswer, int wrongAnswer) async {
  //   try {
  //     DocumentReference<Map<String, dynamic>> value = await FirebaseFirestore.instance.collection('result-quizes').add({
  //       'id': id ?? '',
  //       'no_questions': noQuestions ?? 0,
  //       'userId': userId ?? '',
  //       'correct_answer': correctAnswer ?? 0,
  //       'wrong_answer': wrongAnswer ?? 0,
  //     });
  //     // print(value.id);
  //     // print('dkks');
  //     return value.id.toString();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Getter for the User Steam.
  Stream<QuerySnapshot> get quizesList {
    return _quizList;
  }

  Future<void> saveQuizID(String QuizID1) async {
    QuizID = QuizID1;
    print('saveQuizID');
    print(QuizID);
  }

  Future<String> shareQuizID() async {

    return QuizID;
  }

}