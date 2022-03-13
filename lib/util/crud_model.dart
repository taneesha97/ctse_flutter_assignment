import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/movie.dart';
import 'package:flutter/cupertino.dart';

class CrudModel extends ChangeNotifier{

  final Stream<QuerySnapshot> _movieStream = FirebaseFirestore.instance.collection('movies').snapshots();

  // Testing Constructor.
  CrudModel(){
    TestingMethod();
  }

  //Testing
  String _testString = "Test Value 1";

  // Getter for the User Steam.
  Stream<QuerySnapshot> get movies {
    return _movieStream;
  }

  // Getter for the private testing variable.
  Stream<List<Movie>>  get getListOfMovies{

    return _movieStream.map((event) => event.docs.map((e) => Movie(
        id: e.get("id"),
        title: e.get("name"),
        imageUrl: e.get("title"),
        description: e.get("id"),
        rating: e.get("id"),
        year: e.get("id"),
        duration: e.get("id"),
    )).toList());
  }

  void TestingMethod(){
    Stream<List<Movie>> movies = getListOfMovies;
    print("This is List of Movies From CrudModel - $movies");
  }


  // Steam a List of Books from (Method).


}