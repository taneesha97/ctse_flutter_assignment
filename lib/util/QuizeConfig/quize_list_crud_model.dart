import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/quize_list_model.dart';
import 'package:flutter/cupertino.dart';

class QuizListCrudModel extends ChangeNotifier {

  final Stream<QuerySnapshot> _quizList =
  FirebaseFirestore.instance.collection('quice_list').snapshots();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  late List<int?> valueSet;

  String QuizID = '';

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
              id: doc.id,
              //id: doc['id'].toString(), // issue
              category: doc['category'].toString(),
              time: doc['time'],
              questions: doc['questions']);

          print('inside try ------------------------');
          print(b);
          docs1.add(b);
        }
         print("printing-------------------------------");
        print(docs1);
        return docs1;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> insertQuizListData(String? category, int? questions, int? time) async {
    try {
      DocumentReference<Map<String, dynamic>> value =
      await FirebaseFirestore.instance.collection('quice_list').add({
        'category': category ?? '',
        'questions': questions ?? '',
        'time': time ?? '',
      });
      return value.id.toString();
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> deleteQuizList(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('quice_list')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }


  // Library Name Update method
  Future libraryNameUpate(String newName, String libraryId) async {
    final doc =
    FirebaseFirestore.instance.collection("libraries").doc(libraryId);
    doc.update({
      "name": newName,
    });
  }


  Future<dynamic> updateListValues(String? category, int? questions, int? time, String? ListID1) async {
    print(category);
    print(questions);
    print(time);
    print(ListID1);
    try {
      await FirebaseFirestore.instance.collection('quice_list').doc(ListID1).update({
        'category': category ?? 0,
        'questions': questions ?? 0,
        'time': time ?? 0,
      });
    } catch (e) {
      print(e);
    }
  }

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