import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class TestingProvider extends ChangeNotifier {
  // QuerySnapshot.
  final QuerySnapshot _movieStreamStatic = FirebaseFirestore.instance.collection('movies').get() as QuerySnapshot<Object?>;

  TestingProvider() {

  }





}