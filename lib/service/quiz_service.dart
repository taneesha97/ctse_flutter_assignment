import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/quiz.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  //final Firestore _db = Firestore.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<dynamic> readQuizes() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await _db.collection('quizes').get();
      print('sss');
      print(querySnapshot.docs);
      // if (querySnapshot.docs.isNotEmpty) {
      //   for (var doc in querySnapshot.docs.toList()) {
      //     Map a = {"id": doc.id, "title": doc['title']};

      //     docs.add(a);
      //   }
      //   return docs;
      // }
    } catch (e) {
      print(e);
    }
  }
}
