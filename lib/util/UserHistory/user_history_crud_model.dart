

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/user_history_model.dart';
import 'package:flutter/material.dart';

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


}