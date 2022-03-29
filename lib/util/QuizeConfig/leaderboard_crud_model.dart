import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../models/leaderboard_model.dart';

class LeaderBoardCrudModel extends ChangeNotifier {
  // Steam Data For the Leader board.
  final Stream<QuerySnapshot> _quizList =
  FirebaseFirestore.instance.collection('leaderboard').snapshots();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  late List<int?> valueSet;
  String QuizID = '';

  Future<dynamic> readLeaderBoard() async {
    QuerySnapshot querySnapshot;
    Stream<QuerySnapshot> _quizList;
    List docs = [];
    List<LeaderBoardModel> docs1 = [];

    try {
      querySnapshot = await _db.collection('leaderboard').get();
      _quizList = FirebaseFirestore.instance.collection('leaderboard').snapshots();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          LeaderBoardModel b = LeaderBoardModel(
              // id: doc['id'].toString(),
              id: doc.id,
              version: doc['version'].toString(),
              image: doc['image'],
              name: doc['name'],
              place: doc['place'],
              score: doc['score']);

          docs1.add(b);
        }
        print(docs1);
        return docs1;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> deleteLeaderboardItem(String id) async {
    print(id);
    try {
      await FirebaseFirestore.instance
          .collection('leaderboard')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  // Database get Stream Builder.
  Stream<List<LeaderBoardModel>> get getListOfLeaderBoxes {
    return FirebaseFirestore.instance
        .collection("leaderboard").orderBy('score', descending: true)
        .snapshots().map(
            (event) => event.docs.map((e) => LeaderBoardModel.fromMap(e.data(), e.id,)).toList());
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