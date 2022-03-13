import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/quiz.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  //final Firestore _db = Firestore.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<dynamic> readQuizes() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    List<Question> docs1 = [];

    try {
      querySnapshot = await _db.collection('quizes').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          // Map a = {
          //   "id": doc.id,
          //   "question": doc['question'],
          //   "answer": doc['answer'],
          //   "options": doc['options'],
          //   "imageUri": doc['imageUri']
          // };

          // docs.add(a);

          Question b = Question(
              id: doc.id.toString(),
              question: doc['question'].toString(),
              answer: doc['answer'].toString(),
              options: doc['options'],
              imageUri: doc['imageUri'].toString());

          // Question(
          //     id: doc.id.toString(),
          //     question: doc['question'].toString(),
          //     answer: doc['answer'].toString(),
          //     options: doc['options'],
          //     imageUri: doc['imageUri'].toString());

          print('erw');
          print(b);
          print('erroeee');

          docs1.add(b);
        }
        return docs1;
      }
    } catch (e) {
      print('error happening');
      print(e);
      print('error detected');
    }
  }
}
