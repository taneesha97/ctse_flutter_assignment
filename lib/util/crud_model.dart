import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CrudModel extends ChangeNotifier{

  final Stream<QuerySnapshot> _movieStream = FirebaseFirestore.instance.collection('movies').snapshots();

  // Testing Constructor.
  CrudModel();

  //Testing
  String _testString = "Test Value 1";

  // Steam Data For the Movies.

  // Getter for the User Steam.
  Stream<QuerySnapshot> get movies {
    return _movieStream;
  }

  // Getter for the private testing variable.
  String  get getTestString{
    return _testString;
  }

  // Steam a List of Books from (Method).


}