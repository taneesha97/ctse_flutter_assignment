import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CrudModel extends ChangeNotifier{

  // Steam Data For the Movies.
  final Stream<QuerySnapshot> _movieStream = FirebaseFirestore.instance.collection('movies').snapshots();

  // Getter for the User Steam.
  Stream<QuerySnapshot> get movies {
    return _movieStream;
  }
}