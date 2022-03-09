import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CrudModel extends ChangeNotifier{

  //Testing
  String _testString = "Test Value 1";

  CrudModel(){
    this._testString = "Test Value 2";
  }

  // Steam Data For the Movies.
  final Stream<QuerySnapshot> _movieStream = FirebaseFirestore.instance.collection('movies').snapshots();

  // Getter for the User Steam.
  Stream<QuerySnapshot> get movies {
    return _movieStream;
  }

  // Getter for the private testing variable.
  String  get getTestString{
    return _testString;
  }

}